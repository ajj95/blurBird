package org.blurbird.mapper;

import static org.junit.Assert.*;

import org.blurbird.domain.info.FinancialSVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class InfoMapperTests {

	@Autowired
	private InfoMapper mapper;

	// 수임사 목록 가져오기 테스트
//	@Test
//	public void testGetListBusiness() {
//		log.info(mapper.getListBusiness());
//	}
	
	@Test
	public void testGetSalesfromAutoSlip() {
		log.info(mapper.getSalesfromAuto());
	}
	@Test
	public void testGetSalesfromBankSlip() {
		log.info(mapper.getSalesfromBank());
	}
	
	
//	  @Test public void test() { FinancialSVO vo = new FinancialSVO(); //
//	  log.info(mapper.getA());
//	  vo.setCurrentAssets(mapper.getA().getCurrentAssets());
//	  log.info(vo.getCurrentAssets()); }
	 

//	@Test
//	public void testGetP() {
//		FinancialSVO vo = new FinancialSVO();
//		log.info(mapper.getP());
//	}

}
