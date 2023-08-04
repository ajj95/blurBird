package org.blurbird.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.blurbird.domain.bank.DetailSlipVO;
import org.blurbird.domain.common.BusinessVO;
import org.blurbird.service.common.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/common/*")
@Log4j
@AllArgsConstructor
public class CommonRestController {
	
	private CommonService service;
	
	// 기업 조회
    @GetMapping("/getBizList")
    public ResponseEntity<List<BusinessVO>> getBusinessList(@RequestParam("bizname") String bizname) {
        List<BusinessVO> businessList = service.getBusinessList(bizname);

        return ResponseEntity.ok(businessList);
    }
    
    // 기업명 조회 (자동완성)
    /*
    @GetMapping("/getBizName")
    public ResponseEntity<List<String>> getBusinessName(@RequestParam("bizname") String bizname) {
        List<String> bizNameList = service.getBusinessName(bizname);

        return ResponseEntity.ok(bizNameList);
    }
    */
    
    // 자동완성
    /*
    @PostMapping("/autosearch")
	public @ResponseBody Map<String, Object> autocomplete
    						(@RequestParam Map<String, Object> paramMap){

		List<Map<String, Object>> bizList = service.autosearch(paramMap);
		paramMap.put("bizList", bizList);

		return paramMap;
	}*/
    
    
}
 
	

