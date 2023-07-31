package org.blurbird.mapper;

import java.util.List;

import org.blurbird.domain.bank.BankHistoryVO;
import org.blurbird.domain.bank.BankSearchDTO;

public interface BankMapper {
	
	// 통장내역 전체 조회
	public List<BankHistoryVO> getBankHistoryList(BankSearchDTO search);
	// 통장내역 전표 미연결 조회
	public List<BankHistoryVO> getBankHistoryListNone(BankSearchDTO search);
	// 통장내역 전표 연결 조회
	public List<BankHistoryVO> getBankHistoryListConn(BankSearchDTO search);
	
	// 전표내역 전체 조회
	
	// 전표내역 확정 가능 조회
	
	// 전표내역 확정 조회
	
	// 전표내역 제외 조회
	
	// 전표내역 삭제 조회
	
	
	// 분개내역 조회
	
	
}
