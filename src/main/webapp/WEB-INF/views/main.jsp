<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="javax.print.attribute.standard.DateTimeAtCompleted"%>
<%@page import="ssg.com.maeil.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDto dto = (MemberDto)session.getAttribute("login");
	if(dto == null || (dto.getEmployee_id()+"") == "" ||(dto.getEmployee_id()+"") == null) {
		%>
		<script>
		alert("로그인해주세요");
		location.href="login.do";
		</script>
		<%
	} else {
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Is Best를 방문해주셔서 감사합니다.</title>

<style>

#time {
	padding-top: 30px;
	font-size: 2.5em;
	margin: 0 auto;
	width:600px;
	height:100px;
	border: 3px solid black;
	background-image: 
}

</style>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

</head>
<body>

<p>어서오세요 <%=dto.getEmployee_name() %> 님</p>

<input type="button" id="mypagebtn" onclick="mypage()" value="마이페이지"/>
<input type="button" id="logoutbtn" onclick="logout()" value="로그아웃"/>

<%
Date crtTime = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");

%>


<div align="center" id="time">

</div>


  

<script>
	function mypage() {
		location.href="mypage.do";
	}
	
	function logout() {
		location.href="logout.do";
	}
	
	function updateTime() {
		const now = new Date();
		
		const currentDate = now.toLocaleDateString('ko-KR', {
			year: 'numeric', month: 'numeric', day : 'numeric',
			hour: '2-digit', minute: '2-digit', second: '2-digit'
		});
		
		$("#time").html(currentDate);
	}
	
	updateTime();
	setInterval(updateTime, 1000);
	
	
	
	
</script>


</body>
<% } %>

</html>