<%@page import="ssg.com.maeil.dto.AnnouncementDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
String insertmessage = (String)request.getAttribute("insertmessage");
if(insertmessage != null && !insertmessage.equals("")){
	if(insertmessage.equals("작성완료했습니다.")){
		%>
		<script type="text/javascript">
		alert("성공적으로 작성되었습니다");
		location.href = "announcementmain.do";
		</script>
		<%
	}
	else{
		%>
		<script type="text/javascript">
		alert("다시 작성해 주십시오");
		location.href = "announcementinsert.do";
		</script>
		<%
	}
}

String updatemessage = (String)request.getAttribute("updatemessage");
if(updatemessage != null && !updatemessage.equals("")){
	if(updatemessage.equals("Yes")){
		%>
		<script type="text/javascript">
		alert("수정되었습니다");
		location.href = "announcementmain.do";
		</script>
		<%
	}
	else{
		int seq = (Integer)request.getAttribute("seq");
		%>	
		<script type="text/javascript">
		alert("다시 작성해 주십시오");
		location.href = "announcementupdate.do?seq="+seq;
		</script>
		<%
	}
}	
String deletemessage = (String)request.getAttribute("deletemessage");
	if(deletemessage != null && !deletemessage.equals("")){
		if(deletemessage.equals("Y")){
			%>
			<script type="text/javascript">
			alert("삭제되었습니다");
			location.href = "announcementmain.do";
			</script>
			<%
		}
		else{
			int seq = (Integer)request.getAttribute("seq");
			%>	
			<script type="text/javascript">
			alert("돌아갑니다");
			location.href = "announcementdelete.do?seq="+seq;
			</script>
			<% 
		}
	}
String login = (String)request.getAttribute("loginmsg");

if(login != null && login.equals("") == false){
	if(login.equals("LOGIN_NO")){		
			%>
			<script>
			alert("아이디나 비밀번호를 확인해 주십시오");
			location.href = "login.do";
			</script>
			<%	
		}else{
			%>
			<script>
			alert("로그인되었습니다");
			location.href = "main.do";
			</script>
			<%
		}
	}	
String employeemessage = (String)request.getAttribute("employeemessage");
if(employeemessage != null && !employeemessage.equals("")){
	if(employeemessage.equals("가입성공")){
		%>
		<script type="text/javascript">
		alert("생성되었습니다");
		location.href = "main.do";
		</script>
		<%
	}
	else{
		%>	
		<script type="text/javascript">
		alert("돌아갑니다");
		location.href = "newemployee.do";
		</script>
		<% 
	}
}	
%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>