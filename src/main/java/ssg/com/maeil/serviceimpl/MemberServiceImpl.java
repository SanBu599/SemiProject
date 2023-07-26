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
	public boolean changeInfo(MemberDto dto) {
		int result = dao.changeInfo(dto);
		if(result > 0) {
			return true;
		} 
		return false;
	}

	@Override
	public boolean changepwdAf(MemberDto dto) {
	
//		System.out.println("서비스 트루 펄스?" + dao.changepwdAf(dto));
		
		int result = dao.changepwdAf(dto);
		if(result > 0) {
			return true;
		} 
		return false;		
	}
	
	
}
