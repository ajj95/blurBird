package org.blurbird.domain.common;

import java.util.Date;
import java.util.List;

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
	
	// 로그인+로그인 후 사용 위한 정보 추가
	private String memberid;
	private String password;
	private String membername;
	private String bizname;
	private List<AuthVO> authList;
}
