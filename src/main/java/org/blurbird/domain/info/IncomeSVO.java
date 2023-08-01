package org.blurbird.domain.info;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class IncomeSVO {
	
	private Long salesfromautoslip;
	private Long salesfrombankslip;
	private Long totalsales;
	
}
