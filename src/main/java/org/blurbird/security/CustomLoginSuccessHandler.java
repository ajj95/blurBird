package org.blurbird.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

// 로그인 성공 시 호출되는 클래스
//AuthenticationSuccessHandler 구현
@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{

	//로그인 성공시 호출되는 메소드
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request
      , HttpServletResponse response
			, Authentication auth) throws IOException, ServletException {
		
		List<String> roleName = new ArrayList<String>();
		
		//로그인 성공시 사용자의 정보가 Authentication 객체로 넘어옴
		//- 넘어오는 여러 정보 forEach로 확인
		auth.getAuthorities().forEach(authority -> {
			roleName.add(authority.getAuthority());
			log.info(roleName.get(0));
		});
		
		// authno가 세무사인 경우
		if(roleName.contains("TAUSER")) {
			response.sendRedirect("/main/mainTA");
			return;
		}
		
		// authno가 수임사인 경우
		if(roleName.contains("COUSER")) {
			response.sendRedirect("/main/mainCO");
			return;
		}
		
		// 어떤 권한도 없는 경우
		response.sendRedirect("/");
	}
}