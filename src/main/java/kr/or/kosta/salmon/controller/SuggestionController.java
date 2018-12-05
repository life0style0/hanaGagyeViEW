package kr.or.kosta.salmon.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.kosta.salmon.common.Criteria;
import kr.or.kosta.salmon.common.MyPageBuilder;
import kr.or.kosta.salmon.domain.SuggestionDTO;
import kr.or.kosta.salmon.service.SuggestionService;
import lombok.extern.log4j.Log4j;

/**
 * SuggestionController
 */
@Controller
@RequestMapping("/suggestion")
@Log4j
public class SuggestionController {

    @Inject
    private SuggestionService ss;

    @GetMapping
    public String getMain(Criteria criteria, Model model) {
        log.info("suggestion main ....");

        try {
            model.addAttribute("list", ss.getSuggestionListWithPaging(criteria));

            MyPageBuilder mpb = (new MyPageBuilder(ss.getTotalSuggestion(criteria))).build(criteria);

            model.addAttribute("pageBuilder", mpb);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "suggestion/main";
    }

    @GetMapping("/new")
    public @ResponseBody ResponseEntity<List<Object>> getNew(Criteria criteria) {
        log.info("getNew ..." + criteria);
        ResponseEntity<List<Object>> result = null;
        try {
            List<SuggestionDTO> sgts = ss.getSuggestionListWithPaging(criteria);
            MyPageBuilder mpb = (new MyPageBuilder(ss.getTotalSuggestion(criteria))).build(criteria);;
            List<Object> results = new ArrayList<>();
            results.add(sgts);
            results.add(mpb);
            result = new ResponseEntity<>(results, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            result = new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return result;
    }

    @GetMapping("/ppl")
    public String getPpl(Criteria criteria, Model model) {
        log.info("suggestion main ....");

        try {
            model.addAttribute("list", ss.getSuggestionListWithPaging(criteria));

            MyPageBuilder mpb = new MyPageBuilder(ss.getTotalSuggestion(criteria));
            mpb.build(criteria);

            model.addAttribute("pageBuilder", mpb);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "suggestion/main";
    }

    @GetMapping("/{sno}")
    public @ResponseBody ResponseEntity<SuggestionDTO> getSuggestion(@PathVariable("sno") Long sno) {
        ResponseEntity<SuggestionDTO> result = null;

        return result;
    }
}