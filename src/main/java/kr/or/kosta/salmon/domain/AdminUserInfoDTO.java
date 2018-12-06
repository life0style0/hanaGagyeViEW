package kr.or.kosta.salmon.domain;

import java.util.ArrayList;
import java.util.HashMap;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class AdminUserInfoDTO {
	private int totalUser;
	private ArrayList<AdminGbyGenderDTO> genderGroup;
	private HashMap<String, Integer> ageGroupHash;
	private ArrayList<AdminRByMonthDTO> registGroupByMonth;
	private ArrayList<AdminGetUserCtgryDTO> getUserCtgry;
	private int ctgryTotal;
	private ArrayList<AdminFollowerTopDTO> followerTopList;
	private ArrayList<HashMap<String, Integer>> paymentListMale;
	private ArrayList<HashMap<String, Integer>> paymentListFemale;
}
