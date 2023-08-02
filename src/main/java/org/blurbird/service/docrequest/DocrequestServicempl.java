package org.blurbird.service.docrequest;

import java.util.List;

import org.blurbird.domain.docrequest.DocReqHistoryVO;
import org.blurbird.domain.docrequest.DocumentRequestVO;
import org.blurbird.mapper.DocrequestMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class DocrequestServicempl implements DocrequestService {
	
	public DocrequestMapper mapper;
	
	public List<DocumentRequestVO> getDocrequestList() {
		return mapper.getDocrequestList();
	}

	public void createdoc(DocumentRequestVO documentRequest) {
		mapper.createdoc(documentRequest);
	}

	public void createstate() {
		mapper.createstate();
	}

	public void issuance() {
		mapper.issuance();
	}

}
