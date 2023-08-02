package org.blurbird.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.blurbird.domain.MemberVO;
import org.blurbird.domain.receipt.AccountVO;
import org.blurbird.domain.receipt.DateRange;
import org.blurbird.domain.receipt.ReceiptRequestVO;
import org.blurbird.service.receipt.ReceiptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/receipt")
@Controller
@Log4j
public class ReceiptController {
	private ReceiptService service;

	@Autowired
	public ReceiptController(ReceiptService service) {
		this.service = service;
	}

	@GetMapping("/receiptta")
	public void read() {
		log.info("receiptta!!");
	}

	@GetMapping("/Test")
	public void test() {
		log.info("DatePicker Test!!!");
	}
	
	@PostMapping("/Test")

	@GetMapping("/receiptco")
	public void receiptco() {
		log.info("TEST!!");
	}

	@GetMapping("/receiptList")
	@ResponseBody
	public List<ReceiptRequestVO> getReceiptList(DateRange dateRange) {
		return service.getReceiptList(dateRange);
	}

	@GetMapping("/dateSearch")
	@ResponseBody // JSON 데이터를 반환하는 엔드포인트로 지정
	public ResponseEntity<List<ReceiptRequestVO>> searchData(
	        @RequestParam("startDate") String startDateStr,
	        @RequestParam("endDate") String endDateStr) {
	    LocalDate startDate = LocalDate.parse(startDateStr);
	    LocalDate endDate = LocalDate.parse(endDateStr);
	    DateRange dateRange = new DateRange(startDate, endDate);
	    List<ReceiptRequestVO> searchData = service.getReceiptList(dateRange);
	    log.info(searchData);
	    return ResponseEntity.ok(searchData); // 검색 결과를 JSON 형식으로 반환
	}

	@GetMapping("/accountList")
	@ResponseBody
	public List<AccountVO> getAccountList() {
		return service.getAccountList();
	}
}
