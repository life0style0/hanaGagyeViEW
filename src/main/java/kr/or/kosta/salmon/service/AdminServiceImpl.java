package kr.or.kosta.salmon.service;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.kosta.salmon.domain.AdminArticleInfoArtiCtgryDTO;
import kr.or.kosta.salmon.domain.AdminArticleInfoCtgryCtDTO;
import kr.or.kosta.salmon.domain.AdminArticleInfoHashTagTopDTO;
import kr.or.kosta.salmon.domain.AdminArticleInfoRegistDTO;
import kr.or.kosta.salmon.domain.AdminArticleInfoWordDTO;
import kr.or.kosta.salmon.domain.AdminFollowerTopDTO;
import kr.or.kosta.salmon.domain.AdminGbyGenderDTO;
import kr.or.kosta.salmon.domain.AdminGetUserCtgryDTO;
import kr.or.kosta.salmon.domain.AdminPayInfoAvgDTO;
import kr.or.kosta.salmon.domain.AdminPayInfoAvgGroupBYAgeDTO;
import kr.or.kosta.salmon.domain.AdminPayInfoPstageDTO;
import kr.or.kosta.salmon.domain.AdminPayInfoTotalDTO;
import kr.or.kosta.salmon.domain.AdminPaymentInfoRankDTO;
import kr.or.kosta.salmon.domain.AdminPaymentTypeDTO;
import kr.or.kosta.salmon.domain.AdminPropArticleInfoDTO;
import kr.or.kosta.salmon.domain.AdminPropSetStatusDTO;
import kr.or.kosta.salmon.domain.AdminRByMonthDTO;
import kr.or.kosta.salmon.domain.AdminReportReasonDTO;
import kr.or.kosta.salmon.domain.AdminUserManageInfoDTO;
import kr.or.kosta.salmon.domain.ArticleDTO;
import kr.or.kosta.salmon.domain.HashTagGroupDTO;
import kr.or.kosta.salmon.domain.MainArticleDTO;
import kr.or.kosta.salmon.domain.MainChartDTO;
import kr.or.kosta.salmon.domain.MainGroupCtFeeDTO;
import kr.or.kosta.salmon.mapper.AdminMapper;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class AdminServiceImpl implements AdminService{
	@Inject
	AdminMapper adminMapper;
	

	@Override
	public int getAgeGroupCount(int ageGroup) {
		return adminMapper.getAgeGroupCount(ageGroup);
	}

	@Override
	public ArrayList<AdminGbyGenderDTO> getGroupByGender() {
		return adminMapper.getGroupByGender();
	}

	@Override
	public int getTotalUser() {
		return adminMapper.getTotalUser();
	}

	@Override
	public ArrayList<AdminRByMonthDTO> getRegistGroupMonth() {
		return adminMapper.getRegistGroupMonth();
	}

	@Override
	public ArrayList<AdminGetUserCtgryDTO> getUserCategory1() {
		return adminMapper.getUserCategory1();
	}

	@Override
	public ArrayList<AdminGetUserCtgryDTO> getUserCategory2() {
		return adminMapper.getUserCategory2();
	}

	@Override
	public ArrayList<AdminGetUserCtgryDTO> getUserCategory3() {
		return adminMapper.getUserCategory3();
	}

	@Override
	public ArrayList<AdminFollowerTopDTO> getFollowerTop() {
		return adminMapper.getFollowerTop();
	}

	@Override
	public ArrayList<AdminPaymentTypeDTO> getPaymentType() {
		return adminMapper.getPaymentType();
	}

	@Override
	public AdminPayInfoTotalDTO getTotalInfo() {
		return adminMapper.getTotalInfo();
	}

	@Override
	public AdminPayInfoAvgDTO getMinAvgCtgry() {
		return adminMapper.getMinAvgCtgry();
	}

	@Override
	public AdminPayInfoAvgDTO getMaxAvgCtgry() {
		return adminMapper.getMaxAvgCtgry();
	}

	@Override
	public ArrayList<AdminPayInfoAvgGroupBYAgeDTO> getAvgCtgryByAge(int ageGroup) {
		return adminMapper.getAvgCtgryByAge(ageGroup);
	}

	@Override
	public ArrayList<AdminPayInfoPstageDTO> getIncomeCtgryPersentage(int ageGroup) {
		return adminMapper.getIncomeCtgryPersentage(ageGroup);
	}

	@Override
	public ArrayList<AdminPayInfoPstageDTO> getSpendCtgryPersentage(int ageGroup) {
		return adminMapper.getSpendCtgryPersentage(ageGroup);
	}

	@Override
	public int getIncomeTotalGroupByAge(int ageGroup) {
		return adminMapper.getIncomeTotalGroupByAge(ageGroup);
	}

	@Override
	public int getSpendTotalGroupByAge(int ageGroup) {
		return adminMapper.getSpendTotalGroupByAge(ageGroup);
	}

	@Override
	public ArrayList<AdminArticleInfoWordDTO> getHashTagWordCloud() {
		return adminMapper.getHashTagWordCloud();
	}

	@Override
	public ArrayList<AdminPaymentInfoRankDTO> getRankByLocationAndCtgry() {
		return adminMapper.getRankByLocationAndCtgry();
	}

	@Override
	public ArrayList<String> getLoactionInfo() {
		return adminMapper.getLoactionInfo();
	}

	@Override
	public ArrayList<AdminArticleInfoCtgryCtDTO> getArticleCountByCtgry() {
		return adminMapper.getArticleCountByCtgry();
	}

	@Override
	public int getHashTagTotalCt() {
		return adminMapper.getHashTagTotalCt();
	}

	@Override
	public ArrayList<AdminArticleInfoHashTagTopDTO> getHashTagTopList() {
		return adminMapper.getHashTagTopList();
	}

	@Override
	public ArrayList<AdminArticleInfoArtiCtgryDTO> getArticleCategoryList() {
		return adminMapper.getArticleCategoryList();
	}

	@Override
	public int getArticleCategoryTotal() {
		return adminMapper.getArticleCategoryTotal();
	}

	@Override
	public ArrayList<AdminPaymentInfoRankDTO> getRankByLocationAndCtgryIncome() {
		return adminMapper.getRankByLocationAndCtgryIncome();
	}

	@Override
	public ArrayList<AdminArticleInfoRegistDTO> getArticleRegistIncome() {
		return adminMapper.getArticleRegistIncome();
	}

	@Override
	public ArrayList<AdminArticleInfoRegistDTO> getArticleRegistSpend() {
		return adminMapper.getArticleRegistSpend();
	}

	@Override
	public ArrayList<ArticleDTO> getReportTargetArticle() {
		return adminMapper.getReportTargetArticle();
	}

	@Override
	public ArrayList<AdminReportReasonDTO> getReportReason(int article_id) {
		return adminMapper.getReportReason(article_id);
	}

	@Override
	public void setReportArticleDelete(int article_id) {
		adminMapper.setReportArticleDelete(article_id);
	}

	@Override
	public ArrayList<AdminUserManageInfoDTO> getUserManageList() {
		return adminMapper.getUserManageList();
	}

	@Override
	public ArrayList<ArticleDTO> getBlackUserArticle(String user_id) {
		return adminMapper.getBlackUserArticle(user_id);
	}

	@Override
	public boolean setUserBlock(String user_id) {
		return adminMapper.setUserBlock(user_id);
	}

	@Override
	public ArrayList<ArticleDTO> getProposalArticle(String prop_status) {
		return adminMapper.getProposalArticle(prop_status);
	}

	@Override
	public ArrayList<AdminPropArticleInfoDTO> getProposalInfo(int article_id) {
		return adminMapper.getProposalInfo(article_id);
	}

	@Override
	public boolean setProposalStatus(AdminPropSetStatusDTO adminPropSetStatusDTO) {
		return adminMapper.setProposalStatus(adminPropSetStatusDTO);
	}

	@Override
	public boolean setProposalResult(AdminPropSetStatusDTO adminPropSetStatusDTO) {
		return adminMapper.setProposalResult(adminPropSetStatusDTO);
	}

	
}
