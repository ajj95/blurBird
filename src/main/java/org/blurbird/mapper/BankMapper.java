package org.blurbird.mapper;

import java.util.List;

import org.blurbird.domain.bank.BankHistoryVO;
import org.blurbird.domain.bank.BankSearchDTO;
import org.blurbird.domain.bank.BankSlipVO;
import org.blurbird.domain.bank.DetailSlipVO;
import org.blurbird.domain.bank.TotalDTO;

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
	
	// ��ǥ���� �ܾ�, ���� �հ�
	public TotalDTO getTotalSum();
	
	// �а����� ��ȸ
	public List<DetailSlipVO> getDetailSlip(int bhno);
	// �а����� �Է�
	public void registerSlip(DetailSlipVO slip);
	// �а����� ����
	public int modifySlip(DetailSlipVO slip);
	
	// ��ǥ ���� (2�� ���)
	public int removeSlip(String bhno);
	
	// ��ǥ���� ���� ����(����, Ȯ��, ����, ����)
	
	// �������� ��ȸ (�˻�)
	//public List<>
	
}
