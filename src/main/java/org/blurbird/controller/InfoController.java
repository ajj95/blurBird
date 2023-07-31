package org.blurbird.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/info")
@AllArgsConstructor
public class InfoController {

	@GetMapping("/infoTA")
	public void getInfoTA() {
		
	}
	
	@GetMapping("/infoCO")
	public void getInfoCO() {
		
	}
	
}
