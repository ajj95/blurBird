package org.blurbird.mapper;

import java.util.List;

import org.blurbird.domain.MemberVO;
import org.blurbird.domain.receipt.AccountVO;

public interface ReceiptMapper {

	public AccountVO getAccountName(String AccountNo);
	
	public List<AccountVO> getList();
}
