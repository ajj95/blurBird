package org.blurbird.mapper;

import java.util.List;

import org.blurbird.domain.bank.BankHistoryVO;
import org.blurbird.domain.bank.BankSearchDTO;
import org.blurbird.domain.bank.BankSlipVO;
import org.blurbird.domain.bank.DetailSlipVO;
import org.blurbird.domain.bank.TotalDTO;

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
	
	// 전표내역 잔액, 차액 합계
	public TotalDTO getTotalSum();
	
	// 분개내역 조회
	public List<DetailSlipVO> getDetailSlip(int bhno);
	// 분개내역 입력
	public void registerSlip(DetailSlipVO slip);
	// 분개내역 수정
	public int modifySlip(DetailSlipVO slip);
	
	// 전표 삭제 (2행 모두)
	public int removeSlip(String bhno);
	
	// 전표내역 상태 개수(가능, 확정, 제외, 삭제)
	
	// 계정과목 조회 (검색)
	//public List<>
	
}
