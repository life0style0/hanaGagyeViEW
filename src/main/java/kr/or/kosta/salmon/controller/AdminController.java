package kr.or.kosta.salmon.controller;


import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.kosta.salmon.domain.AdminArticleInfoArtiCtgryDTO;
import kr.or.kosta.salmon.domain.AdminArticleInfoCtgryCtDTO;
import kr.or.kosta.salmon.domain.AdminArticleInfoHashTagTopDTO;
import kr.or.kosta.salmon.domain.AdminArticleInfoRegistDTO;
import kr.or.kosta.salmon.domain.AdminArticleInfoWordDTO;
import kr.or.kosta.salmon.domain.AdminFollowerTopDTO;
import kr.or.kosta.salmon.domain.AdminGetUserCtgryDTO;
import kr.or.kosta.salmon.domain.AdminPayInfoAvgDTO;
import kr.or.kosta.salmon.domain.AdminPayInfoAvgGroupBYAgeDTO;
import kr.or.kosta.salmon.domain.AdminPayInfoPstageDTO;
import kr.or.kosta.salmon.domain.AdminPayInfoTotalDTO;
import kr.or.kosta.salmon.domain.AdminPaymentInfoRankDTO;
import kr.or.kosta.salmon.domain.AdminPaymentTypeDTO;
import kr.or.kosta.salmon.domain.AdminPropArticleInfoDTO;
import kr.or.kosta.salmon.domain.AdminPropSetStatusDTO;
import kr.or.kosta.salmon.domain.AdminReportReasonDTO;
import kr.or.kosta.salmon.domain.AdminUserInfoDTO;
import kr.or.kosta.salmon.domain.AdminUserManageInfoDTO;
import kr.or.kosta.salmon.domain.ArticleDTO;
import kr.or.kosta.salmon.service.AdminService;
import kr.or.kosta.salmon.service.GaArticleService;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/admin/*")
@Controller
public class AdminController {
	
	@Inject
	AdminService adminService;
	
	@Inject
	GaArticleService gaArticleService;
	
	@GetMapping("/index")
	public void userInfo(Model model) {
		HashMap<String, Integer> ageGroupHash = new HashMap<>();
		AdminUserInfoDTO adminUserInfoDTO = new AdminUserInfoDTO();
		int ageGroup = 0;
		
		//카테고리 사전작업
		ArrayList<AdminGetUserCtgryDTO> userCtgryList = new ArrayList<>();
		HashMap<String, Integer> ctgryHash = new HashMap<>();
		userCtgryList = adminService.getUserCategory1();
		int ctgryTotal = 0; 
		
		for(AdminGetUserCtgryDTO dto : userCtgryList){
			if(ctgryHash.get(dto.getCtgry_name())==null){
				ctgryHash.put(dto.getCtgry_name(), dto.getCtgry_ct());
			}else{
				ctgryHash.put(dto.getCtgry_name(), ctgryHash.get(dto.getCtgry_name())+dto.getCtgry_ct());
			}
			ctgryTotal+= dto.getCtgry_ct();
		}
		userCtgryList = adminService.getUserCategory2();
		for(AdminGetUserCtgryDTO dto : userCtgryList){
			if(ctgryHash.get(dto.getCtgry_name())==null){
				ctgryHash.put(dto.getCtgry_name(), dto.getCtgry_ct());
			}else{
				ctgryHash.put(dto.getCtgry_name(), ctgryHash.get(dto.getCtgry_name())+dto.getCtgry_ct());
			}	
			ctgryTotal+= dto.getCtgry_ct();
		}
		userCtgryList = adminService.getUserCategory3();
		for(AdminGetUserCtgryDTO dto : userCtgryList){
			if(ctgryHash.get(dto.getCtgry_name())==null){
				ctgryHash.put(dto.getCtgry_name(), dto.getCtgry_ct());
			}else{
				ctgryHash.put(dto.getCtgry_name(), ctgryHash.get(dto.getCtgry_name())+dto.getCtgry_ct());
			}	
			ctgryTotal+= dto.getCtgry_ct();
		}

		ArrayList<String> sortList = (ArrayList)sortByValue(ctgryHash);
		userCtgryList = new ArrayList<>();
		int tempCt = 0;
		for(String ctgry : sortList){
			tempCt++;
			AdminGetUserCtgryDTO tempDto = new AdminGetUserCtgryDTO();
			tempDto.setCtgry_name(ctgry);
			tempDto.setCtgry_ct(ctgryHash.get(ctgry));
			userCtgryList.add(tempDto);
			if(tempCt>=5){
				break;
			}
		}

		//follower 정보 가져오기
		ArrayList<AdminFollowerTopDTO> followerTopList= null;
		ArrayList<AdminFollowerTopDTO> temp = adminService.getFollowerTop();
		if(temp.size() <5){
			followerTopList = new ArrayList<>(temp.subList(0, temp.size()));
		}else if(temp.size() >=5){
			followerTopList = new ArrayList<>(temp.subList(0, 5));
		}
		//수입 지출 성별에 따른 데이터 set 만들기
		ArrayList<AdminPaymentTypeDTO> paymentDTO = adminService.getPaymentType();
		HashMap<String, HashMap<String, Integer>> paymentHashSetMale = new HashMap<>();
		HashMap<String, HashMap<String, Integer>> paymentHashSetFemale = new HashMap<>();

		for(AdminPaymentTypeDTO tempPay : paymentDTO){
			if(paymentHashSetMale.containsKey(tempPay.getUser_id())){
				HashMap<String, Integer> tempType = paymentHashSetMale.get(tempPay.getUser_id());
				tempType.put(Integer.toString(tempPay.getArticle_ctgry_id()), tempPay.getPayment_sum());
				paymentHashSetMale.put(tempPay.getUser_id(), tempType);
			}else if(paymentHashSetFemale.containsKey(tempPay.getUser_id())){
				HashMap<String, Integer> tempType = paymentHashSetFemale.get(tempPay.getUser_id());
				tempType.put(Integer.toString(tempPay.getArticle_ctgry_id()), tempPay.getPayment_sum());
				paymentHashSetFemale.put(tempPay.getUser_id(), tempType);
			}else{
				if(tempPay.getUser_gender().equals("M")){
					HashMap<String, Integer> tempType = new HashMap<>();
					tempType.put(Integer.toString(tempPay.getArticle_ctgry_id()), tempPay.getPayment_sum());
					paymentHashSetMale.put(tempPay.getUser_id(), tempType);
				}else if(tempPay.getUser_gender().equals("F")){
					HashMap<String, Integer> tempType = new HashMap<>();
					tempType.put(Integer.toString(tempPay.getArticle_ctgry_id()), tempPay.getPayment_sum());
					paymentHashSetFemale.put(tempPay.getUser_id(), tempType);
				}
			}
		}
		
		ArrayList<HashMap<String, Integer>> paymentListMale = new ArrayList<HashMap<String, Integer>>();
		ArrayList<HashMap<String, Integer>> paymentListFemale = new ArrayList<HashMap<String, Integer>>();
		
		for(HashMap.Entry<String,HashMap<String,Integer>> entry : paymentHashSetMale.entrySet()){
			paymentListMale.add(entry.getValue());
		}
		for(HashMap.Entry<String,HashMap<String,Integer>> entry : paymentHashSetFemale.entrySet()){
			paymentListFemale.add(entry.getValue());
		}
		
		ageGroup=20;
		ageGroupHash.put("20대", adminService.getAgeGroupCount(ageGroup));
		ageGroup=30;
		ageGroupHash.put("30대", adminService.getAgeGroupCount(ageGroup));
		ageGroup=40;
		ageGroupHash.put("40대", adminService.getAgeGroupCount(ageGroup));
		adminUserInfoDTO.setAgeGroupHash(ageGroupHash);
		adminUserInfoDTO.setGenderGroup(adminService.getGroupByGender());
		adminUserInfoDTO.setTotalUser(adminService.getTotalUser());
		adminUserInfoDTO.setRegistGroupByMonth(adminService.getRegistGroupMonth());
		adminUserInfoDTO.setGetUserCtgry(userCtgryList);
		adminUserInfoDTO.setCtgryTotal(ctgryTotal);
		adminUserInfoDTO.setFollowerTopList(followerTopList);
		adminUserInfoDTO.setPaymentListFemale(paymentListFemale);
		adminUserInfoDTO.setPaymentListMale(paymentListMale);
		log.info("한번봅시다 : "+adminUserInfoDTO.toString());
		model.addAttribute("adminUserInfoDTO", adminUserInfoDTO);
	
		log.info(" admin테스트중 ");
	}
	
	
	@GetMapping("/paymentInfo")
	public void payInfo(Model model) {
		AdminPayInfoTotalDTO adminPayInfoTotal =  adminService.getTotalInfo();
		AdminPayInfoAvgDTO adminPayInfoAvgMax = adminService.getMaxAvgCtgry();
		AdminPayInfoAvgDTO adminPayInfoAvgMin = adminService.getMinAvgCtgry();
		//메인차트 데이타 셋
		ArrayList<String> ctgryList = gaArticleService.getCategory();
		HashMap<String, ArrayList<AdminPayInfoAvgGroupBYAgeDTO>> groupByAgeHashMap = new HashMap<>();
		ArrayList<AdminPayInfoAvgGroupBYAgeDTO> adminPayInfoAvgGroupBYAgeList = adminService.getAvgCtgryByAge(10);
		groupByAgeHashMap.put("10대", adminPayInfoAvgGroupBYAgeList);
		adminPayInfoAvgGroupBYAgeList = adminService.getAvgCtgryByAge(20);
		groupByAgeHashMap.put("20대", adminPayInfoAvgGroupBYAgeList);
		adminPayInfoAvgGroupBYAgeList = adminService.getAvgCtgryByAge(30);
		groupByAgeHashMap.put("30대", adminPayInfoAvgGroupBYAgeList);
		log.info("해쉬맵 : " + groupByAgeHashMap);
		int ageGroup = 10;
		ArrayList<AdminPayInfoPstageDTO> adminPayInfoPstageList;
		HashMap<String, ArrayList<AdminPayInfoPstageDTO>> adminPayInfoPstageIncomeHash = new HashMap<>();
		HashMap<String, ArrayList<AdminPayInfoPstageDTO>> adminPayInfoPstageSpendHash = new HashMap<>();
		ArrayList<Integer> incomeTotalList = new ArrayList<>();
		ArrayList<Integer> spendTotalList = new ArrayList<>();
		for(int i= 1; i< 4; i++){
			ageGroup = ageGroup*i;
			if(adminService.getIncomeCtgryPersentage(ageGroup)!=null){
				adminPayInfoPstageList = adminService.getIncomeCtgryPersentage(ageGroup);
				adminPayInfoPstageIncomeHash.put(Integer.toString(ageGroup), adminPayInfoPstageList);
			}
			if(adminService.getSpendCtgryPersentage(ageGroup)!=null){
				adminPayInfoPstageList = adminService.getSpendCtgryPersentage(ageGroup);
				adminPayInfoPstageSpendHash.put(Integer.toString(ageGroup), adminPayInfoPstageList);
			}
			if(adminService.getIncomeTotalGroupByAge(ageGroup)!= -1){
				incomeTotalList.add(adminService.getIncomeTotalGroupByAge(ageGroup));
			}
			if(adminService.getSpendTotalGroupByAge(ageGroup)!=-1){
				spendTotalList.add(adminService.getSpendTotalGroupByAge(ageGroup));
			}
		}
		
		//랭킹정보
		HashMap<String, ArrayList<HashMap<String,Integer>>> rankInfoHash = new HashMap<>();
		ArrayList<AdminPaymentInfoRankDTO> rankList = adminService.getRankByLocationAndCtgry();
		
	
		for(AdminPaymentInfoRankDTO tempRankDto : rankList){
			if(rankInfoHash.containsKey(tempRankDto.getLocation_name())){
				HashMap<String, Integer> tempHash = new HashMap<>();
				tempHash.put(tempRankDto.getCtgry_name(), tempRankDto.getAvg_fee());
				rankInfoHash.get(tempRankDto.getLocation_name()).add(tempHash);
			}else{
				ArrayList<HashMap<String, Integer>> tempRankList = new ArrayList<>();
				HashMap<String, Integer> tempHash = new HashMap<>();
				tempHash.put(tempRankDto.getCtgry_name(), tempRankDto.getAvg_fee());
				tempRankList.add(tempHash);
				rankInfoHash.put(tempRankDto.getLocation_name(), tempRankList);
			}
		}
		
		HashMap<String, ArrayList<HashMap<String,Integer>>> rankInfoHashIncome = new HashMap<>();
		ArrayList<AdminPaymentInfoRankDTO> rankListIncome = adminService.getRankByLocationAndCtgryIncome();
		
	
		for(AdminPaymentInfoRankDTO tempRankDto : rankListIncome){
			if(rankInfoHashIncome.containsKey(tempRankDto.getLocation_name())){
				HashMap<String, Integer> tempHash = new HashMap<>();
				tempHash.put(tempRankDto.getCtgry_name(), tempRankDto.getAvg_fee());
				rankInfoHashIncome.get(tempRankDto.getLocation_name()).add(tempHash);
			}else{
				ArrayList<HashMap<String, Integer>> tempRankList = new ArrayList<>();
				HashMap<String, Integer> tempHash = new HashMap<>();
				tempHash.put(tempRankDto.getCtgry_name(), tempRankDto.getAvg_fee());
				tempRankList.add(tempHash);
				rankInfoHashIncome.put(tempRankDto.getLocation_name(), tempRankList);
			}
		}
		
		
		
		
		ArrayList<String> locationList = adminService.getLoactionInfo();
		log.info("지역 길이 : " + locationList.size());
		
		
		model.addAttribute("adminPayInfoTotal", adminPayInfoTotal);
		model.addAttribute("adminPayInfoAvgMax", adminPayInfoAvgMax);
		model.addAttribute("adminPayInfoAvgMin", adminPayInfoAvgMin);
		model.addAttribute("ctgryList", ctgryList);
		model.addAttribute("groupByAgeHashMap", groupByAgeHashMap);
		model.addAttribute("spendTotalList", spendTotalList);
		model.addAttribute("incomeTotalList", incomeTotalList);
		model.addAttribute("adminPayInfoPstageSpendHash", adminPayInfoPstageSpendHash);
		model.addAttribute("adminPayInfoPstageIncomeHash", adminPayInfoPstageIncomeHash);
		model.addAttribute("rankInfoHash", rankInfoHash);
		model.addAttribute("rankInfoHashIncome", rankInfoHashIncome);
		model.addAttribute("locationList", locationList);
		System.out.println(rankInfoHash);
		System.out.println(rankInfoHashIncome);
	}
	
	@GetMapping("/articleInfo")
	public void articleInfo(Model model) {
		ArrayList<AdminArticleInfoWordDTO> wordList = adminService.getHashTagWordCloud();
		ArrayList<AdminArticleInfoCtgryCtDTO> ctgrySummaryList = adminService.getArticleCountByCtgry();
		int hashTagTotalCt = adminService.getHashTagTotalCt();
		ArrayList<AdminArticleInfoHashTagTopDTO> hashTopList = adminService.getHashTagTopList();
		ArrayList<AdminArticleInfoArtiCtgryDTO> artiCtgryList = adminService.getArticleCategoryList();
		int articleCtgryTotal = adminService.getArticleCategoryTotal();
		ArrayList<AdminArticleInfoRegistDTO> registCtSpendList = adminService.getArticleRegistSpend();
		ArrayList<AdminArticleInfoRegistDTO> registCtIncomeList = adminService.getArticleRegistIncome();
		
		
		model.addAttribute("wordList", wordList);
		model.addAttribute("ctgrySummaryList", ctgrySummaryList);
		model.addAttribute("hashTagTotalCt", hashTagTotalCt);
		model.addAttribute("hashTopList", hashTopList);
		model.addAttribute("artiCtgryList", artiCtgryList);
		model.addAttribute("articleCtgryTotal", articleCtgryTotal);
		model.addAttribute("registCtSpendList", registCtSpendList);
		model.addAttribute("registCtIncomeList", registCtIncomeList);
	}
	
	@GetMapping("/articleManage")
	public void articleManage(Model model) {
		ArrayList<ArticleDTO> reportArticleList = adminService.getReportTargetArticle();
		model.addAttribute("reportArticleList",reportArticleList);
	}
	
	@GetMapping(value = "/reportShow", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public @ResponseBody ResponseEntity<ArrayList<AdminReportReasonDTO>> reportShow(Model model, int article_id){
		 ArrayList<AdminReportReasonDTO> adminReportList = null;
	     ResponseEntity<ArrayList<AdminReportReasonDTO>> rEntity = null;
	     try {
	    	 	adminReportList = adminService.getReportReason(article_id);
	            rEntity = new ResponseEntity<ArrayList<AdminReportReasonDTO>>(adminReportList, HttpStatus.OK);
	        } catch (Exception e) {
	            e.printStackTrace();
	            rEntity = new ResponseEntity<>(HttpStatus.NOT_FOUND);
	            return rEntity;
	        }
	     return rEntity;
	}
	
	@GetMapping(value = "/reportProc")
	public @ResponseBody ResponseEntity<String> reportProcs(Model model, String[] articleId){
		ResponseEntity<String> rEntity = null;
		try {
			for(String arti :articleId){
				adminService.setReportArticleDelete(Integer.parseInt(arti));
			}
            rEntity = new ResponseEntity<>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            rEntity = new ResponseEntity<>(HttpStatus.NOT_FOUND);
            return rEntity;
        }
		return rEntity;
	}
	
	@GetMapping("/userManage")
	public void userManage(Model model) {
		ArrayList<AdminUserManageInfoDTO> userInfoList = adminService.getUserManageList();
		model.addAttribute("userInfoList",userInfoList);
	}
	
	@GetMapping(value = "/blackArticleShow", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public @ResponseBody ResponseEntity<ArrayList<ArticleDTO>> blackArticleShow(Model model, String user_id){
		 ArrayList<ArticleDTO> adminBlackArticleList = null;
	     ResponseEntity<ArrayList<ArticleDTO>> rEntity = null;
	     try {
	    	 	adminBlackArticleList = adminService.getBlackUserArticle(user_id);
	            rEntity = new ResponseEntity<ArrayList<ArticleDTO>>(adminBlackArticleList, HttpStatus.OK);
	        } catch (Exception e) {
	            e.printStackTrace();
	            rEntity = new ResponseEntity<>(HttpStatus.NOT_FOUND);
	            return rEntity;
	        }
	     return rEntity;
	}
	
	@GetMapping(value = "/userBlockProc")
	public @ResponseBody ResponseEntity<String> userBlockProc(Model model, String[] user_id){
		ResponseEntity<String> rEntity = null;
		try {
			for(String user :user_id){
				adminService.setUserBlock(user);
			}
            rEntity = new ResponseEntity<>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            rEntity = new ResponseEntity<>(HttpStatus.NOT_FOUND);
            return rEntity;
        }
		return rEntity;
	}
	
	
	@GetMapping("/suggestionManage")
	public void suggestionManage(Model model) {
		ArrayList<ArticleDTO> propRList = adminService.getProposalArticle("R");
		ArrayList<ArticleDTO> propJList = adminService.getProposalArticle("J");
		ArrayList<ArticleDTO> propCList = adminService.getProposalArticle("C");
		
		model.addAttribute("propRList",propRList);
		model.addAttribute("propJList",propJList);
		model.addAttribute("propCList",propCList);
	}
	
	@GetMapping(value = "/propShow", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public @ResponseBody ResponseEntity<ArrayList<AdminPropArticleInfoDTO>> propShow(Model model, int article_id){
		 ArrayList<AdminPropArticleInfoDTO> adminBlackArticleList = null;
	     ResponseEntity<ArrayList<AdminPropArticleInfoDTO>> rEntity = null;
	     try {
	    	 	adminBlackArticleList = adminService.getProposalInfo(article_id);
	            rEntity = new ResponseEntity<ArrayList<AdminPropArticleInfoDTO>>(adminBlackArticleList, HttpStatus.OK);
	        } catch (Exception e) {
	            e.printStackTrace();
	            rEntity = new ResponseEntity<>(HttpStatus.NOT_FOUND);
	            return rEntity;
	        }
	     return rEntity;
	}
	
	@GetMapping(value = "/propProc")
	public @ResponseBody ResponseEntity<String> propProc(Model model, String[] article_id, String procType){
		ResponseEntity<String> rEntity = null;
		AdminPropSetStatusDTO adminPropDto = new AdminPropSetStatusDTO();
		adminPropDto.setArticle_proposal_status(procType);
		try {
			for(String arti :article_id){
				adminPropDto.setArticle_id(Integer.parseInt(arti));
				adminService.setProposalStatus(adminPropDto);
			}
            rEntity = new ResponseEntity<>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            rEntity = new ResponseEntity<>(HttpStatus.NOT_FOUND);
            return rEntity;
        }
		return rEntity;
	}
	
	@GetMapping(value = "/propResultProc")
	public @ResponseBody ResponseEntity<String> propResultProc(Model model, String article_id, String procType, String result_value){
		ResponseEntity<String> rEntity = null;
		AdminPropSetStatusDTO adminPropDto = new AdminPropSetStatusDTO();
		adminPropDto.setArticle_proposal_status(procType);
		adminPropDto.setArticle_id(Integer.parseInt(article_id));
		adminPropDto.setResult_value(result_value);
		try {
			adminService.setProposalResult(adminPropDto);
            rEntity = new ResponseEntity<>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            rEntity = new ResponseEntity<>(HttpStatus.NOT_FOUND);
            return rEntity;
        }
		return rEntity;
	}
	
	
	private List sortByValue(HashMap hashMap){
		List list = new ArrayList();
		list.addAll(hashMap.keySet());
		
		Collections.sort(list, new Comparator(){
			public int compare(Object o1, Object o2){
				Object v1 = hashMap.get(o1);
				Object v2 = hashMap.get(o2);
				
				return ((Comparable)v2).compareTo(v1);
			}
		});
		log.info("리스트 : " + list.toString());
		return list;
	}
	
}
