package org.blurbird.service.bank;

import java.util.List;

import org.blurbird.domain.bank.BankHistoryVO;
import org.blurbird.domain.bank.BankSearchDTO;
import org.blurbird.domain.bank.BankSlipVO;
import org.blurbird.domain.bank.DetailSlipVO;
import org.blurbird.domain.bank.TotalDTO;
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


}
