package ssg.com.maeil.service;

import java.util.List;


import ssg.com.maeil.dto.CalendarDto;
import ssg.com.maeil.dto.CalendarParam;

public interface CalendarService {

	
	List<CalendarDto> callist(CalendarParam param);
	
	boolean calwrite(CalendarDto dto, String rdate);
			
	CalendarDto caldetail(int seq);
			
	List<CalendarDto> caldaylist(CalendarParam param);
	
	boolean calupdate(CalendarDto dto);
	
	boolean caldelete(CalendarParam param);
	
}
