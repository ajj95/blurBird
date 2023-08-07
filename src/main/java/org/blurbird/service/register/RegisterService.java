package org.blurbird.service.register;

import java.util.List;

import org.blurbird.domain.common.MemberVO;

public interface RegisterService {
	public List<MemberVO> getMemberList();

	public void registerMember(MemberVO member);
}
