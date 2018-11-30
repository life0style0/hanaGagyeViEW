package kr.or.kosta.salmon.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;
import lombok.extern.log4j.Log4j;

@Log4j
@Getter
public class CustomUserDTO extends User{
	
	private static final long serialVersionUID = 1L;
	private UserDTO user;
	
	public CustomUserDTO(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

	public CustomUserDTO(UserDTO user) {
		super(user.getUser_id(), user.getUser_passwd(), user.getAuthList().stream().map(
				auth->new SimpleGrantedAuthority(auth.getUser_auth())).collect(Collectors.toList()));
		log.info("customDTO 생성자 시작");
		this.user = user;
		log.info(" user : "+this.user);
	}
	
}
