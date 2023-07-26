package ssg.com.maeil.dao;

import ssg.com.maeil.dto.MemberDto;

public interface MemberDao {

	MemberDto login(MemberDto dto);
	
	int changeInfo(MemberDto dto);
	
	int changepwdAf(MemberDto dto);
}
