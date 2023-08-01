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
	
	// 통장내역 전체리스트
	@Override
	public List<BankHistoryVO> getBankHistoryList(BankSearchDTO search) {
		return mapper.getBankHistoryList(search);
	}

	// 통장내역 전표미연결 리스트
	@Override
	public List<BankHistoryVO> getBankHistoryListNone(BankSearchDTO search) {
		return mapper.getBankHistoryListNone(search);
	}

	// 통장내역 전표연결 리스트
	@Override
	public List<BankHistoryVO> getBankHistoryListConn(BankSearchDTO search) {
		return mapper.getBankHistoryListConn(search);
	}

	// 전표 내역 전체 리스트
	@Override
	public List<BankSlipVO> getBankSlipList(BankSearchDTO search) {
		return mapper.getBankSlipList(search);
	}

	// 전표 내역 특정 상태 리스트
	@Override
	public List<BankSlipVO> getBankSlipListState(BankSearchDTO search) {
		return mapper.getBankSlipListState(search);
	}
	
	// 전표 예상 잔액 합계 리스트
	@Override
	public TotalDTO getTotalSum() {
		return mapper.getTotalSum();
	}

	// 분개 내역 조회
	@Override
	public List<DetailSlipVO> getDetailSlip(int bhno) {
		return mapper.getDetailSlip(bhno);
	}



}
