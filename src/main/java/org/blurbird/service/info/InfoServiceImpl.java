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

	@Override
	public IncomeSVO getISByBiz(InfoData infoData) {

		IncomeSVO iS = new IncomeSVO();

		iS.setBizno(infoData.getBizno());

		if (mapper.getSalesfromAuto(infoData) == null) {
			// null일 경우에 0으로 설정
			iS.setSalesfromautoslip(0L);
		} else {
			iS.setSalesfromautoslip(mapper.getSalesfromAuto(infoData));
		}

		if (mapper.getSalesfromBank(infoData) == null) {
			// null일 경우에 0으로 설정
			iS.setSalesfrombankslip(0L);
		} else {
			iS.setSalesfrombankslip(mapper.getSalesfromBank(infoData));
		}

		iS.setTotalsales(iS.getSalesfromautoslip() + iS.getSalesfrombankslip());

		if (mapper.getCOGSfromAuto(infoData) == null) {
			// null일 경우에 0으로 설정
			iS.setCogsfromautoslip(0L);
		} else {
			iS.setCogsfromautoslip(mapper.getCOGSfromAuto(infoData));
		}
		if (mapper.getCOGSfromBank(infoData) == null) {
			// null일 경우에 0으로 설정
			iS.setCogsfrombankslip(0L);
		} else {
			iS.setCogsfrombankslip(mapper.getCOGSfromBank(infoData));
		}
		if (mapper.getCOGSfromCash(infoData) == null) {
			// null일 경우에 0으로 설정
			iS.setCogsfromcashslip(0L);
		} else {
			iS.setCogsfromcashslip(mapper.getCOGSfromCash(infoData));
		}

		iS.setTotalcogs(iS.getCogsfromautoslip() + iS.getCogsfrombankslip() + iS.getCogsfromcashslip());

		if (mapper.getOperExpensefromAuto(infoData) == null) {
			// null일 경우에 0으로 설정
			iS.setOperExpensefromAutoSlip(0L);
		} else {
			iS.setOperExpensefromAutoSlip(mapper.getOperExpensefromAuto(infoData));
		}
		if (mapper.getOperExpensefromBank(infoData) == null) {
			// null일 경우에 0으로 설정
			iS.setOperExpensefromBankSlip(0L);
		} else {
			iS.setOperExpensefromBankSlip(mapper.getOperExpensefromBank(infoData));
		}
		if (mapper.getOperExpensefromCash(infoData) == null) {
			// null일 경우에 0으로 설정
			iS.setOperExpensefromCashSlip(0L);
		} else {
			iS.setOperExpensefromCashSlip(mapper.getOperExpensefromCash(infoData));
		}

		iS.setTotaloe(
				iS.getOperExpensefromAutoSlip() + iS.getOperExpensefromBankSlip() + iS.getOperExpensefromCashSlip());

		iS.setBusinessIncome(iS.getTotalsales() - (iS.getTotalcogs() + iS.getTotaloe()));

		double incomeBeforeTax = iS.getBusinessIncome().doubleValue();
		if (incomeBeforeTax <= 0) {
			incomeBeforeTax = 0;
		}

		if (incomeBeforeTax <= 12000000) {
			iS.setTax((long) (incomeBeforeTax * 0.06));
		} else if (12000000 < incomeBeforeTax && incomeBeforeTax <= 46000000) {
			iS.setTax((long) ((incomeBeforeTax * 0.15) - 1080000));
		} else if (46000000 < incomeBeforeTax && incomeBeforeTax <= 88000000) {
			iS.setTax((long) ((incomeBeforeTax * 0.24) - 5220000));
		} else if (88000000 < incomeBeforeTax && incomeBeforeTax <= 150000000) {
			iS.setTax((long) ((incomeBeforeTax * 0.35) - 14900000));
		} else if (150000000 < incomeBeforeTax && incomeBeforeTax <= 300000000) {
			iS.setTax((long) ((incomeBeforeTax * 0.38) - 19400000));
		} else if (300000000 < incomeBeforeTax && incomeBeforeTax <= 500000000) {
			iS.setTax((long) ((incomeBeforeTax * 0.40) - 25400000));
		} else if (500000000 < incomeBeforeTax && incomeBeforeTax <= 1000000000) {
			iS.setTax((long) ((incomeBeforeTax * 0.42) - 35400000));
		} else {
			iS.setTax((long) ((incomeBeforeTax * 0.45) - 65400000));
		}

		return iS;

	}

	@Override
	public List<InfoData> getList(InfoData infoData) {
		IncomeSVO iS = this.getISByBiz(infoData);
		List<InfoData> infoList = new ArrayList<InfoData>();

		infoData.setBizno(iS.getBizno());
		infoData.setYear(infoData.getYear());
		infoData.setBizname(mapper.getBizName(infoData).getBizname());
		infoData.setBizincome(Long.toString(iS.getBusinessIncome()));
		infoData.setTax(Long.toString(iS.getTax()));

		infoList.add(infoData);

		return infoList;
	}

}
