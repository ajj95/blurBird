package org.blurbird.service.info;

import java.util.List;

import org.blurbird.domain.common.BusinessVO;
import org.blurbird.domain.info.IncomeSVO;
import org.blurbird.domain.info.InfoMainVO;
import org.blurbird.domain.info.ReportPaymentVO;

public interface InfoService {

	public List<InfoMainVO> getListBusiness();
	
	public IncomeSVO getISByBiz(InfoMainVO infoMainVO);
	
	public List<InfoMainVO> getList(InfoMainVO infoMainVO);
	
	public void report(ReportPaymentVO reportPaymentVO);
	
	public void transfer(ReportPaymentVO reportPaymentVO);
	
	public ReportPaymentVO rptfResult(ReportPaymentVO reportPaymentVO);
	
	public int getStatusCount();
	public int getTotalCount();

}
