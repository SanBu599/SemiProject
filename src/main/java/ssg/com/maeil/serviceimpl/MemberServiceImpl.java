package ssg.com.maeil.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssg.com.maeil.dao.MemberDao;
import ssg.com.maeil.dto.MemberDto;
import ssg.com.maeil.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDao dao;

	@Override
	public MemberDto login(MemberDto dto) {
		return dao.login(dto);
	}

	@Override
	public boolean newemployee(MemberDto dto) {
		return dao.newemployee(dto)>0?true:false;
	}
	
	
}
