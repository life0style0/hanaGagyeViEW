package kr.or.kosta.salmon.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.kosta.salmon.common.Criteria;
import kr.or.kosta.salmon.common.MyPageBuilder;
import kr.or.kosta.salmon.common.PsnScore;
import kr.or.kosta.salmon.domain.NewSuggestionDTO;
import kr.or.kosta.salmon.domain.PsnScoreDTO;
import kr.or.kosta.salmon.domain.PsnsDTO;
import kr.or.kosta.salmon.domain.SuggestionDTO;
import kr.or.kosta.salmon.domain.SuggestionStatusDTO;
import kr.or.kosta.salmon.service.SNSService;
import kr.or.kosta.salmon.service.SuggestionService;
import kr.or.kosta.salmon.service.UserService;
import lombok.extern.log4j.Log4j;

/**
 * SuggestionController
 */
@Controller
@RequestMapping("/suggestion")
@Log4j
public class SuggestionController {

    @Inject
    private SuggestionService SS;

    @Inject
    private SNSService SNSS;

    @Inject
    private UserService US;

    @GetMapping
    public String getMain(Criteria criteria, Model model, Principal principal) {
        log.info("suggestion main ....");
        criteria.setUserId(principal.getName());
        criteria.setArticleProposalStatus("R");
        MyPageBuilder mpg = null;
        try {
            PsnsDTO psns = SS.getPsnsWithSuggestion(principal.getName());
            List<SuggestionStatusDTO> lists = psns.getSuggestionStatusDTO();
            Long likeNum = 0L;
            Long sNum = 0L;
            for (SuggestionStatusDTO dto : lists) {
                likeNum += dto.getArticleLikeNum();
                sNum += dto.getArticleProposalNum();
            }
            model.addAttribute("likeNum", likeNum);
            model.addAttribute("sNum", sNum);
            model.addAttribute("psns", SS.getPsnsWithSuggestion(principal.getName()));

            mpg = (new MyPageBuilder(SS.getTotalSuggestion(criteria))).build(criteria);
            model.addAttribute("newList", SS.getSuggestionListByPaging(criteria));
            model.addAttribute("likeList", SS.getSuggestionListsByLikes(criteria));
            model.addAttribute("pageBuilder", mpg);
            model.addAttribute("recommendList", SS.getSuggestionListsByRecommend2(criteria));
            mpg = (new MyPageBuilder(SS.getTotalSuggestionByRecommend(criteria))).build(criteria);
            model.addAttribute("recommendPageBuilder", mpg);
            criteria.setArticleProposalStatus("J");
            model.addAttribute("judgeList", SS.getSuggestionListByPaging(criteria));
            mpg = (new MyPageBuilder(SS.getTotalSuggestion(criteria))).build(criteria);
            model.addAttribute("judgePageBuilder", mpg);
            criteria.setArticleProposalStatus("C");
            model.addAttribute("confirmList", SS.getSuggestionListByPaging(criteria));
            mpg = (new MyPageBuilder(SS.getTotalSuggestion(criteria))).build(criteria);
            model.addAttribute("confirmPageBuilder", mpg);
            criteria.setArticleProposalStatus("F");
            model.addAttribute("finishList", SS.getSuggestionListByPaging(criteria));
            mpg = (new MyPageBuilder(SS.getTotalSuggestion(criteria))).build(criteria);
            model.addAttribute("finishPageBuilder", mpg);
            model.addAttribute("categories", US.getAllCategories());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "suggestion/main";
    }

    @GetMapping(value = "/new", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
    public @ResponseBody ResponseEntity<List<Object>> getNew(Criteria criteria) {
        log.info("getNew ..." + criteria);
        ResponseEntity<List<Object>> result = null;
        criteria.setArticleProposalStatus("R");
        try {
            List<SuggestionDTO> sgts = SS.getSuggestionListByPaging(criteria);
            MyPageBuilder mpb = (new MyPageBuilder(SS.getTotalSuggestion(criteria))).build(criteria);
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

    @GetMapping(value = "/like", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
    public @ResponseBody ResponseEntity<List<Object>> getLike(Criteria criteria) {
        log.info("getLike ..." + criteria);
        ResponseEntity<List<Object>> result = null;
        try {
            List<SuggestionDTO> sgts = SS.getSuggestionListsByLikes(criteria);
            MyPageBuilder mpb = (new MyPageBuilder(SS.getTotalSuggestion(criteria))).build(criteria);
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

    @GetMapping(value = "/recommend", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
    public @ResponseBody ResponseEntity<List<Object>> getRecommend(Criteria criteria) {
        log.info("getRecommend ..." + criteria);
        criteria.setArticleProposalStatus("R");
        ResponseEntity<List<Object>> result = null;
        try {
            List<SuggestionDTO> sgts = SS.getSuggestionListsByRecommend2(criteria);
            MyPageBuilder mpb = (new MyPageBuilder(SS.getTotalSuggestionByRecommend(criteria))).build(criteria);
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

    @GetMapping(value = "/judge", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
    public @ResponseBody ResponseEntity<List<Object>> getJudge(Criteria criteria) {
        log.info("getJudge ..." + criteria);

        criteria.setArticleProposalStatus("J");
        ResponseEntity<List<Object>> result = null;
        try {
            List<SuggestionDTO> sgts = SS.getSuggestionListByPaging(criteria);
            MyPageBuilder mpb = (new MyPageBuilder(SS.getTotalSuggestion(criteria))).build(criteria);
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

    @GetMapping(value = "/confirm", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
    public @ResponseBody ResponseEntity<List<Object>> getConfirm(Criteria criteria) {
        log.info("getJudge ..." + criteria);

        criteria.setArticleProposalStatus("C");
        ResponseEntity<List<Object>> result = null;
        try {
            List<SuggestionDTO> sgts = SS.getSuggestionListByPaging(criteria);
            MyPageBuilder mpb = (new MyPageBuilder(SS.getTotalSuggestion(criteria))).build(criteria);
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

    @PostMapping("/article/{sno}")
    public String getSuggestion(@PathVariable("sno") String sno, @ModelAttribute("cri") Criteria criteria, Model model,
            Principal principal) {
        log.info("suggestion...." + sno);
        try {
            model.addAttribute("checkLike", SS.checkLike(principal.getName(), sno));
            log.info("");
            SuggestionDTO sgt = SS.getSuggestion(sno);
            model.addAttribute("article", sgt);
            model.addAttribute("checkLike", SS.checkLike(principal.getName(), sno));
            model.addAttribute("checkFollow", SS.checkFollow(principal.getName(), sgt.getUserPsns().getUserId()));
            model.addAttribute("userId", principal.getName());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "suggestion/suggestion";
    }

    @PostMapping(value = "/news")
    public String insertArticle(NewSuggestionDTO newSuggestionDTO, Principal principal) {
        log.info("insertArticle...");
        newSuggestionDTO.setUserId(principal.getName());
        newSuggestionDTO.setAmount(PsnScore.CREATE_ARTICLE);
        try {
            SS.insertArticle(newSuggestionDTO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/suggestion";
    }

}