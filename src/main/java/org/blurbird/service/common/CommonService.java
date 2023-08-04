package org.blurbird.service.common;

import java.util.List;
import java.util.Map;

import org.blurbird.domain.common.BusinessVO;

public interface CommonService {
	// 기업 리스트 가져오기
	public List<BusinessVO> getBusinessList(String bizname);
	// 기업명 조회
	//public List<String> getBusinessName(String bizname);
	// 검색어 자동 완성
	//List<Map<String, Object>> autosearch(Map<String, Object> paramMap);
}
