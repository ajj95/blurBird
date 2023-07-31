package org.blurbird.controller;

import org.blurbird.domain.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/receipt")
@Controller
@Log4j
public class RequestController {
	
	
	@GetMapping("/receiptta")
	public void get() {
		log.info("TEST!!");
	}
	
	@GetMapping("/bankta")
	public void read() {
		log.info("test2");
	}
}
