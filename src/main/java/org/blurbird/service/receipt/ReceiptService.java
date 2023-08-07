package org.blurbird.service.receipt;

import java.sql.Date;
import java.util.List;

import org.blurbird.domain.receipt.AccountVO;
import org.blurbird.domain.receipt.CashSlipVO;
import org.blurbird.domain.receipt.ConfirmedVO;
import org.blurbird.domain.receipt.DateRange;
import org.blurbird.domain.receipt.ReceiptRequestVO;
import org.blurbird.domain.receipt.UnconfirmedReasonVO;
import org.springframework.stereotype.Service;

@Service
public interface ReceiptService {
	public List<AccountVO> getAccountList();
	public List<ReceiptRequestVO> getReceiptList(DateRange dateRange);
	public String getImgPath(String recreqno);
	public void uploadReceipt(ReceiptRequestVO receipt);
	public void confirmedReceipt(ConfirmedVO confirmed);
	public void unconfirmedReceipt(UnconfirmedReasonVO unconfirmed);
	public void cashslipConfirmed(CashSlipVO cashSlip);
	public ReceiptRequestVO judgeReceipt(String recreqno);
	public ReceiptRequestVO getReceiptRequestsWithConfirmation(String recreqno);
	public String getUserno(String businesslicense);
}
