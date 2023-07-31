package org.blurbird.mapper;

import java.util.List;

import org.blurbird.domain.bank.BankHistoryVO;
import org.blurbird.domain.bank.BankSearchDTO;
import org.blurbird.domain.bank.BankSlipVO;
import org.blurbird.domain.bank.DetailSlipVO;

public interface BankMapper {
	
	// 통장내역 전체 조회
	public List<BankHistoryVO> getBankHistoryList(BankSearchDTO search);
	// 통장내역 전표 미연결 조회
	public List<BankHistoryVO> getBankHistoryListNone(BankSearchDTO search);
	// 통장내역 전표 연결 조회
	public List<BankHistoryVO> getBankHistoryListConn(BankSearchDTO search);
	
	// 전표내역 전체 조회
	public List<BankSlipVO> getBankSlipList(BankSearchDTO search);
	// 전표내역 가능or확정or제외or삭제 조회
	public List<BankSlipVO> getBankSlipListState(BankSearchDTO search);
	
	// 분개내역 조회
	public List<DetailSlipVO> getDetailSlip(int bhno);
	
	
}
