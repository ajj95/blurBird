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
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
    
    
    // 전표 체크 후 분개내역 조회 클릭 시 분개내역 출력
    @GetMapping("/detailslip")
    public ResponseEntity<List<DetailSlipVO>> getDetailSlip(@RequestParam("bhno") List<String> bhnoList) {
        List<DetailSlipVO> detailSlip = new ArrayList<>();
        for (String bhno : bhnoList) {
            List<DetailSlipVO> detailSlipByBhno = service.getDetailSlip(bhno);
            detailSlip.addAll(detailSlipByBhno);
        }
        return ResponseEntity.ok(detailSlip);
    }
    

}
