package org.blurbird.domain.bank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BankSlipVO {
	private String bhno;				// ���峻�� ��ȣ
	private String source;			// �ŷ�ó
	private String summary;		// ��ǥ����
	private String accountname;  // ������
	private String bhstatename;  // ��ǥ����
	private int sum;				   // �����ܾ�
}
