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
	
	// ��ȸ ��ư Ŭ�� �� ���峻��, ��ǥ���� ���
    @PostMapping("/getHistoryAndSlip")
    public ResponseEntity<?> getHistoryAndSlip(@RequestBody BankSearchDTO search) {
        List<BankHistoryVO> historyList = service.getBankHistoryList(search);
        List<BankSlipVO> slipList = service.getBankSlipList(search);
        TotalDTO total = service.getTotalSum();
        log.info(total);
        
        if(slipList==null) {
        	log.info("����Ʈ ��");
        }else {
        	log.info(slipList);
        }
        
        Map<String, Object> result = new HashMap<>();
        result.put("historyList", historyList);
        result.put("slipList", slipList);
        result.put("total", total);
        
        return ResponseEntity.ok(result);
    }
    
    // ��ư Ŭ�� �� ���º��� ��ǥ���� ���
    @PostMapping("/getSlipStateList")
    public ResponseEntity<?> getSlipStateList(@RequestBody BankSearchDTO search){
    	List<BankSlipVO> slipList = service.getBankSlipListState(search);
    	TotalDTO total = service.getTotalSum();
    	
    	Map<String, Object> result = new HashMap<>();
    	result.put("slipList", slipList);
    	result.put("total", total);
    	return ResponseEntity.ok(result);
    }
    
    // ��ư Ŭ�� �� ��ǥ���� ��ü ���
    @PostMapping("/getSlipStateListAll")
    public ResponseEntity<?> getSlipStateListAll(@RequestBody BankSearchDTO search){
    	List<BankSlipVO> slipList = service.getBankSlipList(search);
    	TotalDTO total = service.getTotalSum();
    	
    	Map<String, Object> result = new HashMap<>();
    	result.put("slipList", slipList);
    	result.put("total", total);
    	return ResponseEntity.ok(result);
    }
    
	
    // ��ǥ ���� ���� �� �а����� ���

}
