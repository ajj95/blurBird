package org.blurbird.controller;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.blurbird.mapper.testMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class) // JUnit으로 테스트 하겠다.
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") // 설정 파일 위치
@Log4j
public class testMappers {

	@Autowired
	private DataSource ds;
	
	@Test
	public void test() {
		try {
			log.info(ds.getConnection());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
