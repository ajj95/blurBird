package org.blurbird.mapper;

import java.sql.Date;
import java.util.List;

import org.blurbird.domain.receipt.AccountVO;
import org.blurbird.domain.receipt.CashSlipVO;
import org.blurbird.domain.receipt.ConfirmedVO;
import org.blurbird.domain.receipt.DateRange;
import org.blurbird.domain.receipt.ReceiptRequestVO;
import org.blurbird.domain.receipt.UnconfirmedReasonVO;

public interface ReceiptMapper {
	public List<AccountVO> getAccountList();
	public List<ReceiptRequestVO> getReceiptList(DateRange dateRange);
	public String getImgResource(String recreqno);
	public void uploadReceipt(ReceiptRequestVO request);
	public void confirmedReceipt(ConfirmedVO confirmed);
	public void unconfirmedReceipt(UnconfirmedReasonVO unconfirmed);
	public void cashslipConfirmed(CashSlipVO cashSlipVO);
	public ReceiptRequestVO judgeReceipt(String recreqno);
	public ReceiptRequestVO getReceiptRequestsWithConfirmation(String recreqno);
	public String getUserno(String businesslicense);
}
