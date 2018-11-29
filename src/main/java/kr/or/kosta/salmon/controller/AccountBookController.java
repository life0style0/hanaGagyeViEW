package kr.or.kosta.salmon.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.kosta.salmon.domain.AccountBookDTO;
import lombok.extern.log4j.Log4j;

/**
 * AccountBookController
 */
@Controller
@RequestMapping("/accountbook")
@Log4j
public class AccountBookController {
    
    @GetMapping(value="/calendar")
    public void calendar() {
        log.info("calendar...");
    }

    @PostMapping(value = "/calendar", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<List<AccountBookDTO>> getAccountBooks(@RequestParam("year") int year, @RequestParam("month") int month) {

        return null;
    }
    
}