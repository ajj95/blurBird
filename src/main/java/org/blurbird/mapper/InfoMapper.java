package org.blurbird.mapper;

import java.util.List;

import org.blurbird.domain.common.BusinessVO;
import org.blurbird.domain.info.FinancialSVO;
import org.blurbird.domain.info.IncomeSVO;
import org.blurbird.domain.info.InfoMainVO;
import org.blurbird.domain.info.ReportPaymentVO;

public interface InfoMapper {

	public List<InfoMainVO> getListBusiness();
	public InfoMainVO getBizName(InfoMainVO infoMainVO);
	
	public Long getSalesfromAuto(InfoMainVO infoMainVO);
	public Long getSalesfromBank(InfoMainVO infoMainVO);
	
	public Long getCOGSfromAuto(InfoMainVO infoMainVO);
	public Long getCOGSfromBank(InfoMainVO infoMainVO);
	public Long getCOGSfromCash(InfoMainVO infoMainVO);
	
	public Long getOperExpensefromAuto(InfoMainVO infoMainVO);
	public Long getOperExpensefromBank(InfoMainVO infoMainVO);
	public Long getOperExpensefromCash(InfoMainVO infoMainVO);	
	
	public void report(ReportPaymentVO reportPaymentVO);
	public void transfer(ReportPaymentVO reportPaymentVO);
	public ReportPaymentVO rptfResult(ReportPaymentVO reportPaymentVO);
	
	public int getStatusCount();
	public int getTotalCount();

	
}
