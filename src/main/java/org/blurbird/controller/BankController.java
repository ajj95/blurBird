package org.blurbird.controller;

import org.blurbird.domain.bank.BankSearchDTO;
import org.blurbird.service.bank.BankService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/bank/*")
@AllArgsConstructor
public class BankController {

	private BankService service;
	
	// 세무사 통장관리 메뉴 이동
	@GetMapping("/bankta")
	public void bankta() {
	}
	
	
	@PostMapping("/bankta")
	public void searchbank(Model model, BankSearchDTO search) {
		model.addAttribute("bankhistorylist", service.getBankHistoryList(search));
		//rttr.addAttribute("bankhistorylist", service.getBankHistoryList(search));
	}

	
}
