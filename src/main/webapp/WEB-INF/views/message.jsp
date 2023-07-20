<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
String bbswrite = (String)request.getAttribute("insertmessage");
if(bbswrite != null && !bbswrite.equals("")){
	if(bbswrite.equals("작성완료했습니다")){
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