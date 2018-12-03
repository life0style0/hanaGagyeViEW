package kr.or.kosta.salmon.controller;

import java.io.File;
import java.nio.file.Files;
import java.security.Principal;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.kosta.salmon.domain.ImageDTO;
import kr.or.kosta.salmon.service.ImageService;
import lombok.extern.log4j.Log4j;

/**
 * ImageController
 */
@Controller
@RequestMapping("/image")
@Log4j
public class ImageController {

    @Inject
    private ImageService IS;

    @GetMapping
    @ResponseBody
    public ResponseEntity<byte[]> getImage(String fileName) {
        log.info("getImage : " + fileName);
        File file = new File("C:\\WebData\\upload\\temp\\" + fileName);

        ResponseEntity<byte[]> result = null;

        try {
            HttpHeaders header = new HttpHeaders();
            header.add("Content-Type", Files.probeContentType(file.toPath()));
            result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), HttpStatus.OK);
        } catch (Exception e) {
            result = new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return result;
    }

    @PostMapping("/profileimage")
    public ResponseEntity<String> registProgileImage(@RequestParam("profileImage") MultipartFile uploadFile,
            Principal principal) {
        log.info("formData check : " + uploadFile);
        log.info("formData size : " + uploadFile.getSize());
        String uploadFolder = "C:\\Webdata\\upload";
        File uploadPath = new File(uploadFolder, "\\images");
        log.info("upload path:" + uploadPath);
        if (uploadPath.exists() == false) {
            uploadPath.mkdirs();
        }

        log.info("----------테스트-----------");
        log.info("upload file name : " + uploadFile.getOriginalFilename());
        log.info("upload File size: " + uploadFile.getSize());
        String uploadFileName = uploadFile.getOriginalFilename();
        uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
        log.info("only file name : " + uploadFileName);
        UUID uuid = UUID.randomUUID();

        uploadFileName = uuid.toString() + "_" + uploadFileName;
        File saveFile = new File(uploadPath, uploadFileName);
        try {
            IS.registProfileImage(uploadFileName, principal.getName());
            uploadFile.transferTo(saveFile);
        } catch (Exception e) {
            log.error(e.getMessage());
        }
        return new ResponseEntity<>("success", HttpStatus.OK);
    }
}