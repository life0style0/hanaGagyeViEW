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
public class ReportDTO {
	private int report_id;
	private int article_id;
	private String user_id;
	private String report_reason;
	private String report_regdate;
}
