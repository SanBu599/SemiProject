package ssg.com.maeil.service;

import ssg.com.maeil.dto.MemberDto;

public interface MemberService {

	MemberDto login(MemberDto dto);
	
	boolean changeInfo(MemberDto dto);
	
	boolean changepwdAf(MemberDto dto);
}
