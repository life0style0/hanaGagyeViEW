package kr.or.kosta.salmon.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

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
		this.user = user;
	}
	
}
