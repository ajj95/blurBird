package org.blurbird.mapper;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.blurbird.domain.common.BusinessVO;
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

	// ���ӻ� ��� �������� �׽�Ʈ
//	@Test
//	public void testGetListBusiness() {
//		log.info(mapper.getListBusiness());
//	}

	// ����(�� ���Աݾ�)
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
//		log.info("����ҵ�ݾ�: " + (totalSales - (totalCOGS + totalOperExpense)));
//	}

//	@Test
//	public void testGSfA() {
//		InfoData infoData = new InfoData();
//		infoData.setBizno("10001");
//		infoData.setYear("2023");
//		mapper.getSalesfromAuto(infoData);
//		log.info(mapper.getSalesfromAuto(infoData));
//	}
//	@Test
//	public void getISByBiz() {
//		InfoData infoData = new InfoData();
//		infoData.setBizno("10001");
//		infoData.setYear("2023");
//		
//		List<IncomeSVO> iSList = new ArrayList<IncomeSVO>();
//		List<BusinessVO> bizList = mapper.getListBusiness();
//
//		for (int i = 0; i < bizList.size(); i++) {
//			IncomeSVO is = new IncomeSVO();
//			is.setBizno(infoData.getBizno());
//
//			if (mapper.getSalesfromAuto(infoData) == null) {
//				// null�� ��쿡 0���� ����
//				is.setSalesfromautoslip(0L);
//			} else {
//				is.setSalesfromautoslip(mapper.getSalesfromAuto(infoData));
//			}
//
//			if (mapper.getSalesfromBank(infoData) == null) {
//				// null�� ��쿡 0���� ����
//				is.setSalesfrombankslip(0L);
//			} else {
//				is.setSalesfrombankslip(mapper.getSalesfromBank(infoData));
//			}
//
//			is.setTotalsales(is.getSalesfromautoslip() + is.getSalesfrombankslip());
//
//			if (mapper.getCOGSfromAuto(infoData) == null) {
//				// null�� ��쿡 0���� ����
//				is.setCogsfromautoslip(0L);
//			} else {
//				is.setCogsfromautoslip(mapper.getCOGSfromAuto(infoData));
//			}
//			if (mapper.getCOGSfromBank(infoData) == null) {
//				// null�� ��쿡 0���� ����
//				is.setCogsfrombankslip(0L);
//			} else {
//				is.setCogsfrombankslip(mapper.getCOGSfromBank(infoData));
//			}
//			if (mapper.getCOGSfromCash(infoData) == null) {
//				// null�� ��쿡 0���� ����
//				is.setCogsfromcashslip(0L);
//			} else {
//				is.setCogsfromcashslip(mapper.getCOGSfromCash(infoData));
//			}
//
//			is.setTotalcogs(is.getCogsfromautoslip() + is.getCogsfrombankslip() + is.getCogsfromcashslip());
//
//			if (mapper.getOperExpensefromAuto(infoData) == null) {
//				// null�� ��쿡 0���� ����
//				is.setOperExpensefromAutoSlip(0L);
//			} else {
//				is.setOperExpensefromAutoSlip(mapper.getOperExpensefromAuto(infoData));
//			}
//			if (mapper.getOperExpensefromBank(infoData) == null) {
//				// null�� ��쿡 0���� ����
//				is.setOperExpensefromBankSlip(0L);
//			} else {
//				is.setOperExpensefromBankSlip(mapper.getOperExpensefromBank(infoData));
//			}
//			if (mapper.getOperExpensefromCash(infoData) == null) {
//				// null�� ��쿡 0���� ����
//				is.setOperExpensefromCashSlip(0L);
//			} else {
//				is.setOperExpensefromCashSlip(mapper.getOperExpensefromCash(infoData));
//			}
//
//			is.setTotaloe(is.getOperExpensefromAutoSlip() + is.getOperExpensefromBankSlip()
//					+ is.getOperExpensefromCashSlip());
//
//			is.setBusinessIncome(is.getTotalsales() - (is.getTotalcogs() + is.getTotaloe()));
//
//			double incomeBeforeTax = is.getBusinessIncome().doubleValue();
//			if (incomeBeforeTax <= 0) {
//				incomeBeforeTax = 0;
//			}
//
//			if (incomeBeforeTax <= 12000000) {
//				is.setTax((long) (incomeBeforeTax * 0.06));
//			} else if (12000000 < incomeBeforeTax && incomeBeforeTax <= 46000000) {
//				is.setTax((long) ((incomeBeforeTax * 0.15) - 1080000));
//			} else if (46000000 < incomeBeforeTax && incomeBeforeTax <= 88000000) {
//				is.setTax((long) ((incomeBeforeTax * 0.24) - 5220000));
//			} else if (88000000 < incomeBeforeTax && incomeBeforeTax <= 150000000) {
//				is.setTax((long) ((incomeBeforeTax * 0.35) - 14900000));
//			} else if (150000000 < incomeBeforeTax && incomeBeforeTax <= 300000000) {
//				is.setTax((long) ((incomeBeforeTax * 0.38) - 19400000));
//			} else if (300000000 < incomeBeforeTax && incomeBeforeTax <= 500000000) {
//				is.setTax((long) ((incomeBeforeTax * 0.40) - 25400000));
//			} else if (500000000 < incomeBeforeTax && incomeBeforeTax <= 1000000000) {
//				is.setTax((long) ((incomeBeforeTax * 0.42) - 35400000));
//			} else {
//				is.setTax((long) ((incomeBeforeTax * 0.45) - 65400000));
//			}
//
//			iSList.add(is);
//
//		}
//		log.info("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" + iSList);
//
//	}

	@Test
	public void test() {
		List<InfoData> iSList = new ArrayList<InfoData>();
		List<BusinessVO> bizList = mapper.getListBusiness();
		InfoData infoData = new InfoData();
		infoData.setYear("2023");

		for (int i = 0; i < bizList.size(); i++) {
			InfoData info = new InfoData();
			info.setBizno(mapper.getListBusiness().get(i).getBizno());
			info.setYear(infoData.getYear());

			info.setBizname(mapper.getListBusiness().get(i).getBizname());
			if (info.getBizno() == iSList.get(i).getBizno()) {
				info.setBizincome(Long.toString(iSList.get(i).getBusinessIncome()));
				info.setTax(Long.toString(iSList.get(i).getTax()));
			}

			iSList.add(info);
		}
		log.info("����� ����@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + infoList);
	}
}
