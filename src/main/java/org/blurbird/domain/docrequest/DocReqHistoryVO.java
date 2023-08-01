package org.blurbird.domain.docrequest;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DocReqHistoryVO {

	private String historyno;
	private String drstateno;
	private String docreqno;
	private Date receivingdate;
	
}
