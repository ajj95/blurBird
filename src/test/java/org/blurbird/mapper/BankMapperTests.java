package org.blurbird.mapper;

import static org.junit.Assert.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.blurbird.domain.bank.BankSearchDTO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BankMapperTests {

	@Autowired
	public BankMapper mapper;
	
    /*
	@Test
	public void getbankhistorytest() {
		BankSearchDTO search = new BankSearchDTO();
		
		String start = "20230801";
		String end = "20230807";
		search.setStartdate("2023-08-01");
		search.setEnddate("2023-08-07");
		search.setBizno("10001");
		search.setBankname("신한은행");
		mapper.getBankHistoryList(search).forEach(bankhistory -> log.info(bankhistory));
	}
	*/
	/*
	@Test
	public void getbankhistoryNonetest() {
		BankSearchDTO search = new BankSearchDTO();
		
		String start = "20230801";
		String end = "20230807";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	    Date startdate = null;
		try {
			startdate = sdf.parse(start);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Date enddate = null;
		try {
			enddate = sdf.parse(end);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		search.setStartdate(startdate);
		search.setEnddate(enddate);
		search.setBizno("10001");
		search.setBankname("신한은행");
		mapper.getBankHistoryListConn(search).forEach(bankhistory -> log.info(bankhistory));
	}
	*/
	
	@Test
	public void getbankSliptest() {
		BankSearchDTO search = new BankSearchDTO();
		
		search.setStartdate("2023-08-01");
		search.setEnddate("2023-08-07");
		search.setBizno("10001");
		search.setBankname("신한은행");
		//search.setBhstateno("1002");
		mapper.getBankSlipList(search).forEach(slip -> log.info(slip));
	}

}
