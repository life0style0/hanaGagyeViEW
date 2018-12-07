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
public class AdminPaymentTypeDTO {
	private String user_id;
	private int article_ctgry_id;
	private int payment_sum;
	private String user_gender;
}
