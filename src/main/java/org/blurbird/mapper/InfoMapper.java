package org.blurbird.mapper;

import java.util.List;

import org.blurbird.domain.bank.BusinessVO;
import org.blurbird.domain.info.FinancialSVO;
import org.blurbird.domain.info.IncomeSVO;
import org.blurbird.domain.info.InfoData;

public interface InfoMapper {

	public List<BusinessVO> getListBusiness();
	
	public Long getSalesfromAuto(InfoData infoData);
	public Long getSalesfromBank(Long bizno, String year);
	
	public Long getCOGSfromAuto(Long bizno, String year);
	public Long getCOGSfromBank(Long bizno, String year);
	public Long getCOGSfromCash(Long bizno, String year);
	
	public Long getOperExpensefromAuto(Long bizno, String year);
	public Long getOperExpensefromBank(Long bizno, String year);
	public Long getOperExpensefromCash(Long bizno, String year);	
}
