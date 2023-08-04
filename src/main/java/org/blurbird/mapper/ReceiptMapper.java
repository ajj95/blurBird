package org.blurbird.mapper;

import java.sql.Date;
import java.util.List;

import org.blurbird.domain.receipt.AccountVO;
import org.blurbird.domain.receipt.DateRange;
import org.blurbird.domain.receipt.ReceiptRequestVO;

public interface ReceiptMapper {
	public List<AccountVO> getAccountList();
	public List<ReceiptRequestVO> getReceiptList(DateRange dateRange);
	public String getImgResource(String recreqno);
}
