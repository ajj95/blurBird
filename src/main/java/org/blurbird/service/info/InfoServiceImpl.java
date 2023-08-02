package org.blurbird.service.info;

import java.util.List;

import org.blurbird.domain.bank.BusinessVO;
import org.blurbird.domain.info.IncomeSVO;
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

	@Override
	public IncomeSVO getISElements() {
		
		IncomeSVO vo = new IncomeSVO();
		
		long totalSales = mapper.getSalesfromAuto().getSalesfromautoslip() +
				mapper.getSalesfromBank().getSalesfrombankslip();
		log.info("Sales: " + totalSales);
		
		long totalCOGS = mapper.getCOGSfromAuto().getCogsfromautoslip() + 
										mapper.getCOGSfromBank().getCogsfrombankslip() + 
										mapper.getCOGSfromCash().getCogsfromcashslip();
		
		log.info("COGS: " + totalCOGS);
		
		long totalOperExpense = mapper.getOperExpensefromAuto().getOperExpensefromAutoSlip() +
				mapper.getOperExpensefromBank().getOperExpensefromBankSlip() +
				mapper.getOperExpensefromCash().getOperExpensefromCashSlip();
		
		log.info("OE: " + totalOperExpense);
		
		log.info("=======================================");
		log.info("사업소득금액: " + (totalSales - (totalCOGS + totalOperExpense)));
		
		vo.setTotalsales(totalSales);
		vo.setTotalcogs(totalCOGS);
		vo.setTotaloe(totalOperExpense);
		vo.setBusinessIncome(totalSales - (totalCOGS + totalOperExpense));
		
		long incomeBeforeTax = vo.getBusinessIncome();
		
		if(incomeBeforeTax<=12000000) {
			vo.setTax(incomeBeforeTax*(long)0.06);
		} else if(12000000< incomeBeforeTax && incomeBeforeTax <= 46000000) {
			vo.setTax((incomeBeforeTax*(long)0.15)-1080000);
		} else if(46000000<incomeBeforeTax && incomeBeforeTax <= 88000000) {
			vo.setTax((incomeBeforeTax*(long)0.24)-5220000);
		}else if(88000000<incomeBeforeTax && incomeBeforeTax <= 150000000) {
			vo.setTax((incomeBeforeTax*(long)0.35)-14900000);
		}else if(150000000<incomeBeforeTax && incomeBeforeTax <= 300000000) {
			vo.setTax((incomeBeforeTax*(long)0.38)-19400000);
		}else if(300000000<incomeBeforeTax && incomeBeforeTax <= 500000000) {
			vo.setTax((incomeBeforeTax*(long)0.40)-25400000);
		}else if(500000000<incomeBeforeTax && incomeBeforeTax <= 1000000000) {
			vo.setTax((incomeBeforeTax*(long)0.42)-35400000);
		}else {
			vo.setTax((incomeBeforeTax*(long)0.45)-65400000);
		}

		
		
		return vo;
	}

	

}
