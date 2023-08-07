package org.blurbird.service;

import static org.junit.Assert.*;

import org.blurbird.domain.info.IncomeSVO;
import org.blurbird.domain.info.InfoMainVO;
import org.blurbird.domain.info.ReportPaymentVO;
import org.blurbird.mapper.InfoMapper;
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
	
	@Autowired
	private InfoMapper mapper;
	
//	@Test
//	public void testGetListBusiness() {
//		log.info(service.getListBusiness());
//	}
	
//	@Test
//	public void testGetISElements() {
//		long sales = service.getISElements(10001L, "2023-07");
//		log.info("sales: " + sales);
//	}
	
//	@Test
//	public void test() {
//		InfoData info = new InfoData();
//		info.setBizno("10001");
//		info.setYear("2023");
//		log.info(info.getYear().toString());
//		log.info("===============================");
//		log.info(service.getSalesfromAuto(info));
//	}
	
//	@Test
//	public void test() {
//		InfoData info = new InfoData();
//		info.setBizno("10001");
//		info.setYear("2023");
//		
//		log.info("info엔 들어갔네: " + info.getBizno());
//		log.info("메서드만 실행시키면 뭐가 찍히니?: " + service.getList(info));
//		log.info("실행시킨 메서드 문자열로 바꾸기: " + service.getList(info).get(0).getBizincome());
//		
//
//		info.setBizname(mapper.getListBusiness().get(0).getBizname());
//		info.setBizincome(Long.toString(mapper.getSalesfromAuto(info)));
//		
//		log.info("이게 info2 객체다~!!!! : " + info);
//	}
//	
//	@Test
//	public void test() {
//		InfoData info = new InfoData();
//		info.setYear("2023");
//		
//		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + service.getISByBiz(info));
//	}
//	
//	@Test
//	public void test() {
//		InfoMainVO infoMainVO = new InfoMainVO();
//		infoMainVO.setBizno("10001");
//		infoMainVO.setYear("2023");
//		
//		service.getISByBiz(infoMainVO);
//		
//		log.info("@@@@@@@@@@@@@@@@@@:" + service.getISByBiz(infoMainVO));
//	}

	
//	@Test
//	public void test() {
//		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + mapper.getListBusiness());
//	}
	
	@Test
	public void test() {
		InfoMainVO info = new InfoMainVO();
		info.setBizno("10001");
		info.setYear("2022");
		
		log.info("@@@@@@@@@@@@2022: " + service.getISByBiz(info));
		info.setBizno("10001");
		info.setYear("2023");
		
		log.info("@@@@@@@@@@@@2023: " + service.getISByBiz(info));
	}
}
