<%@page import="ssg.com.maeil.dto.CalendarParam"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.mybatis.spring.SqlSessionTemplate"%>
<%@page import="ssg.com.maeil.dto.CalendarDto"%>
<%@page import="ssg.com.maeil.dao.CalendarDao"%>
<%@page import="ssg.com.maeil.dto.MemberDto"%>
<%@page import="java.util.List"%>

<%@page import="util.CalendarUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	 	
	int employee_id = ((MemberDto)session.getAttribute("login")).getEmployee_id();
		
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");

	System.out.println("daylist ====" + year + "====" + month + "====" + day);
	
	String yyyyMMdd = year + CalendarUtil.two(month) + CalendarUtil.two(day);
	System.out.println("daylist ====" + yyyyMMdd);
		
	CalendarParam param = (CalendarParam)request.getAttribute("param");	
	
	String pymd= param.getYyyyMMdd();
	System.out.println("daylist ====" + pymd);
	
	List<CalendarDto> list = (List)request.getAttribute("caldaylist");
		
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정목록</title>


<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>



</head>
<body>

<h2>일별일정</h2>
<br/>
<h3><%=year %>년 <%=month %>월 <%=day %>일의 일정</h3>

<div>
	<form>
		<table border="1" class="table table-hover">
		<col width="100"><col width="450"><col width="300">
			<thead align="center" class="thead-dark">
				<tr>
					<th>번호</th><th>제목</th><th>시간</th>
				</tr>
				
				<%									
					for(int i = 0; i < list.size(); i++) {						
						CalendarDto dto = list.get(i);
					%>
					<tr>
						<th><%=(i+1) %></th>
							<td>
								<a href="caldetail.do?seq=<%=dto.getSeq() %>">
									<%=dto.getTitle() %>
								</a>
							</td>
							<td><%=CalendarUtil.toDates(dto.getRdate()) %></td>
					</tr>					
					<%
					}
					%>			
			</thead>
			<tbody></tbody>
		</table>
	</form>
	
	<br/><br/>
	<a href="calendarlist.do" class="btn btn-primary">일정목록</a>
	
	
	
</div>

</body>
</html>











