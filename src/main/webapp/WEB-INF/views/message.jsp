<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

String login = (String)request.getAttribute("loginmsg");
	if(login != null && login.equals("") == false){
		if(login.equals("LOGIN_YES")){		
			%>
			<script>
			alert("로그인되었습니다");
			location.href = "calendarlist.do";
			</script>
			<%
		}else{
			%>
			<script>
			alert("아이디나 비밀번호를 확인해 주십시오");
			location.href = "login.do";
			</script>
			<%			
			}
	}

String calwrite = (String)request.getAttribute("calwrite");
	if(calwrite != null && !calwrite.equals("")){
		if(calwrite.equals("CAL_WRITE_OK")){
			%>
			<script type="text/javascript">
			alert("성공적으로 추가되었습니다");
			location.href = "calendarlist.do";
			</script>
			<%
		}
		else{
			%>
			<script type="text/javascript">
			alert("추가되지 않았습니다");		
			location.href = "calendarlist.do";
			</script>
			<%
		}	
	}

	String calupdate = (String)request.getAttribute("calupdate");
	if(calupdate != null && !calupdate.equals("")){
		if(calupdate.equals("CAL_UPDATE_OK")){
			%>
			<script type="text/javascript">
			alert("성공적으로 수정되었습니다");
			location.href = "calendarlist.do";
			</script>
			<%
		}
		else{
			%>
			<script type="text/javascript">
			alert("수정되지 않았습니다");		
			location.href = "calendarlist.do";
			</script>
			<%
		}	
	}

	String caldelete = (String)request.getAttribute("caldelete");
	if(caldelete != null && !caldelete.equals("")){
		if(caldelete.equals("CAL_DELETE_OK")){
			%>
			<script type="text/javascript">
			alert("성공적으로 삭제되었습니다");
			location.href = "calendarlist.do";
			</script>
			<%
		}
		else{
			%>
			<script type="text/javascript">
			alert("삭제되지 않았습니다");		
			location.href = "calendarlist.do";
			</script>
			<%
			}				
		}
	
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

	String leavedel = (String)request.getAttribute("leavedel");
	if(leavedel != null && !leavedel.equals("")){
		if(leavedel.equals("Lve_DELETE_OK")){
			%>
			<script type="text/javascript">
			alert("성공적으로 삭제되었습니다");
			location.href = "leavelist.do";
			</script>
			<%
		}
		else{
			%>
			<script type="text/javascript">
			alert("삭제되지 않았습니다");		
			location.href = "leavelist.do";
			</script>
			<%
			}				
		}
		%>