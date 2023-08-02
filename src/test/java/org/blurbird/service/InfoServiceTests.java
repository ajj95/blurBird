package org.blurbird.service;

import static org.junit.Assert.*;

import org.blurbird.domain.info.IncomeSVO;
import org.blurbird.domain.info.InfoData;
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
	
//	@Test
//	public void testGetISElements() {
//		long sales = service.getISElements(10001L, "2023-07");
//		log.info("sales: " + sales);
//	}
	
	@Test
	public void test() {
		InfoData info = new InfoData();
		info.setBizno("10001");
		info.setYear("2023");
		log.info(info.getYear().toString());
		log.info("===============================");
		log.info(service.getSalesfromAuto(info));
	}
	

}
