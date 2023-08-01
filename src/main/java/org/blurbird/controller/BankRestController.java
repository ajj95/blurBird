package org.blurbird.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.blurbird.domain.bank.BankHistoryVO;
import org.blurbird.domain.bank.BankSearchDTO;
import org.blurbird.domain.bank.BankSlipVO;
import org.blurbird.domain.bank.TotalDTO;
import org.blurbird.service.bank.BankService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/bank/*")
@Log4j
@AllArgsConstructor
public class BankRestController {
	
	private BankService service;
	
	// 조회 버튼 클릭 시 통장내역, 전표내역 출력
    @PostMapping("/getHistoryAndSlip")
    public ResponseEntity<?> getHistoryAndSlip(@RequestBody BankSearchDTO search) {
        List<BankHistoryVO> historyList = service.getBankHistoryList(search);
        List<BankSlipVO> slipList = service.getBankSlipList(search);
        TotalDTO total = service.getTotalSum();
        log.info(total);
        
        if(slipList==null) {
        	log.info("리스트 널");
        }else {
        	log.info(slipList);
        }
        
        Map<String, Object> result = new HashMap<>();
        result.put("historyList", historyList);
        result.put("slipList", slipList);
        result.put("total", total);
        
        return ResponseEntity.ok(result);
    }
    
    // 버튼 클릭 시 상태별로 전표내역 출력
    @PostMapping("/getSlipStateList")
    public ResponseEntity<?> getSlipStateList(@RequestBody BankSearchDTO search){
    	List<BankSlipVO> slipList = service.getBankSlipListState(search);
    	TotalDTO total = service.getTotalSum();
    	
    	Map<String, Object> result = new HashMap<>();
    	result.put("slipList", slipList);
    	result.put("total", total);
    	return ResponseEntity.ok(result);
    }
    
    // 버튼 클릭 시 전표내역 전체 출력
    @PostMapping("/getSlipStateListAll")
    public ResponseEntity<?> getSlipStateListAll(@RequestBody BankSearchDTO search){
    	List<BankSlipVO> slipList = service.getBankSlipList(search);
    	TotalDTO total = service.getTotalSum();
    	
    	Map<String, Object> result = new HashMap<>();
    	result.put("slipList", slipList);
    	result.put("total", total);
    	return ResponseEntity.ok(result);
    }
    
	
    // 전표 내역 선택 시 분개내역 출력

}
