package kr.or.kosta.salmon.domain;

import java.util.ArrayList;

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
public class MainChartDTO {
	private ArrayList<MainGroupCtFeeDTO> ctGroupFee;
	private int totalFee;
	
}
