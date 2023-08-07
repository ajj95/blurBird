package org.blurbird.mapper;

import org.blurbird.domain.common.UsersVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"
		, "file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class MemberMapperTests {
	
	//@Autowired
	//private PasswordEncoder pwencoder;
	
	@Autowired
	private CommonMapper mapper;
	
	@Test
	public void testRead() {
		UsersVO user = mapper.readUser("chaewon");
		log.info(user);
		
		// 권한 정보만 뽑기
		user.getAuthList().forEach(authVO -> log.info(authVO));
	}
}