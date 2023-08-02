package org.blurbird.mapper;

import java.util.List;

import org.blurbird.domain.bank.BusinessVO;
import org.blurbird.domain.info.FinancialSVO;
import org.blurbird.domain.info.IncomeSVO;

public interface InfoMapper {

	public List<BusinessVO> getListBusiness();
	
	public IncomeSVO getSalesfromAuto();
	public IncomeSVO getSalesfromBank();
	
	public IncomeSVO getCOGSfromAuto();
	public IncomeSVO getCOGSfromBank();
	public IncomeSVO getCOGSfromCash();
	
	public IncomeSVO getOperExpensefromAuto();
	public IncomeSVO getOperExpensefromBank();
	public IncomeSVO getOperExpensefromCash();	
}
