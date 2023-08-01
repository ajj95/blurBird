package org.blurbird.domain.bank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DetailSlipVO {

	private String sortno;			// �����ڵ� (1~4)
	private String sortname;		// ���и� (�Ա�~�뺯)
	private String accountno;		// �����ڵ�
	private String accountname;	// ������
	private int amount;				// ���� or �뺯 �ݾ�
	private String source;			// �ŷ�ó��
	private String summary;		// ��ǥ����
}
