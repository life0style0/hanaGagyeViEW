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
public class HashTagDTO {
	private int hashtag_ref_id;
	private int article_id;
	private int hashtag_id;
	private String hashtag_value;
}
