package org.blurbird.controller;

import java.util.ArrayList;
import java.util.List;

import org.blurbird.domain.common.BusinessVO;
import org.blurbird.domain.info.InfoData;
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
		model.addAttribute("listCO", service.getListBusiness());
	};
	
	
	
	
	
	@PostMapping("/infoTA")
	public void getInfoList(Model model, InfoData infoData) {
	
		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + service.getList(infoData));
		
		model.addAttribute("list", service.getList(infoData));

	}
	
	@GetMapping("/infoCO")
	public void getInfoCO() {
		
	}
	
}
