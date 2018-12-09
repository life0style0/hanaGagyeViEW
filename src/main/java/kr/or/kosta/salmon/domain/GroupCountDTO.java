package kr.or.kosta.salmon.domain;

import lombok.Data;
/**
 * 소모임 인원 Count 
 * max: 소모임 가입 가능 최대 인원
 * now : 소모임 현재 회원 수 
 * @author 이혜림
 *
 */
@Data
public class GroupCountDTO {
	private int max;
	private int now;
}
