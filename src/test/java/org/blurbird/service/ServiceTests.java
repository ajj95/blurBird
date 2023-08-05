package org.blurbird.service;

import static org.junit.Assert.*;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

import org.blurbird.domain.receipt.CashSlipVO;
import org.blurbird.domain.receipt.ConfirmedVO;
import org.blurbird.domain.receipt.DateRange;
import org.blurbird.domain.receipt.ReceiptRequestVO;
import org.blurbird.domain.receipt.UnconfirmedReasonVO;
import org.blurbird.service.receipt.ReceiptService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class) // JUnit으로 테스트 하겠다.
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") // 설정 파일 위치
@Log4j
public class ServiceTests {

	@Autowired
	private ReceiptService service;
	
	@Test
	public void test() throws Exception{
//		service.read("451");
//		DateRange dr = new DateRange(LocalDate.of(2023,07,01),LocalDate.now());
//		service.getReceiptList(dr);
//		service.getImgPath("5");
//		ReceiptRequestVO receipt = new ReceiptRequestVO();
//		receipt.setPurpose("떴냐?");
//		receipt.setReceiptpath("\"receipt1.jpg\"");
//		service.uploadReceipt(receipt);
//		ConfirmedVO confirmed = new ConfirmedVO();
//		confirmed.setRecreqno("4");
//		service.confirmedReceipt(confirmed);
		
//		log.info(service.judgeReceipt("5"));
//		UnconfirmedReasonVO unconfirmed = new UnconfirmedReasonVO();
//		unconfirmed.setRecreqno("4");
//		unconfirmed.setContents("서비스 테스트");
//		service.unconfirmedReceipt(unconfirmed);
//		
//		CashSlipVO cashSlip = new CashSlipVO();
//		cashSlip.setConfirmedno("19");
//		cashSlip.setAccountno("103");
//		cashSlip.setAmount(67898);
//		cashSlip.setSummary("서비스 테스트");
//		service.cashslipConfirmed(cashSlip);
//		service.getReceiptRequestsWithConfirmation("38");
		service.getUserno("213-86-35896");
	}

}
