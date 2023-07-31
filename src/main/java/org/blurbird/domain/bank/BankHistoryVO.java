package org.blurbird.domain.bank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BankHistoryVO {
	private String bankname;			// �����̸�
	private String accountnumber;	// ���¹�ȣ
	private String bhdate;   			// ���峻�� ����
	private String source;				// ����(�ŷ�ó)
	private String sortno;				// 1:�Ա� 2:���
	private int amount;					// �Աݾ�or��ݾ�
	private int sum;						// �ܾ�
	private String memo;				// �޸�
	private String bhstatename;		// Ȯ��or�̿��� �� ��ǥ����
}
