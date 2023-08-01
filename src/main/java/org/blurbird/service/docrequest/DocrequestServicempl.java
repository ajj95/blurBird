package org.blurbird.service.docrequest;

import java.util.List;

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
		log.info(mapper.getDocrequestList());
		return mapper.getDocrequestList();
	}

}
