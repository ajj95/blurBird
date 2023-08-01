package org.blurbird.domain.bank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DetailSlipVO {


	private String bankslipno;		// 전표코드
	private String bhno;				// 통장내역 코드
	private String sortno;			// 구분코드 (1~4)
	private String sortname;		// 구분명 (입금~대변)
	private String accountno;		// 계정코드
	private String accountname;	// 계정명
	private int amount;				// 차변 or 대변 금액
	private String source;			// 거래처명
	private String summary;		// 전표적요

}
