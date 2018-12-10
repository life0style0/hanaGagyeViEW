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
import kr.or.kosta.salmon.domain.CategoryDTO_sjh;
import kr.or.kosta.salmon.domain.NewSuggestionDTO;
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
            model.addAttribute("recommendList", SS.getSuggestionListsByRecommend(criteria));
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
            List<SuggestionDTO> sgts = SS.getSuggestionListsByRecommend(criteria);
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
            model.addAttribute("article", SS.getSuggestion(sno));
            model.addAttribute("checkLike", SS.checkLike(principal.getName(), sno));
            model.addAttribute("checkFollow", SS.checkFollow(principal.getName(), sgt.getUserPsns().getUserId()));
            model.addAttribute("userId", principal.getName());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "suggestion/suggestion";
    }

    // @GetMapping(value = "/news")
    // public String newArticle(Principal principal, Model model) {
    //     log.info("newArticle...");
    //     List<CategoryDTO_sjh> categories = ;

    //     model.addAttribute("userId", principal.getName());
    //     return "suggestion/new";
    // }

    @PostMapping(value = "/news")
    public String insertArticle(NewSuggestionDTO newSuggestionDTO, Principal principal) {
        log.info("insertArticle...");
        newSuggestionDTO.setUserId(principal.getName());
        log.info(newSuggestionDTO);
        try {
            SS.insertArticle(newSuggestionDTO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/suggestion";
    }

    // /**
    // * 사용자 팔로 요청
    // *
    // * @param followId 팔로우 할 사용자 아이디
    // * @param principal 내 아이디
    // * @return
    // */
    // @GetMapping(value = "/follow/{followId}", produces = {
    // MediaType.TEXT_PLAIN_VALUE })
    // public ResponseEntity<String> followGet(@PathVariable("followId") String
    // followId, Principal principal) {
    // log.info(" 팔로 요청 from " + principal.getName() + " to " + followId);
    // // 팔로 처리
    // SNSS.askFollow(principal.getName(), followId);
    // return new ResponseEntity<>("success", HttpStatus.OK);
    // }

    // /**
    // * 사용자 팔로 취소 요청
    // *
    // * @param followId 팔로우 취소할 사용자 아이디
    // * @param principal 내 아이디
    // * @return
    // */
    // @GetMapping(value = "/unfollow/{followId}", produces = {
    // MediaType.TEXT_PLAIN_VALUE })
    // public ResponseEntity<String> unfollowGet(@PathVariable("followId") String
    // followId, Principal principal) {
    // log.info(" 언팔로 요청 from " + principal.getName() + " to " + followId);
    // SNSS.askUnfollow(principal.getName(), followId);
    // log.info("언팔 끝");
    // return new ResponseEntity<>("success", HttpStatus.OK);
    // }

    // /**
    // * 게시글 좋아요 요청
    // *
    // * @param articleId 게시글 아이디
    // * @param principal
    // * @return 갱신된 이 게시글 좋아요 수
    // */
    // @GetMapping(value = "/sns/like/{articleId}", produces = {
    // MediaType.TEXT_PLAIN_VALUE })
    // public ResponseEntity<String> likeGet(@PathVariable("articleId") int
    // articleId, Principal principal) {
    // log.info(" 좋아요 요청 from " + principal.getName() + " to " + articleId);
    // if (SNSS.likeArticle(principal.getName(), articleId)) {
    // return new
    // ResponseEntity<>(SNSS.getArticleByArticleId(articleId).getLikes().size() +
    // "", HttpStatus.OK);
    // } else {
    // return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    // }
    // }

    // /**
    // * 게시글 좋아요 취소 요청
    // *
    // * @param articleId 게시글 아이디
    // * @param principal
    // * @return 갱신된 이 게시글 좋아요 수
    // */
    // @GetMapping(value = "/sns/unlike/{article-id}", produces = {
    // MediaType.TEXT_PLAIN_VALUE })
    // public ResponseEntity<String> unlikeGet(@PathVariable("article-id") int
    // articleId, Principal principal) {
    // log.info(" 안좋아요 요청 from " + principal.getName() + " to " + articleId);
    // SNSS.unlikeArticle(principal.getName(), articleId);
    // return new
    // ResponseEntity<>(SNSS.getArticleByArticleId(articleId).getLikes().size() +
    // "", HttpStatus.OK);
    // }

}