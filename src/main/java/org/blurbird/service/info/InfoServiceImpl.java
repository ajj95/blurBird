package org.blurbird.service.info;

import java.util.ArrayList;
import java.util.List;

import org.blurbird.domain.common.BusinessVO;
import org.blurbird.domain.info.IncomeSVO;
import org.blurbird.domain.info.InfoMainVO;
import org.blurbird.domain.info.ReportPaymentVO;
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
	public List<InfoMainVO> getListBusiness() {
		log.info("�닔�엫�궗 紐⑸줉 媛��졇�삤湲�");
		return mapper.getListBusiness();
	}

	@Override
	public IncomeSVO getISByBiz(InfoMainVO infoMainVO) {

		IncomeSVO iS = new IncomeSVO();

		iS.setBizno(infoMainVO.getBizno());

		if (mapper.getSalesfromAuto(infoMainVO) == null) {
			// null占쏙옙 占쏙옙荑� 0占쏙옙占쏙옙 占쏙옙占쏙옙
			iS.setSalesfromautoslip(0L);
		} else {
			iS.setSalesfromautoslip(mapper.getSalesfromAuto(infoMainVO));
		}

		if (mapper.getSalesfromBank(infoMainVO) == null) {
			// null占쏙옙 占쏙옙荑� 0占쏙옙占쏙옙 占쏙옙占쏙옙
			iS.setSalesfrombankslip(0L);
		} else {
			iS.setSalesfrombankslip(mapper.getSalesfromBank(infoMainVO));
		}

		iS.setTotalsales(iS.getSalesfromautoslip() + iS.getSalesfrombankslip());

		if (mapper.getCOGSfromAuto(infoMainVO) == null) {
			// null占쏙옙 占쏙옙荑� 0占쏙옙占쏙옙 占쏙옙占쏙옙
			iS.setCogsfromautoslip(0L);
		} else {
			iS.setCogsfromautoslip(mapper.getCOGSfromAuto(infoMainVO));
		}
		if (mapper.getCOGSfromBank(infoMainVO) == null) {
			// null占쏙옙 占쏙옙荑� 0占쏙옙占쏙옙 占쏙옙占쏙옙
			iS.setCogsfrombankslip(0L);
		} else {
			iS.setCogsfrombankslip(mapper.getCOGSfromBank(infoMainVO));
		}
		if (mapper.getCOGSfromCash(infoMainVO) == null) {
			// null占쏙옙 占쏙옙荑� 0占쏙옙占쏙옙 占쏙옙占쏙옙
			iS.setCogsfromcashslip(0L);
		} else {
			iS.setCogsfromcashslip(mapper.getCOGSfromCash(infoMainVO));
		}

		iS.setTotalcogs(iS.getCogsfromautoslip() + iS.getCogsfrombankslip() + iS.getCogsfromcashslip());

		if (mapper.getOperExpensefromAuto(infoMainVO) == null) {
			// null占쏙옙 占쏙옙荑� 0占쏙옙占쏙옙 占쏙옙占쏙옙
			iS.setOperExpensefromAutoSlip(0L);
		} else {
			iS.setOperExpensefromAutoSlip(mapper.getOperExpensefromAuto(infoMainVO));
		}
		if (mapper.getOperExpensefromBank(infoMainVO) == null) {
			// null占쏙옙 占쏙옙荑� 0占쏙옙占쏙옙 占쏙옙占쏙옙
			iS.setOperExpensefromBankSlip(0L);
		} else {
			iS.setOperExpensefromBankSlip(mapper.getOperExpensefromBank(infoMainVO));
		}
		if (mapper.getOperExpensefromCash(infoMainVO) == null) {
			// null占쏙옙 占쏙옙荑� 0占쏙옙占쏙옙 占쏙옙占쏙옙
			iS.setOperExpensefromCashSlip(0L);
		} else {
			iS.setOperExpensefromCashSlip(mapper.getOperExpensefromCash(infoMainVO));
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
	public List<InfoMainVO> getList(InfoMainVO infoMainVO) {
		IncomeSVO iS = this.getISByBiz(infoMainVO);
		List<InfoMainVO> infoList = mapper.getListBusiness();
//		List<InfoMainVO> infoList = new ArrayList<InfoMainVO>();
			

//		infoMainVO.setBizno(infoMainVO.getBizno());
//		infoMainVO.setYear(infoMainVO.getYear());
//		infoMainVO.setBizname(mapper.getBizName(infoMainVO).getBizname());
//		infoMainVO.setBizincome(Long.toString(iS.getBusinessIncome()));
//		infoMainVO.setTax(Long.toString(iS.getTax()));
//		//TODO: mapper를 통해서 DB값 받아올것
//		infoMainVO.setReportdate(infoMainVO.getReportdate());
//		infoMainVO.setReportdoc(infoMainVO.getReportdoc());
//		infoMainVO.setPaymentslip(infoMainVO.getPaymentslip());
//		infoMainVO.setTransdate(infoMainVO.getTransdate());
//		infoMainVO.setStatus(infoMainVO.getStatus());
		
//		infoList.add(infoMainVO);

		return infoList;
	}

	@Override
	public void report(ReportPaymentVO reportPaymentVO) {
		mapper.report(reportPaymentVO);
		
	}

	@Override
	public void transfer(ReportPaymentVO reportPaymentVO) {
		mapper.transfer(reportPaymentVO);
		
	}

	@Override
	public ReportPaymentVO rptfResult(ReportPaymentVO reportPaymentVO) {
		
//		reportPaymentVO.setReportpaymentno(reportPaymentVO.getReportpaymentno());
//		reportPaymentVO.setBizno(reportPaymentVO.getBizno());
//		reportPaymentVO.setBizname(reportPaymentVO.getBizname());
//		reportPaymentVO.setYear(reportPaymentVO.getYear());
//		if(reportPaymentVO.getBizincome()==null) {
//			reportPaymentVO.setBizincome("0");
//		}
//		if(reportPaymentVO.getTax()==null) {
//			reportPaymentVO.setTax("0");
//		}
//		reportPaymentVO.setReportdate(reportPaymentVO.getReportdate());
//		
//		reportPaymentVO.setReportdoc(reportPaymentVO.getReportdoc());
//		reportPaymentVO.setPaymentslip(reportPaymentVO.getPaymentslip());
//		reportPaymentVO.setTransdate(reportPaymentVO.getTransdate());
//		reportPaymentVO.setStatus(reportPaymentVO.getStatus());
		
		return mapper.rptfResult(reportPaymentVO);
	}

}
