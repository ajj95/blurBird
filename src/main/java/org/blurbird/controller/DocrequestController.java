package org.blurbird.controller;

import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/docrequest/*")
@AllArgsConstructor
public class DocrequestController {

	@GetMapping("/docrequestCO")
	public void docrequestCO() {
		log.info("docrequestCO");
	}
	
	@GetMapping("/docrequestTA")
	public void docrequestTA() {
		log.info("docrequestTA");
	}
	
	
}
