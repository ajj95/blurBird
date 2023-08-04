package org.blurbird.service.bank;

import java.util.List;

import org.blurbird.domain.bank.BankHistoryVO;
import org.blurbird.domain.bank.BankSearchDTO;
import org.blurbird.domain.bank.BankSlipVO;
import org.blurbird.domain.bank.BhMessageVO;
import org.blurbird.domain.bank.DetailSlipVO;
import org.blurbird.domain.bank.KeywordDTO;
import org.blurbird.domain.bank.TotalDTO;
import org.blurbird.domain.common.BusinessVO;
import org.blurbird.mapper.BankMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Service
@AllArgsConstructor
@Log4j
public class BankServiceImpl implements BankService {

	public BankMapper mapper;
	
	// 통장내역 전체조회
	@Override
	public List<BankHistoryVO> getBankHistoryList(BankSearchDTO search) {
		return mapper.getBankHistoryList(search);
	}

	// 통장내역 미연결 조회
	@Override
	public List<BankHistoryVO> getBankHistoryListNone(BankSearchDTO search) {
		return mapper.getBankHistoryListNone(search);
	}

	// 통장내역 연결 조회
	@Override
	public List<BankHistoryVO> getBankHistoryListConn(BankSearchDTO search) {
		return mapper.getBankHistoryListConn(search);
	}

	// 전표 전체 리스트 조회
	@Override
	public List<BankSlipVO> getBankSlipList(BankSearchDTO search) {
		return mapper.getBankSlipList(search);
	}

	// 전표 상태별 조회
	@Override
	public List<BankSlipVO> getBankSlipListState(BankSearchDTO search) {
		return mapper.getBankSlipListState(search);
	}
	
	// 예상 잔액, 차액 조회
	@Override
	public TotalDTO getTotalSum() {
		return mapper.getTotalSum();
	}

	// 분개내역 조회
	@Override
	public List<DetailSlipVO> getDetailSlip(String bhno) {
		return mapper.getDetailSlip(bhno);
	}
	
	// 분개내역 수정
	@Override
	public int modifySlip(DetailSlipVO detailSlip) {
		return mapper.modifySlip(detailSlip);
	}

	// 전표 상태별 개수
	@Override
	public int allSlipCount() {
		return mapper.allSlipCount();
	}

	@Override
	public int canSlipCount() {
		return mapper.canSlipCount();
	}

	@Override
	public int confirmSlipCount() {
		return mapper.confirmSlipCount();
	}

	@Override
	public int exceptSlipCount() {
		return mapper.exceptSlipCount();
	}

	@Override
	public int removeSlipCount() {
		return mapper.removeSlipCount();
	}

	// 전표 상태 수정
	@Override
	public boolean modifySlipState(String bhno, String bhstateno) {
		return mapper.modifySlipState(bhno, bhstateno)==1;
	}

	// 원하는 통장내역 조회
	@Override
	public List<BankHistoryVO> getBankHistoryDetail(List<String> bhnos) {
	    return mapper.getBankHistoryDetail(bhnos);
	}

	// 분개전표 등록
	@Override
	public void registerDetailSlip(DetailSlipVO detailSlip) {
		mapper.registerSlip(detailSlip);
	}
	
	// 메시지 요청 시 등록
	@Override
	public void registerMessage(String bhno, String message, String receiver, String sender) {
		mapper.registerMesasge(bhno, message, receiver, sender);
	}

	// 메모 수정
	@Override
	public int modifymemo(String bhno, String memo) {
		return mapper.modifymemo(bhno, memo);
	}
	
	// 키워드 전체 조회
	@Override
	public List<KeywordDTO> getListKeyword() {
		return mapper.getListKeyword();
	}

	// 차변 입력
	@Override
	public void registerDebt(String bhno, String accountno, int amount) {
		mapper.registerDebt(bhno, accountno, amount);
	}
	
	// 대변 입력
	@Override
	public void registerCredit(String bhno, String accountno, int amount) {
		mapper.registerCredit(bhno, accountno, amount);
	}

	// 확인 안한 메시지 개수
	@Override
	public int uncheckedMessageCount(String receiver) {
		return mapper.uncheckedMessageCount(receiver);
	}

	// 메시지 전체 리스트
	@Override
	public List<BhMessageVO> getListMessage(String receiver) {
		return mapper.getListMessage(receiver);
	}

	// 메시지에서 통장내역 가져오기
	@Override
	public BankHistoryVO getBhFromMessage(String messageno) {
		return mapper.getBhFromMessage(messageno);
	}

	// 메시지 읽음처리
	@Override
	public int modifyMessageState(String messageno) {
		return mapper.modifyMessageState(messageno);
	}

}
