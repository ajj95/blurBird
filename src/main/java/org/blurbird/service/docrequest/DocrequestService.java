package org.blurbird.service.docrequest;

import java.util.List;

import org.blurbird.domain.docrequest.DocReqHistoryVO;
import org.blurbird.domain.docrequest.DocumentRequestVO;

public interface DocrequestService {
	
	public List<DocumentRequestVO> getDocrequestList();

	public void createdoc(DocumentRequestVO documentRequest);
	public void createstate();
	
	public void issuance();
}
