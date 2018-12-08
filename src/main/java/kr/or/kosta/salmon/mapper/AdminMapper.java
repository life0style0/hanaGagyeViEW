package kr.or.kosta.salmon.mapper;

import java.util.ArrayList;

import kr.or.kosta.salmon.domain.AdminFollowerTopDTO;
import kr.or.kosta.salmon.domain.AdminGbyGenderDTO;
import kr.or.kosta.salmon.domain.AdminGetUserCtgryDTO;
import kr.or.kosta.salmon.domain.AdminPayInfoAvgDTO;
import kr.or.kosta.salmon.domain.AdminPayInfoAvgGroupBYAgeDTO;
import kr.or.kosta.salmon.domain.AdminPayInfoTotalDTO;
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
	
}
