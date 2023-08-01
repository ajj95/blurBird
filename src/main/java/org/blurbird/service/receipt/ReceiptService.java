package org.blurbird.service.receipt;

import java.util.List;

import org.blurbird.domain.receipt.AccountVO;
import org.springframework.stereotype.Service;

@Service
public interface ReceiptService {
	public AccountVO read(String AcocuntNo);
	public List<AccountVO> getList();
}
