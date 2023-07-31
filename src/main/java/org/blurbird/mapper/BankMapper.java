package org.blurbird.mapper;

import java.util.List;

import org.blurbird.domain.bank.BankHistoryVO;
import org.blurbird.domain.bank.BankSearchDTO;
import org.blurbird.domain.bank.BankSlipVO;
import org.blurbird.domain.bank.DetailSlipVO;

public interface BankMapper {
	
	// ���峻�� ��ü ��ȸ
	public List<BankHistoryVO> getBankHistoryList(BankSearchDTO search);
	// ���峻�� ��ǥ �̿��� ��ȸ
	public List<BankHistoryVO> getBankHistoryListNone(BankSearchDTO search);
	// ���峻�� ��ǥ ���� ��ȸ
	public List<BankHistoryVO> getBankHistoryListConn(BankSearchDTO search);
	
	// ��ǥ���� ��ü ��ȸ
	public List<BankSlipVO> getBankSlipList(BankSearchDTO search);
	// ��ǥ���� ����orȮ��or����or���� ��ȸ
	public List<BankSlipVO> getBankSlipListState(BankSearchDTO search);
	
	// �а����� ��ȸ
	public List<DetailSlipVO> getDetailSlip(int bhno);
	
	
}
