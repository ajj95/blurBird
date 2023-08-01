package org.blurbird.controller;

import org.blurbird.domain.docrequest.DocumentRequestVO;
import org.blurbird.service.docrequest.DocrequestService;
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
@RequestMapping("/docrequest/*")
@AllArgsConstructor
public class DocrequestController {
	
	private DocrequestService service;

	@GetMapping("/docrequestCO")
	public void docrequestCO(Model model) {
		log.info("docrequestCO");
		log.info(service.getDocrequestList());
		model.addAttribute("list", service.getDocrequestList());
	}
	
	@PostMapping("/create")
	public String create(DocumentRequestVO documentRequest) {
		log.info("create");
	    if (documentRequest == null) {
	        log.error("documentRequest is null");
	        // 오류 처리 로직 또는 리다이렉트 등을 수행합니다.
	    } else {
	        log.info(documentRequest);
	        // 여기서 폼 데이터를 활용하여 처리하면 됩니다.
	    }
		return "redirect:/docrequest/docrequestCO";
	}
	
	@GetMapping("/docrequestTA")
	public void docrequestTA() {
		log.info("docrequestTA");
	}
	
	
	
}
