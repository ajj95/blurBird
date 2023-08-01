package org.blurbird.domain.bank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BusinessVO {

	private String bizno;
	private String bizname;
	private String businesslicense;
	private String bizaddress;
	private String bistel;
	private String indusrty;
	
}
