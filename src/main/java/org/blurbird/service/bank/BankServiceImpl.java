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
	
	// ���峻�� ��ü����Ʈ
	@Override
	public List<BankHistoryVO> getBankHistoryList(BankSearchDTO search) {
		return mapper.getBankHistoryList(search);
	}

	// ���峻�� ��ǥ�̿��� ����Ʈ
	@Override
	public List<BankHistoryVO> getBankHistoryListNone(BankSearchDTO search) {
		return mapper.getBankHistoryListNone(search);
	}

	// ���峻�� ��ǥ���� ����Ʈ
	@Override
	public List<BankHistoryVO> getBankHistoryListConn(BankSearchDTO search) {
		return mapper.getBankHistoryListConn(search);
	}

	// ��ǥ ���� ��ü ����Ʈ
	@Override
	public List<BankSlipVO> getBankSlipList(BankSearchDTO search) {
		return mapper.getBankSlipList(search);
	}

	// ��ǥ ���� Ư�� ���� ����Ʈ
	@Override
	public List<BankSlipVO> getBankSlipListState(BankSearchDTO search) {
		return mapper.getBankSlipListState(search);
	}
	
	// ��ǥ ���� �ܾ� �հ� ����Ʈ
	@Override
	public TotalDTO getTotalSum() {
		return mapper.getTotalSum();
	}

	// �а� ���� ��ȸ
	@Override
	public List<DetailSlipVO> getDetailSlip(int bhno) {
		return mapper.getDetailSlip(bhno);
	}



}
