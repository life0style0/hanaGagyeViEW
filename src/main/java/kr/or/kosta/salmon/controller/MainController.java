package kr.or.kosta.salmon.controller;

import java.io.File;
import java.nio.file.Files;
import java.security.Principal;
import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.kosta.salmon.domain.HashTagGroupDTO;
import kr.or.kosta.salmon.domain.MainArticleDTO;
import kr.or.kosta.salmon.domain.MainChartDTO;
import kr.or.kosta.salmon.service.MainService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MainController {
	
	@Inject
	MainService mainService;
	
	
	@GetMapping("/main/home")
	public void mainHome(Principal principal, Model model) {
		log.info("main컨트롤러 진입");
		String user_id = principal.getName();
		ArrayList<HashTagGroupDTO> hashTagList = (ArrayList<HashTagGroupDTO>)mainService.getHashTagGroup(user_id);
		ArrayList<MainArticleDTO> articleList = (ArrayList<MainArticleDTO>)mainService.getListSprint1(user_id);
		MainChartDTO mainchartInfo = mainService.getChartTotalFee(user_id);
		
		log.info("null test " +user_id);
		if(mainchartInfo != null) {
			mainchartInfo.setCtGroupFee(mainService.getChartCategoryFee(user_id));
			log.info(mainchartInfo.toString());
		} 
		model.addAttribute("mainchartInfo", mainchartInfo);
		model.addAttribute("articleList", articleList);
		model.addAttribute("hashTagList", hashTagList);
	}
	
	@GetMapping("/main/image")
    @ResponseBody
    public ResponseEntity<byte[]> getImage(String fileName) {
        log.info("getImage : " + fileName);
        File file = new File("C:\\upload\\images\\" + fileName);

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
}
