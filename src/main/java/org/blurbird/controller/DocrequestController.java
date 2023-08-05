package org.blurbird.controller;

import javax.servlet.http.HttpServletRequest;

import org.blurbird.domain.docrequest.DocumentRequestVO;
import org.blurbird.service.docrequest.DocrequestService;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@GetMapping("/docrequestTA")
	public void docrequestTA(Model model) {
		log.info("docrequestTA");
		log.info(service.getDocrequestList());
		model.addAttribute("list", service.getDocrequestList());
	}
	
	@PostMapping("/create")
	public String create(DocumentRequestVO documentRequest) {
	  log.info("create");
	  log.info(documentRequest);
	  service.createdoc(documentRequest);
	  service.createstate();
	  return "redirect:/docrequest/docrequestCO";
	}
	
	@PostMapping("/issuance")
	public String issuance(@RequestParam("docreqno") String docreqno) {
		log.info("issuance");
		log.info(docreqno);
		service.issuance(docreqno);
		service.issuancedel(docreqno);
		
		return "redirect:/docrequest/docrequestTA";
	}
	
	
	@PostMapping("/received")
	public String received(@RequestParam("docreqno") String docreqno) {
		log.info("received");
		log.info(docreqno);
		service.received(docreqno);
		service.receiveddel(docreqno);
	
		return "redirect:/docrequest/docrequestCO";
	}
	
	@PostMapping("/modal")
	@ResponseBody
    public DocumentRequestVO handleAjaxRequest(@RequestParam("docreqno") String docreqno) {
		
		log.info(service.getDocrequestread(docreqno));
		
        return service.getDocrequestread(docreqno);
    }
	
}
