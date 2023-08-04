package org.blurbird.domain.receipt;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReceiptRequestVO {
	private String recreqno;
	private String userno;
	private Date reqdate;
	private String purpose;
	private String receiptpath;
	
	private String confirmed;
	private String contents;
}
