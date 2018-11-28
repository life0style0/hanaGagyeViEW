package kr.or.kosta.salmon.service;

import kr.or.kosta.salmon.domain.UserDTO;

public interface UserService {

	public void userRegist(UserDTO user);
	
	public void userUpdate(UserDTO user);
}
