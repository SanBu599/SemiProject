package ssg.com.maeil.dao;

import java.util.List;

import ssg.com.maeil.dto.CalendarDto;
import ssg.com.maeil.dto.CalendarParam;

public interface CalendarDao {

		
	List<CalendarDto> callist(CalendarParam param);	//
	
	int calwrite(CalendarDto dto, String rdate); //
		
	CalendarDto caldetail(int seq); //
	
	List<CalendarDto> caldaylist(CalendarParam param); //
	
	int calupdate(CalendarDto dto); //
	
	int caldelete(CalendarParam param); //

	
	
}
