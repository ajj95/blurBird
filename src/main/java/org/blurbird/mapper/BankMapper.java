package org.blurbird.mapper;

import java.util.List;

import org.blurbird.domain.bank.BankHistoryVO;
import org.blurbird.domain.bank.BankSearchDTO;

public interface BankMapper {
	
	// ���峻�� ��ü ��ȸ
	public List<BankHistoryVO> getBankHistoryList(BankSearchDTO search);
	// ���峻�� ��ǥ �̿��� ��ȸ
	public List<BankHistoryVO> getBankHistoryListNone(BankSearchDTO search);
	// ���峻�� ��ǥ ���� ��ȸ
	public List<BankHistoryVO> getBankHistoryListConn(BankSearchDTO search);
	
	// ��ǥ���� ��ü ��ȸ
	
	// ��ǥ���� Ȯ�� ���� ��ȸ
	
	// ��ǥ���� Ȯ�� ��ȸ
	
	// ��ǥ���� ���� ��ȸ
	
	// ��ǥ���� ���� ��ȸ
	
	
	// �а����� ��ȸ
	
	
}
