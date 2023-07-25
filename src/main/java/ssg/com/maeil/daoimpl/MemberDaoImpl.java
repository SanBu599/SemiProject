package ssg.com.maeil.daoimpl;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssg.com.maeil.dao.MemberDao;
import ssg.com.maeil.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSessionTemplate session;
	
	String ns = "Member.";
	
	@Override
	public MemberDto login(MemberDto dto) {
		return session.selectOne(ns + "login", dto);
	}

	@Override
	public int newemployee(MemberDto dto) {
		return session.insert("newemployee", dto);
	}
	
	
	
}
