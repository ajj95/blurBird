package org.blurbird.service.receipt;

import java.sql.Date;
import java.util.List;

import org.blurbird.domain.receipt.AccountVO;
import org.blurbird.domain.receipt.CashSlipVO;
import org.blurbird.domain.receipt.ConfirmedVO;
import org.blurbird.domain.receipt.DateRange;
import org.blurbird.domain.receipt.ReceiptRequestVO;
import org.blurbird.domain.receipt.UnconfirmedReasonVO;
import org.blurbird.mapper.ReceiptMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReceiptServiceImpl implements ReceiptService {
	
	@Autowired
	private ReceiptMapper mapper;
	
	@Override
	public List<AccountVO> getAccountList() {
		log.info("getAccountList.....");
		return mapper.getAccountList();
	}

	@Override
	public List<ReceiptRequestVO> getReceiptList(DateRange dateRange) {
		log.info("getReceiptList....");
		return mapper.getReceiptList(dateRange);
	}

	@Override
	public String getImgPath(String recreqno) {
		log.info("getImgPath....");
		return mapper.getImgResource(recreqno);
	}

	@Override
	public void uploadReceipt(ReceiptRequestVO receipt) {
		mapper.uploadReceipt(receipt);
		log.info("uploadImg....");
	}

	@Override
	public void confirmedReceipt(ConfirmedVO confirmed) {
		mapper.confirmedReceipt(confirmed);
		log.info("confirmed.....");
	}

	@Override
	public void unconfirmedReceipt(UnconfirmedReasonVO unconfirmed) {
		mapper.unconfirmedReceipt(unconfirmed);
		log.info("unconfirmed....");
	}

	@Override
	public ReceiptRequestVO judgeReceipt(String recreqno) {
		mapper.judgeReceipt(recreqno);
		log.info("judging....");
		return mapper.judgeReceipt(recreqno);
	}

	@Override
	public void cashslipConfirmed(CashSlipVO cashSlip) {
		mapper.cashslipConfirmed(cashSlip);
		log.info("cashslip confirmed....");
	}

	@Override
	public ReceiptRequestVO getReceiptRequestsWithConfirmation(String recreqno) {
		log.info("confirmedReceipt.....");
		return mapper.getReceiptRequestsWithConfirmation(recreqno);
	}

	@Override
	public String getUserno(String businesslicense) {
		log.info("getUserno...");
		return mapper.getUserno(businesslicense);
	}

}