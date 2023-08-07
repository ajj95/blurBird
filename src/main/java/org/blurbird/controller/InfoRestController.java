package org.blurbird.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.blurbird.domain.info.IncomeSVO;
import org.blurbird.domain.info.InfoMainVO;
import org.blurbird.domain.info.ReportPaymentVO;
import org.blurbird.service.info.InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/info")
@AllArgsConstructor
public class InfoRestController {

	@Autowired
	private InfoService service;

	@GetMapping("/getReportStatusCount")
	public ResponseEntity<Map<String, Integer>> getHistoryAndSlip() {
		Map<String, Integer> response = new HashMap<>();
		int count = service.getStatusCount();
		int total = service.getTotalCount();

		response.put("statuscount", count);
		response.put("totalcount", total);

		return ResponseEntity.ok(response);
	}

	@GetMapping("/getIS")
	public ResponseEntity<List<IncomeSVO>> infoIS(InfoMainVO main) {

//		   main.setYear("2023");
		List<IncomeSVO> islist = new ArrayList<IncomeSVO>();

		main.setBizno("10001");
		String year = "2021";
		int yr = Integer.parseInt(year);
		for (int i = 0; i < 3; i++) {
			year = Integer.toString(yr++);
			main.setYear(year);
			islist.add(service.getISByBiz(main));
		}

//		   main.setBizno(rp.getBizno());
//		   main.setYear(rp.getYear());

//		log.info("@@@@@@@@@@@@@@@@@@@@@main : " + main);

		return ResponseEntity.ok(islist);
	}
	
	
	@GetMapping("/getISdetail")
	public ResponseEntity<IncomeSVO> infoISdetail(InfoMainVO main) {

		main.setBizno("10001");
//		   main.setYear("2023");
		   

//		   main.setBizno(rp.getBizno());
//		   main.setYear(rp.getYear());

//		log.info("@@@@@@@@@@@@@@@@@@@@@main : " + main);

		return ResponseEntity.ok(service.getISByBiz(main));
	}
}
