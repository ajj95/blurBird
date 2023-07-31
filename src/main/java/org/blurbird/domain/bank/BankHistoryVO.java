package org.blurbird.domain.bank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BankHistoryVO {
	private String bankname;			// 은행이름
	private String accountnumber;	// 계좌번호
	private String bhdate;   			// 통장내역 일자
	private String source;				// 적요(거래처)
	private String sortno;				// 1:입금 2:출금
	private int amount;					// 입금액or출금액
	private int sum;						// 잔액
	private String memo;				// 메모
	private String bhstatename;		// 확정or미연결 등 전표상태
}
