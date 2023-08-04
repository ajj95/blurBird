package org.blurbird.service.info;

import java.util.List;

import org.blurbird.domain.common.BusinessVO;
import org.blurbird.domain.info.IncomeSVO;
import org.blurbird.domain.info.InfoData;

public interface InfoService {

	public List<BusinessVO> getListBusiness();
	
	public IncomeSVO getISByBiz(InfoData infoData);
	
	public List<InfoData> getList(InfoData infoData);
}
