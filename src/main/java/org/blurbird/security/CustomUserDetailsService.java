package org.blurbird.security;

import org.blurbird.domain.common.UsersVO;
import org.blurbird.mapper.CommonMapper;
import org.blurbird.security.domain.CustomUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService{

	@Setter(onMethod_ = {@Autowired})
	private CommonMapper mapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.warn("Load User By UserName: " + username);  //=userid
		
		UsersVO user = mapper.readUser(username);
		
		log.warn("queried by mapper: " + user);
		
		return user == null ? null : new CustomUser(user);
	}

}
