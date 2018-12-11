package kr.or.kosta.salmon.domain;

import java.util.ArrayList;
import java.util.HashMap;

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
public class AdminUserManageInfoDTO {
	private String user_id;
	private String user_email;
	private String user_birthday;
	private String user_regdate;
	private int black_ct;
}
