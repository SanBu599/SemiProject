package util;


import java.util.List;


import javax.servlet.http.HttpSession;

import ssg.com.maeil.dto.LeaveDto;
import ssg.com.maeil.dto.MemberDto;

public class LeaveUtil {

	public static String leavelist(HttpSession session, List<LeaveDto> list) {
		String str = "";
		
		MemberDto memberDto = (MemberDto) session.getAttribute("login");
		
		 
		for(LeaveDto dto: list) {
			if(dto.getEmployee_id() == memberDto.getEmployee_id()) {
				str += "<tr>";
				str += "<td>";
				str += dto.getSeq();				
				str += "</td>";
				str += "<td>";
				str += 	dto.getLeave_start();
				str += "</td>";
				str += "<td>";
				str +=	dto.getLeave_end();
				str += "</td>";
				str += "<td>";
				str +=	dto.getLeave_type();
				str += "</td>";
				str += "<td>";
				str +=	dto.getLeave_period();
				str += "</td>";
				str += "<td><input type='checkbox' id='chkbox' name='checkbox'>";
				str +=	dto.getStatus();				
				str += "</td>";
				
			}			
		}		
		str += "</tr>";
		
		return str;		
		
	}
	
	/*
	public static String leave_period(List<LeaveDto> list) {
									
	// 휴가 기간 구하기
	String start = document.getElementById("leave_start").value;
	String end = document.getElementById("leave_end").value;
		
	String leave_start = start.replace("-", "/");
	String leave_end = end.replace("-", "/");
   
    Date format1 = new SimpleDateFormat("yyyy/MM/dd").parse(start);
    Date format2 = new SimpleDateFormat("yyyy/MM/dd").parse(end);
    
    long diffSec = (format1.getTime() - format2.getTime()) / 1000; //초 차이
    long diffMin = (format1.getTime() - format2.getTime()) / 60000; //분 차이
    long diffHor = (format1.getTime() - format2.getTime()) / 3600000; //시 차이
    long diffDays = diffSec / (24*60*60); //일자수 차이
    
    System.out.println(diffSec + "초 차이");
    System.out.println(diffMin + "분 차이");
    System.out.println(diffHor + "시 차이");
    System.out.println(diffDays + "일 차이");
	*/
		/* var lp = 
		
		String lp2 = "" + lp;
		
		$('input [name=leave_period]').attr('value',lp2); */	
		
		
		
		
		
		
		/*
		
		String str = "";
	
		// 휴가 기간 구하기
		String start = request.getParameter("leave_start");
		String end = request.getParameter("leave_end");
	 	
		String leave_start = start.replace("-", "");
		String leave_end = end.replace("-", "");
		
		
		// 시작일, 종료일 문자열 자르기
		String start_year = leave_start.substring(0, 4);	
		String start_month = leave_start.substring(4, 6);
		String start_date = leave_start.substring(6, 8);
		String end_month = leave_end.substring(4, 6);
		String end_date = leave_end.substring(6, 8);
				 
 
		// 시작일, 종료일 문자열 >> 숫자 변환
		int syear = Integer.parseInt(start_year);		
		int smonth = Integer.parseInt(start_month);
		int sdate = Integer.parseInt(start_date);

		int emonth = Integer.parseInt(end_month);
		int edate = Integer.parseInt(end_date);

	
		// 기간 구하기
		int period = (edate - sdate) + 1;

		String type = request.getParameter("leave_type");
		
		if(type.equals("오전반차") || type.equals("오후반차")) {
			str = "0.5";			
		} else {
		if((emonth-smonth) != 0){	// 같은 월이 아닐 때
			if(smonth == 1 || smonth == 3 || smonth == 5 || smonth == 7 || smonth == 8 || smonth == 10 || smonth == 12){
				period = (31-sdate) + edate + 1;
			} else if(smonth == 2) {	// 2월
				
				if(syear%4 == 0 && syear%100 != 0){
					period = (29-sdate) + edate + 1;
				} else if(syear%400 == 0){
					period = (29-sdate) + edate + 1;
				} else {
					period = (28-sdate) + edate + 1;
				}
				
			} else {	// 4, 6, 9, 11월
				period = (30-sdate) + edate + 1;
			}
		} else {	// 같은 월 일때
			period = (edate - sdate) + 1;
		}
		String lve_period = "" + period;

		str= lve_period;   
		}	
		 	
		return str;		
	}
	*/
		
	
	
}
