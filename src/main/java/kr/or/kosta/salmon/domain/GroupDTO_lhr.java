package kr.or.kosta.salmon.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
/**
 * GroupDTO 설정
 * @author 이혜림
 */

@ToString
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class GroupDTO_lhr {

   private String group_id; //소모임 고유번호
   private String group_title;  //소모임 제목 
   private String group_regdate; //소모임 개설일
   private String group_description; //소모임 간단 소개글 
   private String group_people_max; //소모임 최대 인원
   private String user_id; //사용자 id
   private String ctgry_1; //관심 카테고리 1
   private String ctgry_2; //관심 카테고리 2
   private String ctgry_3; //관심 카테고리 2 
   
   
}