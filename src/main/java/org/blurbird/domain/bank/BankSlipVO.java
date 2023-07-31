package org.blurbird.domain.bank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BankSlipVO {
	private String bhno;				// 통장내역 번호
	private String source;			// 거래처
	private String summary;		// 전표적요
	private String accountname;  // 상대계정
	private String bhstatename;  // 전표상태
	private int sum;				   // 예상잔액
}
