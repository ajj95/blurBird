package org.blurbird.mapper;

import java.util.List;

import org.blurbird.domain.common.BusinessVO;
import org.blurbird.domain.info.FinancialSVO;
import org.blurbird.domain.info.IncomeSVO;
import org.blurbird.domain.info.InfoData;
import org.blurbird.domain.info.ReportPaymentVO;

public interface InfoMapper {

	public List<BusinessVO> getListBusiness();
	public InfoData getBizName(InfoData infoData);
	
	public Long getSalesfromAuto(InfoData infoData);
	public Long getSalesfromBank(InfoData infoData);
	
	public Long getCOGSfromAuto(InfoData infoData);
	public Long getCOGSfromBank(InfoData infoData);
	public Long getCOGSfromCash(InfoData infoData);
	
	public Long getOperExpensefromAuto(InfoData infoData);
	public Long getOperExpensefromBank(InfoData infoData);
	public Long getOperExpensefromCash(InfoData infoData);	
	
	public void report(ReportPaymentVO reportPaymentVO);
	public void transfer(ReportPaymentVO reportPaymentVO);
	public ReportPaymentVO rptfResult(ReportPaymentVO reportPaymentVO);
}
