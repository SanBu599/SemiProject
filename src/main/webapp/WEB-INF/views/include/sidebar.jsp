<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ssg.com.maeil.dto.MemberDto"%>
<% MemberDto dto = (MemberDto)session.getAttribute("login"); %>
<div class="item sidebar-1">
	<p id="clock"></p>
</div>
<div class="item sidebar-2" align="center">
	<form action="mypage.do">
		<button type="submit">마이페이지</button>
	</form>
	<form action="">
		<button type="submit">부서일정관리</button>
	</form>
	<form action="announcementmain.do" id="frm">
		<button type="submit">공지사항</button>
	</form><br>
	<%
		if(dto.getAuth()==3){
	%>
	<a href="newemployee.do">사원 추가</a>
	<%
		}
	%>
</div>