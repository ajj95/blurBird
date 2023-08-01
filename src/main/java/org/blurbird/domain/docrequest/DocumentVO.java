package org.blurbird.domain.docrequest;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DocumentVO {
	
	private String docno;
	private String docpath;
	private String ssnpublic;
	private String docreqno;
	
}
