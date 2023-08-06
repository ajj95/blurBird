package org.blurbird.domain.receipt;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CashSlipVO {
	private String cashslipno;
	private String confirmedno;
	private String accountno;
	private String sortno;
	private int amount;
	private String summary;
	private String bcnc;
}
