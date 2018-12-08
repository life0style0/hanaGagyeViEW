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
public class LikeDTO {
	private int like_id;
	private String user_id;
	private int article_id;
	private String like_rdgeate;
}
