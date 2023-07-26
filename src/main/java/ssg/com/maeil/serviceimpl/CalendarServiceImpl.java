package ssg.com.maeil.serviceimpl;


import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssg.com.maeil.dao.CalendarDao;
import ssg.com.maeil.dto.CalendarDto;
import ssg.com.maeil.dto.CalendarParam;
import ssg.com.maeil.service.CalendarService;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	CalendarDao dao;
		
	@Override
	public List<CalendarDto> callist(CalendarParam param) {
		System.out.println("CalendarServiceImpl callist()" + new Date());
		
		return dao.callist(param);		
		
		
	}
	
	@Override
	public boolean calwrite(CalendarDto dto, String rdate) {
		System.out.println("CalendarServiceImpl calwrite()" + new Date());
		
		System.out.println("ServiceImpl rdate = " + rdate);		
		System.out.println("ServiceImpl Dto = " + dto.toString());		
		return dao.calwrite(dto, rdate)>0?true:false;
	}

	@Override
	public CalendarDto caldetail(int seq) {
		System.out.println("CalendarServiceImpl caldetail()" + new Date());
		
		return dao.caldetail(seq);
	}


	@Override
	public List<CalendarDto> caldaylist(CalendarParam param) {
		System.out.println("CalendarServiceImpl getDayList()" + new Date());
				
		System.out.println("ServiceImpl = getDayList() = " + param);
		
		return dao.caldaylist(param);
	}


	@Override
	public boolean calupdate(CalendarDto dto) {
		System.out.println("CalendarServiceImpl calupdate()" + new Date());
		
		System.out.println("ServiceImpl calupdate = " + dto.toString());		
		
		return dao.calupdate(dto)>=1?true:false;
	}


	@Override
	public boolean caldelete(CalendarParam param) {
		System.out.println("CalendarServiceImpl caldelete()" + new Date());
		return dao.caldelete(param)>0?true:false;
	}
	
	
	
}
