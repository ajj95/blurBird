package org.blurbird.controller;

import org.blurbird.service.docrequest.DocrequestService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/main/*")
@AllArgsConstructor
public class MainController {

	@GetMapping("/mainCO")
	public void mainCO(Model model) {
		log.info("mainCO");
	}
	
	@GetMapping("/mainTA")
	public void mainTA(Model model) {
		log.info("mainTA");
	}
	
	@GetMapping("/beforeloginmainco")
	public void beforeloginmainco() {
	}
	
	@GetMapping("/beforeloginmainta")
	public void beforeloginmainta() {
	}
	
	@GetMapping("/talogin")
	public void talogin() {
	}
	
	@GetMapping("/cologin")
	public void cologin() {
	}
	
}
