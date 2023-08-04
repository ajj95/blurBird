package org.blurbird.service.common;

import java.util.List;
import java.util.Map;

import org.blurbird.domain.common.BusinessVO;
import org.blurbird.mapper.BankMapper;
import org.blurbird.mapper.CommonMapper;
import org.blurbird.service.bank.BankServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class CommonServiceImpl implements CommonService {

	@Autowired
	private CommonMapper mapper;
	
	// 기업리스트 가져오기
	@Override
	public List<BusinessVO> getBusinessList(String bizname) {
		return mapper.getBusinessList(bizname);
	}

	// 기업명 가져오기
	/*
	@Override
	public List<String> getBusinessName(String bizname) {
		return mapper.getBusinessName(bizname);
	}

	// 자동완성
	@Override
	public List<Map<String, Object>> autosearch(Map<String, Object> paramMap) {
		return mapper.autosearch(paramMap);
	}
	*/

}
