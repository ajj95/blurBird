package org.blurbird.service.bank;

import java.util.List;

import org.blurbird.domain.bank.BankHistoryVO;
import org.blurbird.domain.bank.BankSearchDTO;
import org.blurbird.domain.bank.BankSlipVO;
import org.blurbird.domain.bank.DetailSlipVO;
import org.blurbird.domain.bank.TotalDTO;

public interface BankService {
	// ���峻�� ��ü ����Ʈ
	public List<BankHistoryVO> getBankHistoryList(BankSearchDTO search);
	// ���峻�� �̿��� ����Ʈ
	public List<BankHistoryVO> getBankHistoryListNone(BankSearchDTO search);
	// ���峻�� ���� ����Ʈ
	public List<BankHistoryVO> getBankHistoryListConn(BankSearchDTO search);
	
	// ��ǥ ��ü ����Ʈ
	public List<BankSlipVO> getBankSlipList(BankSearchDTO search);
	// ��ǥ Ư�� ���� ����Ʈ
	public List<BankSlipVO> getBankSlipListState(BankSearchDTO search);
	
	// ��ǥ ���� �ܾ�, ���� �հ�
	public TotalDTO getTotalSum();
	
	// �а� ���� ��ȸ
	public List<DetailSlipVO> getDetailSlip(int bhno);
	
	
}
