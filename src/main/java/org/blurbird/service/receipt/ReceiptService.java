package org.blurbird.service.receipt;

import java.sql.Date;
import java.util.List;

import org.blurbird.domain.receipt.AccountVO;
import org.blurbird.domain.receipt.DateRange;
import org.blurbird.domain.receipt.ReceiptRequestVO;
import org.springframework.stereotype.Service;

@Service
public interface ReceiptService {
	public List<AccountVO> getAccountList();
	public List<ReceiptRequestVO> getReceiptList(DateRange dateRange);
}
