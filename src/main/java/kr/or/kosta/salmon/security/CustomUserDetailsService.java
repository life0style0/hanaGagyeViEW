package kr.or.kosta.salmon.security;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.or.kosta.salmon.domain.CustomUserDTO;
import kr.or.kosta.salmon.domain.UserDTO;
import kr.or.kosta.salmon.mapper.UserMapper;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Inject
	private UserMapper userMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		log.warn(" load user by username : "+username);
		
		//username = user_id
		UserDTO user= userMapper.read(username);
		log.warn(" by user mapper : "+user);
		
		if(user == null) {
			log.info("return null ");
			return null;
		} else {
			log.info("return user ");
			return new CustomUserDTO(user);
		}
	//	return user == null ? null : new CustomUserDTO(user);
	}
	
	

}
