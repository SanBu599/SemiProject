<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

String leaveadd = (String)request.getAttribute("leaveadd");
	if(leaveadd != null && !leaveadd.equals("")){
		if(leaveadd.equals("Lve_ADD_OK")){
			%>
			<script type="text/javascript">
			alert("성공적으로 추가되었습니다");
			location.href = "leavelist.do";
			</script>
			<%
		}
		else{
			%>
			<script type="text/javascript">
			alert("추가되지 않았습니다");		
			location.href = "leavelist.do";
			</script>
			<%
		}	
	}

