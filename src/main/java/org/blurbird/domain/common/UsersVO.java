package org.blurbird.domain.common;

import java.util.Date;

import org.blurbird.domain.docrequest.DocumentRequestVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UsersVO {
	
	private String userno;
	private String memberno;
	private String bizno;
	private String authno;

}
