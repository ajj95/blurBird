package org.blurbird.mapper;

import java.util.List;

import org.blurbird.domain.bank.BankHistoryVO;
import org.blurbird.domain.bank.BankSearchDTO;
import org.blurbird.domain.bank.BankSlipVO;
import org.blurbird.domain.bank.DetailSlipVO;
import org.blurbird.domain.bank.TotalDTO;

public interface BankMapper {
	
	// 통장내역 조회
	public List<BankHistoryVO> getBankHistoryList(BankSearchDTO search);
	// 통장내역 전표 미연결 조회
	public List<BankHistoryVO> getBankHistoryListNone(BankSearchDTO search);
	// 통장내역 전표 연결 조회
	public List<BankHistoryVO> getBankHistoryListConn(BankSearchDTO search);
	
	// 전표내역 조회
	public List<BankSlipVO> getBankSlipList(BankSearchDTO search);
	// 전표내역 상태별 조회
	public List<BankSlipVO> getBankSlipListState(BankSearchDTO search);
	
	// 전표내역 상태별 개수
	public int allSlipCount();
	public int canSlipCount();
	public int confirmSlipCount();
	public int exceptSlipCount();
	public int removeSlipCount();
	
	
	// 예상잔액, 차액 조회
	public TotalDTO getTotalSum();
	
	// 분개내역 조회
	public List<DetailSlipVO> getDetailSlip(String bhno);
	// 분개내역 등록
	public void registerSlip(DetailSlipVO slip);
	// 분개내역 수정
	public int modifySlip(DetailSlipVO slip);
	
	// 전표 삭제
	public int removeSlip(String bhno);
	
	
}
