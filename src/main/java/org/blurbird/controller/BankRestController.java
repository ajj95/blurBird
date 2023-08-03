package org.blurbird.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.blurbird.domain.bank.BankHistoryVO;
import org.blurbird.domain.bank.BankSearchDTO;
import org.blurbird.domain.bank.BankSlipVO;
import org.blurbird.domain.bank.BhMessageVO;
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
    
    
    // 전표 상태 수정 요청 처리 -> String 각각이 아니라 Map으로 넘김
    @PostMapping("/modifySlipState")
    public ResponseEntity<String> modifySlipState(@RequestBody Map<String, String> requestBody) {
        try {
            String bhno = requestBody.get("bhno");
            String bhstateno = requestBody.get("bhstateno");
        	
            boolean check = service.modifySlipState(bhno, bhstateno);
            log.info("return값: " + check);
            
            if (check) {
                return ResponseEntity.ok("전표 상태가 수정되었습니다.");
            } else {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("전표 상태 수정에 실패하였습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("전표 상태 수정 중 오류가 발생하였습니다.");
        }
    }
    
    
    // 선택한 통장 내역 분개 전표에 보여주기
    @PostMapping("/getBankHistoryDetail")
    public ResponseEntity<List<BankHistoryVO>> getBankHistoryDetail(@RequestBody List<String> bhnos) {
        try {
            List<BankHistoryVO> bankHistoryDetailList = service.getBankHistoryDetail(bhnos);
            return ResponseEntity.ok(bankHistoryDetailList);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
    
    
    // 저장 클릭 시 분개전표 수정처리
    //@RequestMapping(value="/updateDetailSlips", method=RequestMethod.POST, consumes="application/json;charset=UTF-8", produces = "application/json;charset=UTF-8")
    @PostMapping(value="/updateDetailSlips", consumes=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> updateDetailSlips(@RequestBody List<DetailSlipVO> detailSlipList) {
        try {
        	int check = 0;
        	for(DetailSlipVO detailSlip : detailSlipList) {
        		check = service.modifySlip(detailSlip);
        		log.info("수정service가 반환하는 값이 1인지 확인: " + check);
        	}

        	return ResponseEntity.ok("저장되었습니다.");
        } catch (Exception e) {
            // 업데이트 실패 시, 에러 메시지를 반환
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("업데이트에 실패하였습니다.");
        }
    }// end updateDetailSlips
    
    
    // 분개내역 입력 처리
    @PostMapping("/insertdetailslips")
    public @ResponseBody String insertDetailsLips(@RequestBody List<DetailSlipVO> detailSlipVOList) {
    	
    	for (DetailSlipVO detailSlipVO : detailSlipVOList) {
            service.registerDetailSlip(detailSlipVO);
            // 입력시 확정으로 상태 변경
            service.modifySlipState(detailSlipVO.getBhno(), "1002");
        }
        
        return "저장되었습니다.";
    }
    
    // 내용확인요청 시 메시지 저장
    @PostMapping("/requestmessage")
    public ResponseEntity<String> updateMemo(@RequestBody Map<String, String> requestBody){
        String bhno = requestBody.get("bhno");
        String message = requestBody.get("message");
        String receiver = requestBody.get("receiver");
        String sender = requestBody.get("sender");
    	
        try {
            service.registerMessage(bhno, message, receiver, sender);
            return ResponseEntity.ok("내용확인을 요청하였습니다.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error updating memo: " + e.getMessage());
        }
    }
    
    
    // 수임사 화면에서 메시지 출력
    @GetMapping("/getMessageList")
    public ResponseEntity<Map<String, Object>> getMessageList(@RequestParam("receiver") String receiver) {
        Map<String, Object> response = new HashMap<>();
        List<BhMessageVO> messageList = service.getListMessage(receiver);
        int unreadMessageCount = service.uncheckedMessageCount(receiver);

        response.put("messageList", messageList);
        response.put("unreadMessageCount", unreadMessageCount);

        return ResponseEntity.ok(response);
    }
    
    // 수임사쪽에서 메시지 클릭해서 확인시
    @GetMapping("/getBHfromMessageno")
    public ResponseEntity<Map<String, Object>> getBHfromMessageno(@RequestParam("messageno") String messageno) {
        Map<String, Object> response = new HashMap<>();
        // 메시지번호로 통장 내역 가져오기
        BankHistoryVO bankhistory = service.getBhFromMessage(messageno);
        
        // 메시지 읽음처리
        service.modifyMessageState(messageno);

        response.put("bankhistory", bankhistory);

        return ResponseEntity.ok(response);
    }
    
    // 통장내역 메모 입력 후 저장 시
    
    
    
    
}
    
