package org.blurbird.domain.receipt;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class UnconfirmedReasonVO {
	private String ucrNO;
	private String reqNO;
	private String contents; 
}
