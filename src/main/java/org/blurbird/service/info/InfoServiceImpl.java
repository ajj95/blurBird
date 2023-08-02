package org.blurbird.service.info;

import java.util.ArrayList;
import java.util.List;

import org.blurbird.domain.bank.BusinessVO;
import org.blurbird.domain.info.IncomeSVO;
import org.blurbird.domain.info.InfoData;
import org.blurbird.mapper.InfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class InfoServiceImpl implements InfoService {
	
	@Autowired
	private InfoMapper mapper;
	
	@Override
	public List<BusinessVO> getListBusiness() {
			log.info("수임사 목록 가져오기");
		return mapper.getListBusiness();
	}

	/*
	 * @Override public List<IncomeSVO> getISElements(Long bizno, String year) {
	 * 
	 * log.info(year);
	 * 
	 * IncomeSVO vo = new IncomeSVO(); List<IncomeSVO> voList = new
	 * ArrayList<IncomeSVO>();
	 * 
	 * vo.setSalesfromautoslip(mapper.getSalesfromAuto(bizno, year));
	 * vo.setSalesfrombankslip(mapper.getSalesfromBank(bizno, year));
	 * 
	 * long totalSales = mapper.getSalesfromAuto(bizno, year) +
	 * mapper.getSalesfromBank(bizno, year); log.info("Sales: " + totalSales);
	 * 
	 * vo.setTotalsales(totalSales);
	 * 
	 * 
	 * vo.setCogsfromautoslip(mapper.getCOGSfromAuto(bizno, year));
	 * vo.setCogsfrombankslip(mapper.getCOGSfromBank(bizno, year));
	 * vo.setCogsfromcashslip(mapper.getCOGSfromCash(bizno, year));
	 * 
	 * long totalCOGS = mapper.getCOGSfromAuto(bizno, year) +
	 * mapper.getCOGSfromBank(bizno, year) + mapper.getCOGSfromCash(bizno, year);
	 * log.info("COGS: " + totalCOGS);
	 * 
	 * vo.setTotalcogs(totalCOGS);
	 * 
	 * 
	 * 
	 * vo.setOperExpensefromAutoSlip(mapper.getOperExpensefromAuto(bizno, year));
	 * vo.setOperExpensefromBankSlip(mapper.getOperExpensefromBank(bizno, year));
	 * vo.setOperExpensefromCashSlip(mapper.getOperExpensefromCash(bizno, year));
	 * 
	 * long totalOperExpense = mapper.getOperExpensefromAuto(bizno, year) +
	 * mapper.getOperExpensefromBank(bizno, year) +
	 * mapper.getOperExpensefromCash(bizno, year);
	 * 
	 * log.info("OE: " + totalOperExpense);
	 * 
	 * vo.setTotaloe(totalOperExpense);
	 * 
	 * 
	 * vo.setBusinessIncome(totalSales - (totalCOGS + totalOperExpense));
	 * 
	 * log.info("======================================="); log.info("사업소득금액: " +
	 * vo.getBusinessIncome());
	 * 
	 * 
	 * double incomeBeforeTax = vo.getBusinessIncome().doubleValue();
	 * 
	 * if(incomeBeforeTax<=12000000) { vo.setTax((long)(incomeBeforeTax*0.06)); }
	 * else if(12000000< incomeBeforeTax && incomeBeforeTax <= 46000000) {
	 * vo.setTax((long)((incomeBeforeTax*0.15)-1080000)); } else
	 * if(46000000<incomeBeforeTax && incomeBeforeTax <= 88000000) {
	 * vo.setTax((long)((incomeBeforeTax*0.24)-5220000)); }else
	 * if(88000000<incomeBeforeTax && incomeBeforeTax <= 150000000) {
	 * vo.setTax((long)((incomeBeforeTax*0.35)-14900000)); }else
	 * if(150000000<incomeBeforeTax && incomeBeforeTax <= 300000000) {
	 * vo.setTax((long)((incomeBeforeTax*0.38)-19400000)); }else
	 * if(300000000<incomeBeforeTax && incomeBeforeTax <= 500000000) {
	 * vo.setTax((long)((incomeBeforeTax*0.40)-25400000)); }else
	 * if(500000000<incomeBeforeTax && incomeBeforeTax <= 1000000000) {
	 * vo.setTax((long)((incomeBeforeTax*0.42)-35400000)); }else {
	 * vo.setTax((long)((incomeBeforeTax*0.45)-65400000)); }
	 * 
	 * voList.add(vo);
	 * 
	 * return voList; }
	 */

	@Override
	public Long getSalesfromAuto(InfoData infoData) {
		log.info(infoData.getYear().toString());
		return mapper.getSalesfromAuto(infoData);
	}

	

}
