package org.blurbird.service.bank;

import java.util.List;

import org.blurbird.domain.bank.BankHistoryVO;
import org.blurbird.domain.bank.BankSearchDTO;

public interface BankService {
	// 통장내역 전체 리스트
	public List<BankHistoryVO> getBankHistoryList(BankSearchDTO search);
	// 통장내역 미연결 리스트
	public List<BankHistoryVO> getBankHistoryListNone(BankSearchDTO search);
	// 통장내역 연결 리스트
	public List<BankHistoryVO> getBankHistoryListConn(BankSearchDTO search);
	
	
	
}
