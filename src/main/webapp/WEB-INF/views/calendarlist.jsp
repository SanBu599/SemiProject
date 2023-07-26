<%@page import="ssg.com.maeil.dto.CalendarParam"%>
<%@page import="org.apache.ibatis.mapping.ResultMap"%>
<%@page import="org.mybatis.spring.SqlSessionTemplate"%>
<%@page import="ssg.com.maeil.dto.MemberDto"%>
<%@page import="util.CalendarUtil"%>
<%@page import="java.util.Calendar"%>
<%@page import="ssg.com.maeil.dto.CalendarDto"%>
<%@page import="java.util.List"%>
<%@page import="ssg.com.maeil.dao.CalendarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    
    	MemberDto login = (MemberDto)session.getAttribute("login");
    
    	List<CalendarDto> list = (List)request.getAttribute("callist");
    	    	
    	CalendarParam param = (CalendarParam)request.getAttribute("param");
    		
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Department Calendar</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<style type="text/css">
th{
  vertical-align : middle;
}

.sun{
	color: red;
}
.sat{
	color: blue;
}




</style>

</head>
<body>

<h1>부서일정</h1>
<br>

<%=login.getEmployee_id() %>님
<br>
<br>
<a href = "leavelist.do">휴가관리</a>
<br>

<%
	Calendar cal = Calendar.getInstance();	// util
	cal.set(Calendar.DATE, 1);	// 현재 월의 1일로 맞춰준다.

	String syear = request.getParameter("year");
	String smonth = request.getParameter("month");
	
	// 현재 연도를 구한다. -> 처음 이 페이지가 실행시에 적용
	int year = cal.get(Calendar.YEAR);
	if(CalendarUtil.nvl(syear) == false) {	// 넘어온 파라미터(syear) 값이 있다.
		year = Integer.parseInt(syear);
	}
	
	int month = cal.get(Calendar.MONTH)+1;	// 0 ~ 11까지이므로 + 1
	if(CalendarUtil.nvl(smonth) == false) {
		month = Integer.parseInt(smonth);
	}
	
	if(month < 1) {
		month = 12;
		year--;
	}
	
	if(month > 12) {
		month = 1;
		year++;
	}
	
	cal.set(year, month-1, 1);
	
	// 요일
	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
	
	// <<	year--
	String pp = String.format("<a href='calendarlist.do?year=%d&month=%d' style='text-decoration: none'>"
								+ "<img src='./images/left.png' width='20px' height='20px' >"
								+ "</a>", year-1, month);
	
	// <	month--
	String p = String.format("<a href='calendarlist.do?year=%d&month=%d' style='text-decoration: none'>"
								+ "<img src='./images/prec.png' width='20px' height='20px' >"
								+ "</a>", year, month-1);
	
	// >	month++
	String n = String.format("<a href='calendarlist.do?year=%d&month=%d' style='text-decoration: none'>"
								+ "<img src='./images/next.png' width='20px' height='20px' >"
								+ "</a>", year, month+1);
	
	// >>	year++
	String nn = String.format("<a href='calendarlist.do?year=%d&month=%d' style='text-decoration: none'>"
								+ "<img src='./images/last.png' width='20px' height='20px' >"
								+ "</a>", year+1, month);	
	
	
	 
	
	
		
	//String yyyyMM = ("" + year) + CalendarUtil.two("" + month);	
	
	System.out.println("param~~~ >>>>>>>>" + param);	
	
	
	
	     	
	
	
	%>





<div align="center">
	<table border="1">
	<col width="120"><col width="120"><col width="120"><col width="120">
	<col width="120"><col width="120"><col width="120">
	
	<tr height="80">
		<td colspan="7" align="center">
			<%=pp %>&nbsp;<%=p %>&nbsp;&nbsp;&nbsp;&nbsp;
			
			<font style="color: #3c3c3c; font-size: 40px; font-family: fantasy">
				<%=String.format("%d년&nbsp;&nbsp;%2d월", year, month) %>
			</font>
			
			&nbsp;&nbsp;&nbsp;&nbsp;<%=n %>&nbsp;<%=nn %>
		</td>
	</tr>	
	<tr height="30" align="center" style="background-color: rgb(52, 58, 64); color: white;">
		<th class="sun">SUN</th>
		<th>MON</th>
		<th>TUS</th>
		<th>WED</th>
		<th>THU</th>
		<th>FRI</th>
		<th class="sat">SAT</th>
		</tr>

	<tr height="100" align="left" valign="top">
	<%
	// 윗쪽 빈칸
	for(int i = 1; i < dayOfWeek; i++){
	%>	
		<td style="background-color: #eeeeee">&nbsp;</td>
	<%
	}
	
	
	
	// 날짜
	int lastday = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	for(int i = 1; i <= lastday; i++) {
		%>
		<td style="color: #3c3c3c; padding-top: 5px">
			<%=CalendarUtil.daylist(year, month, i) %>&nbsp;&nbsp;<%=CalendarUtil.calwrite(year, month, i) %>
			<%=CalendarUtil.makeTable(year, month, i, list) %>			
		</td>
		<%
		if((i + dayOfWeek - 1)%7 == 0 && i != lastday){
			%>
			</tr><tr height="100" align="left" valign="top">
			<%
		}
	}
	
	// 아랫쪽 빈칸
	cal.set(Calendar.DATE, lastday);
	int weekday = cal.get(Calendar.DAY_OF_WEEK);
	for(int i = 0; i < 7 - weekday; i++) {	
			%>
			<td style="background-color: #eeeeee">&nbsp;</td>
			<%
			}
	%>
	</tr>
	
	</table>
	
	</div>
	
</body>
</html>
	
	
	
	
	
	
	