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
import org.blurbird.domain.bank.KeywordDTO;
import org.blurbird.domain.bank.TotalDTO;
import org.blurbird.domain.common.BusinessVO;
import org.blurbird.service.bank.BankService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
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
    @GetMapping("/sendMemo")
    public String sendMemo(@RequestParam("bhno")String bhno
    			, @RequestParam("amount")String amountwithcommas, @RequestParam("memo")String memo){
    	
    	// amount -> 쉼표 없애고 int로 변환
    	int amount = Integer.parseInt(amountwithcommas.replace(",", ""));

    	// 1. 통장내역에 메모 넣어 수정
    	service.modifymemo(bhno, memo);
    	
    	// 2. 키워드 조회, 메모와 비교해 가져올 수 있는 계정 확인
    	List<KeywordDTO> keywordlist = service.getListKeyword();
    	String accountno = null;
    	
    	for(KeywordDTO keyword:keywordlist) {
    		if(keyword.getKeywordname().equals(memo)){
    			accountno = keyword.getAccountno(); // 일치하는 것 하나 찾으면 넣어주기
    		}
    	}
    	
    	// 3. 입력받은 메모와 키워드가 일치한다면 해당 계정 적용되어 자동 분개, 자동 확정가능 전표로 등록
    	if(!accountno.equals(null)){
    		
    		// bhno로 입금인지 출금인지 조회
    		List<String> bhnos = new ArrayList<String>();
    		String sortno = "";
    		
    		bhnos.add(bhno);
    		
    		List<BankHistoryVO> bankhistory = service.getBankHistoryDetail(bhnos);
    		
    		for(BankHistoryVO bankVO : bankhistory) {
    			sortno = bankVO.getSortno();
    		}

    		if(sortno.equals("1")){
    			// 입금인 경우 차변 보통예금, 대변 해당하는 키워드에 맞는 계정코드
    			String debtaccountno = "103";
    			String creditaccountno = accountno;
    			
    			service.registerDebt(bhno, debtaccountno, amount);
    			service.registerCredit(bhno, creditaccountno, amount);
    		}else{
    			// 출금인 경우 차변 키워드에 맞는 계정코드, 대변 보통예금
    			String debtaccountno = accountno;
    			String creditaccountno = "103";
    			
    			service.registerDebt(bhno, debtaccountno, amount);
    			service.registerCredit(bhno, creditaccountno, amount);
    		}
    		
    		// 통장내역 확정 가능 상태로 변경
    		String bhstateno = "1001";
    		service.modifySlipState(bhno, bhstateno);
    	}
    	
    	return "메모가 저장되었습니다.";
    }
    
    // 수임사 메모 입력 시 수정 반영 처리
    @GetMapping("/modifyMemo")
    public String modifyMemo(@RequestParam("bhno")String bhno, @RequestParam("memo")String memo) {
      
    	service.modifymemo(bhno, memo);
       
        return "메모가 저장되었습니다.";
    }
    
    
}
    
