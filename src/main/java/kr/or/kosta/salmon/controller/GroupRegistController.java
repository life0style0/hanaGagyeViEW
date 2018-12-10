package kr.or.kosta.salmon.controller;
import java.io.File;
import java.nio.file.Files;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
/**
 * 그룹 가입 처리
 * @author 이혜림
 */
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.kosta.salmon.domain.CategoryDTO_sjh;
import kr.or.kosta.salmon.domain.Criteria;
import kr.or.kosta.salmon.domain.GroupCountDTO;
import kr.or.kosta.salmon.domain.GroupDTO_lhr;
import kr.or.kosta.salmon.domain.HashTagGroupDTO;
import kr.or.kosta.salmon.domain.SNSArticleDTO_sjh;
import kr.or.kosta.salmon.service.GroupService;
import kr.or.kosta.salmon.service.SNSService;
import kr.or.kosta.salmon.service.UserService;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/group/*")
@Controller
public class GroupRegistController {
	
	@Inject
	GroupService groupservice;
	
	@Inject
	SNSService snsService;
	
	@Inject
	UserService userService;
	
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("리스트 화면 : 소모임 페이지 메인 화면 !!!!!!");
		log.info("list:" + cri);
		groupservice.getList();
		
		//카테고리 정보 가져오기
		List<CategoryDTO_sjh> categories = groupservice.getAllCategories();
		model.addAttribute("categories", categories);
		model.addAttribute("list", groupservice.getList());
	}

	@GetMapping("/register")
	public void regist(Model model) {
		log.info(" 소모임 등록 페이지 요청 !!!!!!!!!!!!!!!!!!!!");
		List<CategoryDTO_sjh> categories= groupservice.getAllCategories();
		model.addAttribute("categories", categories);
	}
	
	
	//register : post
	@PostMapping("/register")
	public String register(GroupDTO_lhr group, RedirectAttributes rttr) {
		log.info("============ 소모임 등록 처리 시작 ============ : "+ group);
		log.info("groupservice :" + groupservice);

		log.info(group);
		
		groupservice.groupRegist(group);
		log.info("소모임 등록 완료!!!!! 성공성공 DB확인해보자!!! ");
		rttr.addFlashAttribute("registRes","success");
		rttr.addFlashAttribute("group_id",group.getGroup_id());
		return "redirect:/group/list";
	}
	//소모임 상세 조회 페이지 만들기 : 필요- 게시판 내용 
	@GetMapping("/get")
	public void get(@RequestParam("group_id") String group_id, Model model, Principal principal) {
		log.info("/get");
		log.info("********** 소모임 그룹 상세 페이지 **********");
		log.info("GetMapping에서 그룹 아이디 (혜림체크) : "+group_id);
		model.addAttribute("groups", groupservice.get(group_id));
		
		
		String user_id = principal.getName();
//		ArrayList<HashTagGroupDTO> hashTagList = (ArrayList)groupservice.getHashTagGroup(user_id);
		ArrayList<SNSArticleDTO_sjh> articleList = (ArrayList)groupservice.getSNSGroups(group_id);
		
		model.addAttribute("articleList", articleList);
		log.info("유저아이디-------"+user_id);
		log.info("아티클리스트-------"+articleList);
//		model.addAttribute("hashTagList", hashTagList);
		
		
		//ArrayList SNS Article
/*		ObjectMapper objmapper = new ObjectMapper();
		try {
			String articleListJSON= objmapper.writeValueAsString(articleList);
			model.addAttribute("articleListJSON", articleListJSON);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}*/
		
		// 이 페이지 GroupId의 모든 게시물 
	
	}
	// 화면 이미지 얻어오기 
	@GetMapping("/get/image")
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
	
	
	//소모임 회원으로 가입 처리 
	@PostMapping("/get")
	public String get1(@RequestParam("group_id") String group_id, Model model, Principal principal) {
		log.info("/get1");
		log.info("그룹 아이디 [getMethod] =====: "+ group_id );
		log.info("Model 결과 : [getMethod] =====: "+ model);
		log.info("Principal 결과 : [getMethod] =====: "+ principal);

		
		//model.addAttribute("group_id", group_id);
		GroupCountDTO gcdto =  groupservice.getCount(group_id);
		if(gcdto.getMax() <= gcdto.getNow()) {
			model.addAttribute("check", "fail");
			return "redirect:/group/join-confirm";
		} else {
			int temp = groupservice.joinGroup(group_id, principal.getName());
			if( temp > 0 ) {
				model.addAttribute("check", "success");
				log.info(group_id);
				return "redirect:/group/join-confirm";

			} else {
				model.addAttribute("check", "fail");
				return "redirect:/group/join-confirm";
			}
		}
	}
	
	@GetMapping("/join-confirm")
	public void joinConfirm() {
		log.info("소모임 회원으로 가입 결과 페이지 요청");
	}
	
	/**
	 * 게시글 신고
	 */

}
