package org.blurbird.controller;

import static org.junit.Assert.*;

import org.blurbird.service.InfoServiceTests;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"
		, "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class InfoControllerTests {
	
	@Autowired
	private WebApplicationContext ctx; // 가상의 Spring Container
	private MockMvc mockMvc; // 가상의 Tomcat
	
	@Before // 각 @Test를 실행 전 먼저 실행
	public void setup() {
		// 가상의 Tomcat 생성
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	@Test
	public void testinfoTA() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.post("/info/infoTA")
				.param("bizno", "10001")
				.param("year", "2023"))
				
				.andReturn() // 요청에 대한 리턴을 받고
				.getModelAndView() // 해당 결과값을 MAV에 넣어준다.
				.getModelMap()); // MAV의 값을 보여준다.
	}
	
}
