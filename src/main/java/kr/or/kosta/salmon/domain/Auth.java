package kr.or.kosta.salmon.domain;

import lombok.Data;

@Data
public class Auth {

	private int user_auth_id;
	private String user_id;
	private String user_auth;
}
