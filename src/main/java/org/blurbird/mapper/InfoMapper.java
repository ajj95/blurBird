package org.blurbird.mapper;

import java.util.List;

import org.blurbird.domain.bank.BusinessVO;
import org.blurbird.domain.info.FinancialSVO;
import org.blurbird.domain.info.IncomeSVO;

public interface InfoMapper {

	public List<BusinessVO> getListBusiness();
	
	public IncomeSVO getSalesfromAuto();
	public IncomeSVO getSalesfromBank();
	
}
