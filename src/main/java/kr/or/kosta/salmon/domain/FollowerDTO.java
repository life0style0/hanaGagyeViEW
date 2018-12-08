package kr.or.kosta.salmon.domain;

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
public class FollowerDTO {

	private String follower_id; //팔로우 고유 id
	private String follower_user_id; //팔로우 하는사람 (나)
	private String user_id; //팔로우 당하는 사람
	private String follower_regdate; 
}
