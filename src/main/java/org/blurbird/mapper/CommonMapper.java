package org.blurbird.mapper;

import java.util.List;
import java.util.Map;

import org.blurbird.domain.common.BusinessVO;
import org.blurbird.domain.common.UsersVO;

public interface CommonMapper {
	
	// 기업 조회
	public List<BusinessVO> getBusinessList(String bizname);
	
	// id로 멤버 정보(권한 등) 가져오기
	public UsersVO readUser(String username);
	/*
	// 기업명 조회
	public List<String> getBusinessName(String bizname);
	
	// 검색어 자동 완성
	public List<Map<String, Object>> autosearch(Map<String, Object> paramMap);
	*/
}
