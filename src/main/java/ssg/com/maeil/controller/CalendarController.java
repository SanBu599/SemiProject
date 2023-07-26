package ssg.com.maeil.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ssg.com.maeil.dto.CalendarDto;
import ssg.com.maeil.dto.CalendarParam;
import ssg.com.maeil.dto.MemberDto;
import ssg.com.maeil.service.CalendarService;

import util.CalendarUtil;

@Controller
public class CalendarController {

	@Autowired
	CalendarService service;
		
	@RequestMapping(value="calendarlist.do", method = { RequestMethod.GET, RequestMethod.POST })	
	public String calendarlist(CalendarParam param, Model model, HttpSession session) {
		System.out.println("CalendarController calendarlist()" + new Date());		
		/*
		 * MemberDto memberDto = (MemberDto) session.getAttribute("login");
		 * param.setEmployee_id(memberDto.getEmployee_id());
		 * param.setDepartment_id(memberDto.getDepartment_id());
		 * 
		 * int auth = memberDto.getAuth(); param.setAuth(auth);
		 * 
		 * System.out.println("첫 확인>>>>" + auth);
		 * 
		 * List<CalendarDto> list = service.callist(param);
		 * 
		 * 
		 * model.addAttribute("callist", list);
		 * 
		 * for (CalendarDto calendarDto : list) {
		 * System.out.println(calendarDto.toString()); }
		 */
		

		MemberDto memberDto = (MemberDto) session.getAttribute("login");
		param.setEmployee_id(memberDto.getEmployee_id());
		param.setDepartment_id(memberDto.getDepartment_id());		
		
		int auth = memberDto.getAuth();
		param.setAuth(auth);
		System.out.println("auth값 확인>>>>>>>>>" + auth);
		
		/*
		 * String rdate = param.getRdate(); System.out.println("param값 확인>>>>>>>>>" +
		 * rdate);
		 */
		String yyyyMM = "";
			if(param.getRdate() != null && !param.getRdate().equals("")) {
				yyyyMM = param.getRdate().substring(0, 4) + param.getRdate().substring(4, 6);
			}
				
		
		
		Calendar cal = Calendar.getInstance();
		if(yyyyMM == null || yyyyMM.trim().equals("")) {
			yyyyMM = cal.get(Calendar.YEAR) + CalendarUtil.two((cal.get(Calendar.MONTH)+1) + "");
			
		}
		
		param.setYyyyMM(yyyyMM);
		
		System.out.println("yyyyMM값 확인>>>>>>>>>" + yyyyMM);
		
		System.out.println("Controller param>>>>>" + param.toString());
		
		List<CalendarDto> list = service.callist(param);
		
		model.addAttribute("callist", list);
				
		for (CalendarDto calendarDto : list) {
			System.out.println(calendarDto.toString());
		}
		
		
		
		return "calendarlist";
	}
			
	@RequestMapping(value="calwrite.do", method = { RequestMethod.GET, RequestMethod.POST })	
	public String calwrite() {
		System.out.println("CalendarController calwrite()" + new Date());
		
		return "calwrite";
	}
	
	@RequestMapping(value="calwriteAf.do", method = { RequestMethod.GET, RequestMethod.POST })	
	public String calwriteAf(CalendarDto dto, Model model, HttpServletRequest request) {
		System.out.println("CalendarController calwriteAf()" + new Date());

		String employee_id = request.getParameter("employee_id");
    	String title = request.getParameter("title");
    	String content = request.getParameter("content");
    	    	
    	System.out.println("Controller employee_id = " + employee_id);
    	System.out.println("Controller title = " + title);
    	System.out.println("Controller content = " + content);
    	
    	String date = request.getParameter("date");
    	String time = request.getParameter("time");
    	
    	date = date.replace("-", "");
    	time = time.replace(":", "");
    	
    	System.out.println("Controller date = " + date);
    	System.out.println("Controller time = " + time);
    	
    	String rdate = date + time;
    	model.addAttribute("calwrite", rdate);
        dto.setRdate(rdate);
           	
		boolean isS = service.calwrite(dto, rdate);	
				
		String calwrite = "CAL_WRITE_OK";
		if(isS == false) {
			calwrite = "CAL_WRITE_NO";
			System.out.println("Controller = " + calwrite);
		}
		
		model.addAttribute("calwrite", calwrite);
		
		return "message";
	}
		
	/*
	 * @RequestMapping(value="getcalendarlist.do", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public String getCalendarList(CalendarParam param,
	 * Model model, HttpSession session) {
	 * System.out.println("CalendarController getcalendarlist()" + new Date());
	 * 
	 * MemberDto memberDto = (MemberDto) session.getAttribute("login");
	 * param.setEmployee_id(memberDto.getEmployee_id());
	 * param.setDepartment_id(memberDto.getDepartment_id());
	 * 
	 * int auth = memberDto.getAuth(); param.setAuth(auth);
	 * System.out.println("param값 확인>>>>>>>>>" + auth);
	 * 
	 * String rdate = param.getRdate(); System.out.println("param값 확인>>>>>>>>>" +
	 * rdate);
	 * 
	 * String yyyyMMdd = rdate.substring(0, 4) + rdate.substring(4, 6) +
	 * rdate.substring(6, 8); System.out.println("param값 확인>>>>>>>>>" + yyyyMMdd);
	 * 
	 * Calendar cal = Calendar.getInstance(); if(yyyyMMdd == null ||
	 * yyyyMMdd.trim().equals("")) { yyyyMMdd = cal.get(Calendar.YEAR) +
	 * CalendarUtil.two(cal.get(Calendar.MONTH) + "") +
	 * CalendarUtil.two(cal.get(Calendar.DATE) + "");
	 * 
	 * }
	 * 
	 * param.setYyyyMMdd(yyyyMMdd);
	 * 
	 * System.out.println("Controller param>>>>>" + param.toString());
	 * 
	 * List<CalendarDto> list = service.callist(param);
	 * 
	 * model.addAttribute("getlist", list);
	 * 
	 * for (CalendarDto calendarDto : list) {
	 * System.out.println(calendarDto.toString()); }
	 * 
	 * return "calendarlist"; }
	 */
	
	@RequestMapping(value="caldetail.do", method = { RequestMethod.GET, RequestMethod.POST })	
	public String caldetail(int seq, Model model) {
		System.out.println("CalendarController caldetail()" + new Date());
		
		CalendarDto dto = service.caldetail(seq);
		model.addAttribute("caldto", dto);
		
		return "caldetail";
	}

	
	
	@RequestMapping(value="caldaylist.do", method = { RequestMethod.GET, RequestMethod.POST })	
	public String getDayList(Model model, HttpServletRequest request, HttpSession session, CalendarParam param, CalendarDto dto) {
		System.out.println("CalendarController caldaylist()" + new Date());			
		
		List<CalendarDto> list = service.caldaylist(param);
		
		model.addAttribute("caldaylist", list);		
		
			
		System.out.println("list는 이것 >>>>>>>>" + list.toString());	
		
		
		MemberDto memberDto = (MemberDto) session.getAttribute("login");
		param.setEmployee_id(memberDto.getEmployee_id());
		param.setDepartment_id(memberDto.getDepartment_id());	
		
		int auth = memberDto.getAuth();
		param.setAuth(auth);
		
		System.out.println("caldaylist auth >>>>" + auth);
		
		int share = dto.getShare();
		param.setShare(share);
		
		System.out.println("caldaylist share >>>>" + share);
		
		String rdate = dto.getRdate();
		param.setRdate(rdate);
		
		System.out.println("caldaylist rdate >>>>" + rdate);
				
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		
		String yyyyMMdd = year + CalendarUtil.two(month) + CalendarUtil.two(day);			
		System.out.println("yyyyMMdd는 이것 >>>>>>>>" + yyyyMMdd);		
		param.setYyyyMMdd(yyyyMMdd);
		model.addAttribute("param", param);
		System.out.println("param는 이것 >>>>>>>>" + param);
		
		
		return "caldaylist";
	}
	
	
	@RequestMapping(value="calupdate.do", method = { RequestMethod.GET,	RequestMethod.POST })
	public String calupdate(int seq, Model model) {
	 System.out.println("CalendarController calupdate()" + new Date());
	 	CalendarDto dto = service.caldetail(seq);
	 	model.addAttribute("caldto", dto);
	  return "calupdate";
	  }
	 
	
	@RequestMapping(value="calupdateAf.do", method = { RequestMethod.GET, RequestMethod.POST })	
	public String calupdateAf(CalendarDto dto, Model model, HttpSession session, HttpServletRequest request) {
		System.out.println("CalendarController calupdate()" + new Date());
		
		MemberDto memberDto = (MemberDto) session.getAttribute("login");
		
		int employee_id = memberDto.getEmployee_id();
		model.addAttribute("calupdate", employee_id);		
		dto.setEmployee_id(employee_id);
		
		System.out.println("Controller calupdate >>>>>>>>>> " + dto.toString());		
						
		String title = request.getParameter("title");
    	String content = request.getParameter("content");  
    	
    	Calendar cal = Calendar.getInstance();
    	
    	int calyear = cal.get(Calendar.YEAR);
    	int calmonth = cal.get(Calendar.MONTH)+1;
    	String caldate = "" + cal.get(Calendar.DATE);
    	String calhour = "" + cal.get(Calendar.HOUR);
    	String calminute = "" + cal.get(Calendar.MINUTE);
		    	            	
    	if(calmonth < 2) {
    		calmonth = 12;
    		calyear--;
    	} else if (calmonth > 12) {
    		calmonth = 1;
    		calyear++;
    	}
    	
    	String smonth = "" + calmonth;
    	
    	String wdate = (calyear + "") + CalendarUtil.two(smonth) + CalendarUtil.two(caldate) + CalendarUtil.two(calhour) + CalendarUtil.two(calminute);
    	   	
    	
    	String date = request.getParameter("date");
    	String time = request.getParameter("time");
    	
    	System.out.println("Controller calupdate >>>>>>>>>> " + date);
    	System.out.println("Controller calupdate >>>>>>>>>> " + time);
    	System.out.println("Controller calupdate >>>>>>>>>> " + wdate);
    	
    	String datesplit[] = date.split("-");
    	String timesplit[] = time.split(":");
    	
    	String rdate = datesplit[0] + datesplit[1] + datesplit[2] + timesplit[0] + timesplit[1];
    	
    	int share = Integer.parseInt(request.getParameter("share"));
    			
    	model.addAttribute("calupdate", title);
    	model.addAttribute("calupdate", content);
    	model.addAttribute("calupdate", rdate);
    	model.addAttribute("calupdate", share);
    	model.addAttribute("calupdate", wdate);
    	
    	dto.setTitle(title);
        dto.setContent(content);
        dto.setRdate(rdate);
        dto.setShare(share);
        dto.setWdate(wdate);
                
        
		boolean isS = service.calupdate(dto);
				
		String calupdate = "CAL_UPDATE_OK";
		if(isS == false) {
			calupdate = "CAL_UPDATE_NO";
			System.out.println("Controller = " + calupdate);
		}
		
		model.addAttribute("calupdate", calupdate);
		
		return "message";
	}
		
	@RequestMapping(value="caldelete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String caldelete(int seq, Model model, CalendarParam param) {
			   	
			boolean isS = service.caldelete(param);	
					
			String caldelete = "CAL_DELETE_OK";
			if(isS == false) {
				caldelete = "CAL_DELETE_NO";
				System.out.println("Controller = " + caldelete);
			}
			
			model.addAttribute("caldelete", caldelete);
			
			return "message";
	}
	
	
}
