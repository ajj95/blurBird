package org.blurbird.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.blurbird.domain.common.BusinessVO;
import org.blurbird.domain.info.InfoMainVO;
import org.blurbird.domain.info.ReportPaymentVO;
import org.blurbird.service.info.InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/info")
@AllArgsConstructor
public class InfoController {
	
	@Autowired
	private InfoService service;
	
	@GetMapping("/infoTA")
	public void getInfoTA(Model model) {
//		log.info("�� ��:" + model);
		model.addAttribute("listCO", service.getListBusiness());
//		log.info("�� ��: " + model);
	};
	
	
	
	
	
	@PostMapping("/infoTA")
	public @ResponseBody List<InfoMainVO> getInfoList(InfoMainVO infoMainVO) {
	
		log.info("bizno: " + infoMainVO.getBizno());
		log.info("year: " + infoMainVO.getYear());
		
		log.info(service.getList(infoMainVO));
//		log.info("VO: " + infoMainVO);
//		log.info("��:" + model);
//		log.info("list: " + service.getList(infoMainVO)); // ��ȸ��ư ������ ��ȣ�� ���ڤӰ� ���´�..
		return  service.getList(infoMainVO);
	}
	
	@PostMapping("/infoTA/report")
	public @ResponseBody ReportPaymentVO report(ReportPaymentVO reportPaymentVO) {
		
//		Date date = new Date();
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//        String dateString = sdf.format(date);
//		
//		reportPaymentVO.setReportdate(dateString);
		reportPaymentVO.setReportdoc("�Ű��̹���");
		reportPaymentVO.setPaymentslip("���μ��̹���");
//		reportPaymentVO.setTransdate("");
		reportPaymentVO.setStatus("���μ�����");
		
		service.report(reportPaymentVO);
//		log.info(service.rptfResult(reportPaymentVO));
		return service.rptfResult(reportPaymentVO);
	}
	
	@PostMapping("/infoTA/transfer")
	public @ResponseBody ReportPaymentVO transfer(ReportPaymentVO reportPaymentVO) {
		
		reportPaymentVO.setStatus("���ۿϷ�");
		
		service.transfer(reportPaymentVO);
		return service.rptfResult(reportPaymentVO);
	}
	
	@GetMapping("/infoCO")
	public void getInfoCO() {
		
	}
	
}
