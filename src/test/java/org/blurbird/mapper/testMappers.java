package org.blurbird.mapper;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

import javax.sql.DataSource;

import org.blurbird.domain.receipt.CashSlipVO;
import org.blurbird.domain.receipt.ConfirmedVO;
import org.blurbird.domain.receipt.DateRange;
import org.blurbird.domain.receipt.ReceiptRequestVO;
import org.blurbird.domain.receipt.UnconfirmedReasonVO;
import org.blurbird.mapper.ReceiptMapper;
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
	@Autowired
	private ReceiptMapper mapper;
	
	@Test
	public void test() throws Exception{
		/*
		 * try { log.info(ds.getConnection()); } catch (SQLException e) { // TODO
		 * Auto-generated catch block e.printStackTrace(); }
		 */
		/*
		 * DateRange dr = new DateRange(LocalDate.of(2023,07,01),LocalDate.now());
		 * log.info(mapper.getReceiptList(dr));
		 */
		/* log.info(mapper.getImgResource("5")); */
		/*
		 * try { ReceiptRequestVO receipt = new ReceiptRequestVO();
		 * receipt.setPurpose("식비"); receipt.setReceiptpath("\"receipt1.jpg\"");
		 * mapper.uploadReceipt(receipt); log.info(receipt); }catch (Exception e) {
		 * e.printStackTrace(); }
		 */
//		ConfirmedVO confirmed = new ConfirmedVO();
//		confirmed.setRecreqno("4");
//		mapper.confirmedReceipt(confirmed);
		
//		log.info(mapper.judgeReceipt("5"));
//		try {
//			UnconfirmedReasonVO unconfirmed = new UnconfirmedReasonVO();
//			unconfirmed.setRecreqno("4");
//			unconfirmed.setContents("거의 다 끝났다 진자");
//			log.info(unconfirmed);
//			mapper.unconfirmedReceipt(unconfirmed);
//		} catch (Exception e) {
//			log.info("안됐어 이자식아");
//			e.getStackTrace();
//		}
//		CashSlipVO cashSlip = new CashSlipVO();
//		cashSlip.setConfirmedno("19");
//		cashSlip.setAccountno("103");
//		cashSlip.setAmount(12345);
//		cashSlip.setSummary("매퍼테스트");
//		mapper.cashslipConfirmed(cashSlip);

//			mapper.getReceiptRequestWithConfirmed("1");
//		DateRange dr = new DateRange(LocalDate.of(2023,07,01),LocalDate.now());
//		mapper.getReceiptList(dr);
//		ConfirmedVO cv = new ConfirmedVO();
//		cv.setRecreqno("1");
//		mapper.confirmedReceipt(cv);
			log.info(mapper.getUserno("213-86-35896"));
	}

}
