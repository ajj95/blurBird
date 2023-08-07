package org.blurbird.controller;

import org.blurbird.domain.common.MemberVO;
import org.blurbird.service.receipt.ReceiptService;
import org.blurbird.service.register.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@RequestMapping("/register")
@Controller
@Log4j
public class RegisterController {
	private RegisterService service;

	@Autowired
	public RegisterController(RegisterService service) {
		this.service = service;
	}
	
	@GetMapping("/register")
	public void read() {
		log.info("register!!");
	}

	@PostMapping(path ="/registMember",produces = "application/json")
	@ResponseBody
	public void register(@RequestBody MemberVO member) {
		log.info("registMember.....");
		log.info("member : "+member);
		service.registerMember(member);
	}
}
