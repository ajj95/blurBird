package org.blurbird.domain.docrequest;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date receivingdate;
	
}
