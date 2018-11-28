package kr.or.kosta.salmon.mapper;

import kr.or.kosta.salmon.domain.UserDTO;

public interface UserMapper {

	public UserDTO read(String user_id);
}
