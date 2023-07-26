<%@page import="java.util.ArrayList"%>
<%@page import="util.CalendarUtil"%>
<%@page import="java.util.Calendar"%>
<%@page import="util.LeaveUtil"%>
<%@page import="java.util.List"%>
<%@page import="ssg.com.maeil.dto.LeaveDto"%>
<%@page import="ssg.com.maeil.dto.MemberDto"%>
<%@page import= "java.text.ParseException"%>
<%@page import= "java.text.SimpleDateFormat"%>
<%@page import= "java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	MemberDto mem = (MemberDto)session.getAttribute("login");	
	
	List<LeaveDto> list = (List)request.getAttribute("leavelist");
	
	
		
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Leave List</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>


</head>
<body>

<h1>Leave List</h1>
<br/>
<a href = "calendarlist.do">부서일정</a>
<br/>
<br/>

<%=mem.getEmployee_id() %>님
<br/>
<br/>


<div align="center">				
		<button type="button" onclick="Lvedel()" id="delLve">삭제</button>&nbsp;&nbsp;	
		<button type="button" id="perBtn">계산</button>	
		<br/><br/>
	<form action="leaveaddAf.do" method="post">		
		<table border="1" id="table">		
		<col width="50"><col width="200"><col width="200"><col width="150"><col width="118"><col width="100">
			<thead>
				<tr>
					<th>No.</th>								
					<th>시작일</th>
					<th>종료일</th>
					<th>종류</th>								
					<th>기간(일)</th>							
					<th>상태</th>
				</tr>						
			</thead>
			<tbody id="tbody">														
				<tr>
					<td><input type="checkbox" id="chkbox" name="checkbox"></td>
					<td><input type="date" id="leave_start" name="leave_start" value=""></td>
 					<td><input type="date" id="leave_end" name="leave_end" value=""></td>
 					<td>
 						<select name="leave_type" >
 							<option>연차</option>
 							<option>오전반차</option>
 							<option>오후반차</option>
 							<option>공가</option>
 							<option>병가</option>
 						</select>
 					</td> 								
 					<td><input type="text" size="10" name="leave_period" value="" readonly="readonly"></td>
					<td><button type="submit" name="status" value="save">저장</button></td>
				</tr>
				<tr>		
					<%=LeaveUtil.leavelist(session, list) %>
				</tr>		
			</tbody>
		</table>		
	</form>	
</div>

<script type="text/javascript">
 
$("#perBtn").click(function leave_period(){  	
			
	// 휴가 기간 구하기
	String start = document.getElementById("leave_start").value;
	String end = document.getElementById("leave_end").value;
		
	String leave_start = start.replace("-", "/");
	String leave_end = end.replace("-", "/");
   
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

	String str = "";
	
	String type = document.getElementById("leave_type").value;
	
	if(type.equals("오전반차") || type.equals("오후반차")) {
		str = "0.5day";			
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
	
	var lp = str;
	
	String lp2 = lp + "day";
	
	$('input [name=leave_period]').attr('value',lp2);		
			
})

 */

 </script>

</body>
</html>


