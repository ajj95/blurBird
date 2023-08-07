package org.blurbird.mapper;

import java.util.List;

import org.blurbird.domain.common.MemberVO;

public interface RegisterMapper {
	public List<MemberVO> getMemberList();

	public void registerMember(MemberVO member);
}
