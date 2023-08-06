package org.blurbird.mapper;

import java.util.List;

import org.blurbird.domain.docrequest.DocReqHistoryVO;
import org.blurbird.domain.docrequest.DocumentRequestVO;

public interface DocrequestMapper {

	public List<DocumentRequestVO> getDocrequestList();
	
	public DocumentRequestVO getDocrequestread(String docreqno);
	
	public void createdoc(DocumentRequestVO documentRequest);
	public void createstate();
	
	public void issuance(String docreqno);
	public void issuancedel(String docreqno);
	
	public void received(String docreqno);
	public void receiveddel(String docreqno);
	
}
