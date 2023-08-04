package org.blurbird.controller;

import java.io.File;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.blurbird.domain.receipt.AccountVO;
import org.blurbird.domain.receipt.CashSlipVO;
import org.blurbird.domain.receipt.ConfirmedVO;
import org.blurbird.domain.receipt.DateRange;
import org.blurbird.domain.receipt.ReceiptRequestVO;
import org.blurbird.domain.receipt.UnconfirmedReasonVO;
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
import org.springframework.web.multipart.MultipartFile;

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

	@GetMapping("/receiptco")
	public void receiptco() {
		log.info("receiptco!!");
	}

	@GetMapping("/Test")
	public void test() {
		log.info("DatePicker Test!!!");
	}

	@GetMapping("/receiptList")
	@ResponseBody
	public List<ReceiptRequestVO> getReceiptList(DateRange dateRange) {
		return service.getReceiptList(dateRange);
	}


	
	@GetMapping("/dateSearch")
	@ResponseBody // JSON 데이터를 반환하는 엔드포인트로 지정
	public ResponseEntity<List<ReceiptRequestVO>> searchData(@RequestParam("startDate") String startDateStr,
			@RequestParam("endDate") String endDateStr) {
		LocalDate startDate = LocalDate.parse(startDateStr);
		LocalDate endDate = LocalDate.parse(endDateStr);
		DateRange dateRange = new DateRange(startDate, endDate);
		List<ReceiptRequestVO> searchData = service.getReceiptList(dateRange);
		log.info("searchData : "+ searchData);
		return ResponseEntity.ok(searchData); // 검색 결과를 JSON 형식으로 반환
	}

	@GetMapping("/accountList")
	@ResponseBody
	public List<AccountVO> getAccountList() {
		return service.getAccountList();
	}

	@PostMapping("/imgSearch")
	@ResponseBody
	public String getImgPath(@RequestParam("recreqno") String recreqno) {
		log.info("recreqno : "+recreqno);
		String ImgPath = service.getImgPath(recreqno);
		log.info("ImgPath : "+ImgPath);
		return ImgPath;
	}
	
	@PostMapping("/judgeReceipt")
	@ResponseBody
	public ReceiptRequestVO judgeReceipt(@RequestParam("recreqno") String recreqno,
			@RequestParam("judge") String judge,
			@RequestParam("contents") String contents) {
		log.info("recreqno : "+recreqno);
		log.info("judge : "+ judge);
		ReceiptRequestVO receipt = service.judgeReceipt(recreqno);
		receipt.setConfirmed(judge);
		if(judge.equals("1")) {
			ConfirmedVO confirmed = new ConfirmedVO();
			confirmed.setRecreqno(recreqno);
			log.info("confirmed : "+ confirmed);
			service.confirmedReceipt(confirmed);
		}else if(judge.equals("2")){
			UnconfirmedReasonVO unconfirmed = new UnconfirmedReasonVO();
			unconfirmed.setRecreqno(recreqno);
			unconfirmed.setContents(contents);
			log.info("unconfirmed : "+unconfirmed);
			service.unconfirmedReceipt(unconfirmed);
		}
		log.info(receipt);
		return receipt;
	}
	
	@PostMapping("/cashslipConfirmed")
	@ResponseBody
	public CashSlipVO cashslipConfirmed(@RequestParam("confirmedno") String confirmedno,
			@RequestParam("accountno")String accountno, @RequestParam("summary") String summary) {
		log.info("cashslipConfirmed....");
		CashSlipVO cashslip = new CashSlipVO();
		cashslip.setConfirmedno(confirmedno);
		cashslip.setAccountno(accountno);
		cashslip.setSummary(summary);
		service.cashslipConfirmed(cashslip);
		log.info(cashslip);
		
		return cashslip;
	}
	
	@PostMapping("/uploadReceipt")
	@ResponseBody
	public String uploadReciept(MultipartFile[] uploadFile ,
			@RequestParam("purpose") String purpose) {
		log.info("upload receipt...");
		String uploadFolder = "C:\\DouZone\\workspace\\spring_work\\project\\blurBird\\src\\main\\webapp\\resources\\upload";
		//업로드 경로
		
		for (MultipartFile multipartFile : uploadFile) {
			log.info("----------------------------");
			log.info(multipartFile.getOriginalFilename());
			log.info(multipartFile.getSize());
			String uploadFileName = multipartFile.getOriginalFilename();
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
		String imgPath = ("\""+uploadFile[0].getOriginalFilename()+"\"");
		// 파일 올리기
		ReceiptRequestVO receipt = new ReceiptRequestVO();
		receipt.setPurpose(purpose);
		receipt.setReceiptpath(imgPath);
		service.uploadReceipt(receipt);
		 return imgPath;
	}
}
