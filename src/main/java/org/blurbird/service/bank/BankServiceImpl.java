package org.blurbird.service.bank;

import java.util.List;

import org.blurbird.domain.bank.BankHistoryVO;
import org.blurbird.domain.bank.BankSearchDTO;
import org.blurbird.mapper.BankMapper;
import org.springframework.beans.factory.annotation.Autowired;

public class BankServiceImpl implements BankService {

	@Autowired
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

}
