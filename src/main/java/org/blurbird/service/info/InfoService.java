package org.blurbird.service.info;

import java.util.List;

import org.blurbird.domain.bank.BusinessVO;
import org.blurbird.domain.info.IncomeSVO;
import org.blurbird.domain.info.InfoData;

public interface InfoService {

	public List<BusinessVO> getListBusiness();
	
//	public List<IncomeSVO> getISElements(Long bizno, String year);
	
	public Long getSalesfromAuto(InfoData infoData);
}
