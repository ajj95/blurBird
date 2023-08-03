package org.blurbird.domain.bank;

import lombok.Data;

@Data
public class BhMessageVO {
	private String messageno;
	private String bhno;
	private String message;
	private String bhmdate;
	private String receiver;
	private String sender;
	private String receivername;
	private String sendername;
	private String checked;     //1: 미확인 2:확인
}
