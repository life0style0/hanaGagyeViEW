package kr.or.kosta.salmon.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AdminPaymentInfoRankDTO {
	private String location_name;
	private String ctgry_name;
	private int ranking;
	private int avg_fee;
}
