package org.blurbird.mapper;

import static org.junit.Assert.*;

import org.blurbird.domain.info.FinancialSVO;
import org.blurbird.domain.info.IncomeSVO;
import org.blurbird.domain.info.InfoData;
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
	
	// 매출(총 수입금액)
//	@Test
//	public void testGetSalesfromAutoSlip() {
//		log.info(mapper.getSalesfromAuto());
//	}
//	@Test
//	public void testGetSalesfromBankSlip() {
//		log.info(mapper.getSalesfromBank());
//	}
	
//	@Test
//	public void testOI() {
//		
//		long totalSales = mapper.getSalesfromAuto().getSalesfromautoslip() +
//				mapper.getSalesfromBank().getSalesfrombankslip();
//		log.info("Sales: " + totalSales);
//		
//		long totalCOGS = mapper.getCOGSfromAuto().getCogsfromautoslip() + 
//										mapper.getCOGSfromBank().getCogsfrombankslip() + 
//										mapper.getCOGSfromCash().getCogsfromcashslip();
//		
//		log.info("COGS: " + totalCOGS);
//		
//		long totalOperExpense = mapper.getOperExpensefromAuto().getOperExpensefromAutoSlip() +
//				mapper.getOperExpensefromBank().getOperExpensefromBankSlip() +
//				mapper.getOperExpensefromCash().getOperExpensefromCashSlip();
//		
//		log.info("OE: " + totalOperExpense);
//		
//		log.info("=======================================");
//		log.info("사업소득금액: " + (totalSales - (totalCOGS + totalOperExpense)));
//	}
	
	@Test
	public void testGSfA() {
		InfoData infoData = new InfoData();
		infoData.setBizno("10001");
		infoData.setYear("2023");
		mapper.getSalesfromAuto(infoData);
		log.info(mapper.getSalesfromAuto(infoData));
	}

}
