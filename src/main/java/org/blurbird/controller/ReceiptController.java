package org.blurbird.controller;

import java.util.List;

import org.blurbird.domain.MemberVO;
import org.blurbird.domain.receipt.AccountVO;
import org.blurbird.service.receipt.ReceiptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    
    @GetMapping("/Test")
    public void test() {
    	log.info("doubleClick Test!!!");
    }
    
    @GetMapping("/receiptco")
    public String receiptco(Model model) {
        log.info("TEST!!");
        return "reciptta"; // Assuming you intended to return reciptta.jsp here
    }
    
    @GetMapping("/accountList")
    @ResponseBody
    public List<AccountVO> getAccountList() {
        return service.getList();
    }
}
