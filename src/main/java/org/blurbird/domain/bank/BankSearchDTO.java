package org.blurbird.domain.bank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BankSearchDTO {

	private String startdate;
	private String enddate;
	private String bizno;
	private String bankname;
	private String bhstateno;    // slip조회시 가능, 확정, 제외, 삭제 유형
}
