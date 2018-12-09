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
public class AdminArticleInfoHashTagTopDTO {
	private String hashtag_value;
	private int hashtag_count;
	private int hashtag_rank;
}
