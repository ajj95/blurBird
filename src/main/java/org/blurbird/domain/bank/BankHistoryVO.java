package org.blurbird.domain.bank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BankHistoryVO {
	private String bhno;					
	private String bankname;			
	private String accountnumber;	
	private String bhdate;   			
	private String source;				
	private String sortno;				
	private int amount;					
	private int sum;						
	private String memo;				
	private String bhstatename;		
}
