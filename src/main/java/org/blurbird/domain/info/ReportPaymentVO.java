package org.blurbird.domain.info;

import java.util.Date;

import lombok.Data;

@Data
public class ReportPaymentVO {

	private String reportpaymentno;
	private String bizno;
	private String bizname;
	private String year;
	private String bizincome;
	private String tax;
	private String reportdate;
	private String reportdoc;
	private String paymentslip;
	private String transdate;
	private String status;
	
}
