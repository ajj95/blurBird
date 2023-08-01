package org.blurbird.service.info;

import java.util.List;

import org.blurbird.domain.bank.BusinessVO;
import org.blurbird.domain.info.IncomeSVO;

public interface InfoService {

	public List<BusinessVO> getListBusiness();
	
	public IncomeSVO getTotalSales();
}
