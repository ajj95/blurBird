package org.blurbird.domain.info;

import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import lombok.Data;

@Data
public class IncomeSVO {
	
	private Long salesfromautoslip;
	private Long salesfrombankslip;
	private Long totalsales;
	
	private Long cogsfromautoslip;
	private Long cogsfrombankslip;
	private Long cogsfromcashslip;
	private Long totalcogs;
	
	private Long OperExpensefromAutoSlip;
	private Long OperExpensefromBankSlip;
	private Long OperExpensefromCashSlip;
	private Long totaloe;
	
	private Long businessIncome;

	private Long NonOperIncomefromAutoSlip;
	private Long NonOperIncomefromBankSlip;
	private Long NonOperIncomefromCashSlip;
	private Long totalnoi;
	
	private Long NonOperExpensefromAutoSlip;
	private Long NonOperExpensefromBankSlip;
	private Long NonOperExpensefromCashSlip;
	private Long totalnoe;
	
	private Long tax;
}
