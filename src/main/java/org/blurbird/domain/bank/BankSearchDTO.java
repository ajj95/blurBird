package org.blurbird.domain.bank;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BankSearchDTO {

	private Date startdate;
	private Date enddate;
	private String bizno;
	private String bankname;
}
