package org.blurbird.domain.docrequest;

import java.util.Date;

import org.blurbird.domain.MemberVO;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DocumentRequestVO {
	
	private String docreqno;
	private String userno;
	private Date applicationdate;
	private String purpose;
	private String status;
	private String count;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date wishdate;
	
	private String way;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date doctagetdate;
	
	private String doctype;
	
	private MemberVO member;
	private DrStateVO drstate;
}