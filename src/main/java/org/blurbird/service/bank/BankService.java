package org.blurbird.service.bank;

import java.util.List;

import org.blurbird.domain.bank.BankHistoryVO;
import org.blurbird.domain.bank.BankSearchDTO;
import org.blurbird.domain.bank.BankSlipVO;
import org.blurbird.domain.bank.DetailSlipVO;
import org.blurbird.domain.bank.TotalDTO;

public interface BankService {
	// 통장내역 전체 리스트
	public List<BankHistoryVO> getBankHistoryList(BankSearchDTO search);
	// 통장내역 미연결 리스트
	public List<BankHistoryVO> getBankHistoryListNone(BankSearchDTO search);
	// 통장내역 연결 리스트
	public List<BankHistoryVO> getBankHistoryListConn(BankSearchDTO search);
	
	// 전표 전체 리스트
	public List<BankSlipVO> getBankSlipList(BankSearchDTO search);
	// 전표 특정 유형 리스트
	public List<BankSlipVO> getBankSlipListState(BankSearchDTO search);
	
	// 전표 예상 잔액, 차액 합계
	public TotalDTO getTotalSum();
	
	// 분개 내역 조회
	public List<DetailSlipVO> getDetailSlip(int bhno);
	
	
}
