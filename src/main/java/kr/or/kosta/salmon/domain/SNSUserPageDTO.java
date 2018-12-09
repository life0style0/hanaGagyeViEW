package kr.or.kosta.salmon.domain;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class SNSUserPageDTO {
	private String user_id; //이 사용자 아이디
	private UserDTO user; //이 사용자 정보
	private UserLocAndCatsDTO myPsnsInfo; //이 사용자의 추가정보
	private ArrayList<SNSArticleDTO_sjh> myArticles; //이 사용자의 게시글
	private ArrayList<SNSArticleDTO_sjh> likeArticles; //이 사용자가 좋아요 한  게시글
	private ArrayList<UserDTO> myfollowings; //이 사용자의 팔로잉
	private ArrayList<GroupDTO_lhr> myGroups; //이 사용자의 그룹
}
