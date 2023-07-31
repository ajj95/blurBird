package org.blurbird.service.bank;

import java.util.List;

import org.blurbird.domain.bank.BankHistoryVO;
import org.blurbird.domain.bank.BankSearchDTO;

public interface BankService {
	// ���峻�� ��ü ����Ʈ
	public List<BankHistoryVO> getBankHistoryList(BankSearchDTO search);
	// ���峻�� �̿��� ����Ʈ
	public List<BankHistoryVO> getBankHistoryListNone(BankSearchDTO search);
	// ���峻�� ���� ����Ʈ
	public List<BankHistoryVO> getBankHistoryListConn(BankSearchDTO search);
	
	
	
}
