package org.blurbird.service.bank;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.blurbird.domain.bank.BankHistoryVO;
import org.blurbird.domain.bank.BankSearchDTO;
import org.blurbird.domain.bank.BankSlipVO;
import org.blurbird.domain.bank.BhMessageVO;
import org.blurbird.domain.bank.DetailSlipVO;
import org.blurbird.domain.bank.KeywordDTO;
import org.blurbird.domain.bank.TotalDTO;
import org.blurbird.domain.common.BusinessVO;

public interface BankService {
	// 통장내역 전체 조회
	public List<BankHistoryVO> getBankHistoryList(BankSearchDTO search);
	// 통장내역 전표미연결 조회
	public List<BankHistoryVO> getBankHistoryListNone(BankSearchDTO search);
	// 통장내역 전표연결 조회
	public List<BankHistoryVO> getBankHistoryListConn(BankSearchDTO search);
	// 원하는 통장내역 조회
	public List<BankHistoryVO> getBankHistoryDetail(List<String> bhnos);
	
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
	
	// 예상잔액, 차액
	public TotalDTO getTotalSum();
	
	// 분개 내역 조회
	public List<DetailSlipVO> getDetailSlip(String bhno);
	
	// 분개 내역 입력
	public void registerDetailSlip(DetailSlipVO detailSlip);
	
	// 분개 내역 수정
	public int modifySlip(DetailSlipVO detailSlip);
	
	// 전표 상태 변경
	public boolean modifySlipState(String bhno, String bhstateno);
	
	// 내용확인 요청
	public void registerMessage(String bhno, String message, String receiver, String sender);
	// 메모 수정
	public int modifymemo(String bhno, String memo);
	// 키워드 전체 조회
	public List<KeywordDTO> getListKeyword();
	// 차변 입력
	public void registerDebt(String bhno, String accountno, int amount);
	// 대변 입력
	public void registerCredit(String bhno, String accountno, int amount);
		
	// 확인 안한 메시지 개수
	public int uncheckedMessageCount(String receiver);
	// 메시지 전체 리스트
	public List<BhMessageVO> getListMessage(String receiver);
	// 메시지에서 통장내역 가져오기
	public BankHistoryVO getBhFromMessage(String messageno);	
	// 메시지 읽음 처리
	public int modifyMessageState(String messageno);
	
	// 트랜잭션 처리: 수임사가 통장내역에 대한 메시지 입력시
	public void insertMemoForBH(String bhno, String amountwithcommas, String memo);

}
