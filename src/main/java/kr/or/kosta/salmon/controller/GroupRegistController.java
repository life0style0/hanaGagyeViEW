package kr.or.kosta.salmon.controller;
import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

/**
 * 그룹 가입 처리
 * @author 이혜림
 */
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.kosta.salmon.domain.CategoryDTO_sjh;
import kr.or.kosta.salmon.domain.Criteria;

import kr.or.kosta.salmon.domain.GroupDTO_lhr;
import kr.or.kosta.salmon.service.GroupService;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/group/*")
@Controller
public class GroupRegistController {
	
	@Inject
	GroupService groupservice;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("리스트 화면 : 소모임 페이지 메인 화면 !!!!!!");
		log.info("list:" + cri);
		groupservice.getList();
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
	//조회 페이지 만들기 
	
	@GetMapping("/get")
	public void get(@RequestParam("group_id") String group_id, Model model) {
		log.info("/get");
		log.info("그룹 아이디 들어와 ? : "+group_id);
		model.addAttribute("groups", groupservice.get(group_id));
	}
	
	//소모임 회원으로 가입 처리 
	@PostMapping("/get")
	public String get1(@RequestParam("group_id") String group_id, Model model, Principal principal) {
		log.info("/get");
		log.info("그룹 아이디 [getMethod] =====: "+group_id);
		log.info("Model 결과 : [getMethod] =====: "+model);
		log.info("Principal 결과 : [getMethod] =====: "+principal);

		
		model.addAttribute("group_id", group_id);
		GroupCountDTO gcdto =  groupservice.getCount(group_id);
		if(gcdto.getMax() <= gcdto.getNow()) {
			model.addAttribute("check", "fail");
			return "redirect:/group/join-confirm}";
		} else {
			if(groupservice.joinGroup(group_id, principal.getName()) > 0 ) {
				model.addAttribute("check", "success");
				groupservice.joinGroup(group_id, user_id);
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
	

}
