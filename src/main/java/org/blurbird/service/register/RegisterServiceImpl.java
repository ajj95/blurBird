package org.blurbird.service.register;

import java.util.List;

import org.blurbird.domain.common.MemberVO;
import org.blurbird.mapper.ReceiptMapper;
import org.blurbird.mapper.RegisterMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class RegisterServiceImpl implements RegisterService {

	@Autowired
	private RegisterMapper mapper;
	
	@Override
	public List<MemberVO> getMemberList() {
		log.info("getMemberList...");
		return mapper.getMemberList();
	}

	@Override
	public void registerMember(MemberVO member) {
		log.info("regist Member...");
		mapper.registerMember(member);
	}

}
