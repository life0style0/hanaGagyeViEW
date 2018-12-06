package kr.or.kosta.salmon.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
    public String getMain(Criteria criteria, Model model, Principal principal) {
        log.info("suggestion main ....");
        criteria.setUserId(principal.getName());
        MyPageBuilder mpg = null;
        try {
            mpg = (new MyPageBuilder(ss.getTotalSuggestion(criteria))).build(criteria);
            model.addAttribute("newList", ss.getSuggestionListByPaging(criteria));
            model.addAttribute("likeList", ss.getSuggestionListsByLikes(criteria));
            model.addAttribute("pageBuilder", mpg);
            model.addAttribute("recommendList", ss.getSuggestionListsByRecommend(criteria));
            model.addAttribute("recommendPageBuilder", (new MyPageBuilder(ss.getTotalSuggestion(criteria))).build(criteria));

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
            List<SuggestionDTO> sgts = ss.getSuggestionListByPaging(criteria);
            MyPageBuilder mpb = (new MyPageBuilder(ss.getTotalSuggestion(criteria))).build(criteria);
            List<Object> results = new ArrayList<>();
            results.add(sgts);
            results.add(mpb);
            result = new ResponseEntity<>(results, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return result;
    }

    @GetMapping("/like")
    public @ResponseBody ResponseEntity<List<Object>> getLike(Criteria criteria) {
        log.info("getLike ..." + criteria);
        ResponseEntity<List<Object>> result = null;
        try {
            List<SuggestionDTO> sgts = ss.getSuggestionListsByLikes(criteria);
            MyPageBuilder mpb = (new MyPageBuilder(ss.getTotalSuggestion(criteria))).build(criteria);
            List<Object> results = new ArrayList<>();
            results.add(sgts);
            results.add(mpb);
            result = new ResponseEntity<>(results, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return result;
    }

    @GetMapping("/article/{sno}")
    public @ResponseBody ResponseEntity<SuggestionDTO> getSuggestion(@PathVariable("sno") String sno) {
        ResponseEntity<SuggestionDTO> result = null;
        try {
            result = new ResponseEntity<>(ss.getSuggestion(sno), HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return result;
    }
}