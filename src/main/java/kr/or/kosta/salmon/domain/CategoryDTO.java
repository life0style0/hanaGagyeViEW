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
public class CategoryDTO {
	private int ctgry_value_id;
	private int ctgry_id;
	private int article_id;
}
