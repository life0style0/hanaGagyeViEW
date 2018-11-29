/**
 * 로그인 성공시 처리 핸들러
 */
package kr.or.kosta.salmon.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;


import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {@Override
	
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		
		log.warn("! login success !");
		List<String> roleNames= new ArrayList<>();
		auth.getAuthorities().forEach(authority ->{
			roleNames.add(authority.getAuthority());
		});
		
		log.warn("ROLE NAME : "+roleNames);
		
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/salmon/auth/admin");
			return;
		}
		if(roleNames.contains("ROLE_MEMBER")) {
			//response.sendRedirect("/salmon/auth/member");
			response.sendRedirect("/salmon/");
			return;
		}
		if(roleNames.contains("ROLE_USER")) {
			//response.sendRedirect("/salmon/auth/user");
			response.sendRedirect("/salmon/");
			return;
		}
		response.sendRedirect("/");
	}


}
