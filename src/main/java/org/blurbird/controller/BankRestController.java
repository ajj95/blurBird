package org.blurbird.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.blurbird.domain.bank.BankHistoryVO;
import org.blurbird.domain.bank.BankSearchDTO;
import org.blurbird.domain.bank.BankSlipVO;
import org.blurbird.domain.bank.DetailSlipVO;
import org.blurbird.domain.bank.TotalDTO;
import org.blurbird.service.bank.BankService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/bank/*")
@Log4j
@AllArgsConstructor
public class BankRestController {
	
	private BankService service;
	
	// 조회 버튼 클릭 시 전체 테이블 랜더링
    @PostMapping("/getHistoryAndSlip")
    public ResponseEntity<?> getHistoryAndSlip(@RequestBody BankSearchDTO search) {
        List<BankHistoryVO> historyList = service.getBankHistoryList(search);
        List<BankSlipVO> slipList = service.getBankSlipList(search);
        TotalDTO total = service.getTotalSum();
        int can = service.canSlipCount();
        int confirmed = service.confirmSlipCount();
        int except = service.exceptSlipCount();
        int remove = service.removeSlipCount();
        int all = service.allSlipCount();
        
        Map<String, Object> result = new HashMap<>();
        result.put("historyList", historyList);
        result.put("slipList", slipList);
        result.put("total", total);
        result.put("all", all);
        result.put("can", can);
        result.put("confirmed", confirmed);
        result.put("except", except);
        result.put("remove", remove);
        
        return ResponseEntity.ok(result);
    }
    
    
    // 분개내역조회 클릭 시 해당 분개내역 전달
    @GetMapping("/detailslip")
    public ResponseEntity<List<DetailSlipVO>> getDetailSlip(@RequestParam("bhno") List<String> bhnoList) {
        List<DetailSlipVO> detailSlip = new ArrayList<>();
        
        // 파라미터로 넘어온 bhno를 모두 조회하면서
        for (String bhno : bhnoList) {
            List<DetailSlipVO> detailSlipByBhno = service.getDetailSlip(bhno);
            detailSlip.addAll(detailSlipByBhno); // 조회 결과를 전체 리스트에 추가
        }

        return ResponseEntity.ok(detailSlip);
    }
    
    // 저장 클릭 시 분개전표 수정처리
    @PostMapping("/updateDetailSlips")
    public ResponseEntity<String> updateDetailSlips(@RequestBody List<DetailSlipVO> detailSlipList) {
        try {
        	int check = 0;
        	for(DetailSlipVO detailSlip : detailSlipList) {
        		log.info(detailSlip.getBankslipno());
        		log.info(detailSlip.getAccountno());
        		log.info(detailSlip.getSortno());
        		log.info(detailSlip.getAmount());
        		log.info(detailSlip.getSource());
        		log.info(detailSlip.getSummary());
        		
        		if(service.modifySlip(detailSlip)!=1){
        			check = -1;
        		}
        	}
            // detailSlips를 사용하여 오라클 테이블에 업데이트 로직 수행
            // 업데이트 성공 시, "저장되었습니다." 메시지를 반환
        	if(check==0) {
        		return ResponseEntity.ok("저장되었습니다.");
        	}else {
        		return ResponseEntity.ok("저장에 실패하였습니다.");
        	}
        } catch (Exception e) {
            // 업데이트 실패 시, 에러 메시지를 반환
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("업데이트에 실패하였습니다.");
        }
    }
    

}
