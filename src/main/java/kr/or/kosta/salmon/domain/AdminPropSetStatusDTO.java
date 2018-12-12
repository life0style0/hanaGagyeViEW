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
public class AdminPropSetStatusDTO {
	private int article_id;
	private String article_proposal_status;
	private String result_value;
}
