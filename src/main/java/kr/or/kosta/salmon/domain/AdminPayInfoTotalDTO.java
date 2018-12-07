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
public class AdminPayInfoTotalDTO {
	private int article_ct;
	private int article_sum;
	private int article_avg;
	private int article_stddev;
}
