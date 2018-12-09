package kr.or.kosta.salmon.mapper;

import java.util.ArrayList;

import kr.or.kosta.salmon.domain.AdminArticleInfoArtiCtgryDTO;
import kr.or.kosta.salmon.domain.AdminArticleInfoCtgryCtDTO;
import kr.or.kosta.salmon.domain.AdminArticleInfoHashTagTopDTO;
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
import kr.or.kosta.salmon.domain.AdminRByMonthDTO;

public interface AdminMapper {

	//유저 정보
	public int getAgeGroupCount(int ageGroup);
	public ArrayList<AdminGbyGenderDTO> getGroupByGender();
	public int getTotalUser();
	public ArrayList<AdminRByMonthDTO> getRegistGroupMonth();
	public ArrayList<AdminGetUserCtgryDTO> getUserCategory1();
	public ArrayList<AdminGetUserCtgryDTO> getUserCategory2();
	public ArrayList<AdminGetUserCtgryDTO> getUserCategory3();
	public ArrayList<AdminFollowerTopDTO> getFollowerTop();
	public ArrayList<AdminPaymentTypeDTO> getPaymentType();
	
	//소비 정보
	public AdminPayInfoTotalDTO getTotalInfo();
	public AdminPayInfoAvgDTO getMinAvgCtgry();
	public AdminPayInfoAvgDTO getMaxAvgCtgry();
	public ArrayList<AdminPayInfoAvgGroupBYAgeDTO> getAvgCtgryByAge(int ageGroup);
	public ArrayList<AdminPayInfoPstageDTO> getIncomeCtgryPersentage(int ageGroup);
	public ArrayList<AdminPayInfoPstageDTO> getSpendCtgryPersentage(int ageGroup);
	public int getIncomeTotalGroupByAge(int ageGroup);
	public int getSpendTotalGroupByAge(int ageGroup);
	public ArrayList<AdminPaymentInfoRankDTO> getRankByLocationAndCtgry();
	public ArrayList<AdminPaymentInfoRankDTO> getRankByLocationAndCtgryIncome();
	public ArrayList<String> getLoactionInfo();
	
	//게시글 정보
	public ArrayList<AdminArticleInfoCtgryCtDTO> getArticleCountByCtgry();
	public ArrayList<AdminArticleInfoWordDTO> getHashTagWordCloud();
	public int getHashTagTotalCt();
	public ArrayList<AdminArticleInfoArtiCtgryDTO> getArticleCategoryList();
	public ArrayList<AdminArticleInfoHashTagTopDTO> getHashTagTopList();
	public int getArticleCategoryTotal();
	
	
}
