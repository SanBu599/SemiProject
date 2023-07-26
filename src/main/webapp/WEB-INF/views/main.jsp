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
<style type="text/css">
.container {
  display: grid;
  width: 2000px;
  height: 1000px;
  grid-template-columns: 150px 1fr 1fr;
  grid-template-rows: 150px 150px 250px 400px;
  grid-template-areas:
      "logo header header"
      "sidebar-1 content-1 content-2"
      "sidebar-2 content-1 content-2"
      "sidebar-2 content-3 content-3"
      "footer footer footer";
}

.header {
  grid-area: header;
}
.logo{
	grid-area:logo;
}
.sidebar-1 {
  grid-area: sidebar-1;
}
.sidebar-2{
  grid-area: sidebar-2;
}

.content-1 {
  grid-area: content-1;
}

.content-2 {
  grid-area: content-2;
}

.content-3 {
  grid-area: content-3;
}



.footer {
  grid-area: footer;
  
}

/* OTHER STYLES */

body {
  display: flex;
  justify-content: center;
  padding: 20px;
 
}

.item {
  border-radius: 4px;
  border: 1px solid #171717;
  display: flex;
  font-weight: bold;
}

.header {
	flex-direction: column;
	align-items: center;
	justify-content: center;
}
.logo{
	align-items: center;
	justify-content: center;
}
.sidebar-1 {
	flex-direction: column;
	align-items: center;
	justify-content: center;
}
.sidebar-2 {
 	flex-direction: column;
 	justify-content: space-around;
}

.content-1{
	flex-direction: column;
	align-items: center;
	justify-content: center;
}
.content-2{
	flex-direction: column;
	align-items: flex-start;
}
.content-3{
	flex-direction: column;
  	align-items: flex-start;
}

.footer {
	align-items: flex-end;
 	justify-content: right;
}
#circle {

  width : 100px;
  height : 100px;
  border-radius: 50%;
  background-color: white;
  border: solid 1px;

}
</style>
</head>
<body>
<div class="container">
	<div class="item logo">
		<a href="main.do"><img height="150px" alt="회사로고" src="https://github.com/jujuclip/springSamples/assets/131274746/4d6dfd2c-32d4-4852-b106-edaede0bc3ab"></a>
		
	</div>
  <div class="item header">
  	<h2>회사명</h2>
  </div>
  <div class="item sidebar-1">
  	<p id="clock"></p>
  </div>
	<div class="item sidebar-2" align="center">
		<form action="">
			<button type="submit">마이페이지</button>
		</form>
		<form action="">
			<button type="submit">부서일정관리</button>
		</form>
		<form action="announcementmain.do" id="frm">
			<button type="submit">공지사항</button>
		</form><br>
	<%
			if(mem.getAuth()==3){
		%>
			<a href="newemployee.do">사원 추가</a>
		<%
			}
	%>
	</div>
  <div class="item content-1">
  	<div id="circle"></div>
  	<br>
  	<p><%=mem.getEmployee_name() %><%=mem.getErank() %> 님</p><hr>
  	<p>출근 : <button>출근</button></p><br>
  	<p>퇴근 : <button>퇴근</button></p>
  </div>
  <div class="item content-2"><a href="announcementmain.do">공지사항</a></div>
  <div class="item content-3"><p>달력</p></div>
  
  <div class="item footer">
  대표 : 심이베<br>
  Tel : 051-000-0000<br>
  주소 : 부산광역시 바닷속 어딘가
  </div>
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