package kr.or.kosta.salmon.controller;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.kosta.salmon.domain.AccountBookDTO;
import kr.or.kosta.salmon.service.AccountBookService;
import lombok.extern.log4j.Log4j;

/**
 * AccountBookController
 */
@Controller
@RequestMapping("/accountbook")
@Log4j
public class AccountBookController {

    @Inject
    private AccountBookService abs;

    @GetMapping(value = "/calendar")
    public void calendar() {
        log.info("calendar...");
    }

    @GetMapping(value = "/ggv", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
    public @ResponseBody ResponseEntity<List<AccountBookDTO>> getAccountBooks(@RequestParam("year") int year,
            @RequestParam("month") int month, Principal principal) {
        log.info("calendar get....");
        List<AccountBookDTO> abDTOs = null;
        ResponseEntity<List<AccountBookDTO>> rEntity = null;
        try {
            abDTOs = abs.getAccountBooks(principal.getName(), year, month);
            rEntity = new ResponseEntity<>(abDTOs, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            rEntity = new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return rEntity;
    }

    @GetMapping(value = "/ggv/{articleId}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
    public @ResponseBody ResponseEntity<AccountBookDTO> getAccountBook(@PathVariable("articleId") int articleId, Principal principal) {
        log.info("getAccountBook request....");
        AccountBookDTO abDTO = null;
        ResponseEntity<AccountBookDTO> rEntity = null;
        try {
            abDTO = abs.getAccountBookByArticleId(principal.getName(), articleId);
            rEntity = new ResponseEntity<>(abDTO, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            rEntity = new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return rEntity;
    }
}