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
	
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Is Best를 방문해주셔서 감사합니다.</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
</head>
<body>
<div class="container">
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>
	
  
  <div class="item content-1">
  	<div id="circle"></div>
  	<br>
  	<p><%=dto.getEmployee_name() %><%=dto.getErank() %> 님</p><hr>
  	<p>출근 : <button>출근</button></p><br>
  	<p>퇴근 : <button>퇴근</button></p>
  </div>
  <div class="item content-2"><a href="announcementmain.do">공지사항</a></div>
  <div class="item content-3"><p>달력</p></div>
  
  <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
 
</div>
</body>
<script type="text/javascript">
function printTime() {
	var clock = document.getElementById("clock");
	var now = new Date();

	clock.innerHTML =
	(now.getMonth()+1) + "/" +
	now.getDate() + " " +
	now.getHours() + ":" +
	now.getMinutes() + " 	" +
	now.getSeconds() + " ";

	setTimeout("printTime()", 1000);
	}

	window.onload = function() {
	printTime();  
	};
</script>


</html>