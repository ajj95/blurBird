package org.blurbird.service;

import static org.junit.Assert.*;

import org.blurbird.domain.info.IncomeSVO;
import org.blurbird.mapper.InfoMapperTests;
import org.blurbird.service.info.InfoService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class InfoServiceTests {

	@Autowired
	private InfoService service;
	
//	@Test
//	public void testGetListBusiness() {
//		log.info(service.getListBusiness());
//	}
	
	@Test
	public void testGetTotalSales() {
		log.info(service.getTotalSales());
}

}
