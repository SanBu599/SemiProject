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
	String lowerFileName = dto.getNewfilename().toLowerCase();
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
	
  
  <div id="mainContent" class="content">
  	<div align="center">
	<h1>MY PAGE</h1>
</div>
<hr/><br/>

<div align="center">
<img src="http://localhost:9200/springSamples/upload/<%=lowerFileName %>" alt="프로필 이미지" class="imgfile">
</div>

<form action="upload.do" method="post" enctype="multipart/form-data">
<div align="center" class="profileImg">
	
	<br/><br/><br/>
	<input type="hidden" name="employee_id" value="<%=dto.getEmployee_id() %>">
	<input type="file" name="fileupload" id="fileupload" style="display:none;">
	<label for="fileupload">사진 등록하기</label>
	&nbsp;<input type="submit" value="저장">
</div>
</form>

<br/><br/><br/><hr/>

<div class="content">
	<table class="table">
		<tr>
			<th>사번&nbsp;&nbsp;&nbsp;&nbsp;</th>
			<td>
				<input type="text" name="employee_id" id="employee_id" class="mypageval" style="padding-left: 30px;" value="<%=dto.getEmployee_id() %>" readonly="readonly">
			</td>
		</tr>
		<tr>
			<th>이름&nbsp;&nbsp;&nbsp;&nbsp;</th>
			<td>
				<input type="text" name="employee_name" id="employee_name" class="mypageval" style="padding-left: 30px;" value="<%=dto.getEmployee_name() %>" readonly="readonly">
			</td>
		</tr>
		<tr>
			<th>직위&nbsp;&nbsp;&nbsp;&nbsp;</th>
			<td>
				<input type="text" name="erank" id="erank" class="mypageval" style="padding-left: 30px;" value="<%=dto.getErank() %>" readonly="readonly">
			</td>
		</tr>
		<tr>
			<th>이메일&nbsp;&nbsp;&nbsp;&nbsp;</th>
			<td>
				<input type="text" name="employee_email" id="employee_email" class="mypageval" style="padding-left: 30px;" value="<%=dto.getEmployee_email() %>" readonly="readonly">
				<input type="button" onclick="emailchkBtn()" class="emailchk" name="emailchk" id="emailchk" value="확인"  style="display: none;">
			</td>
		</tr>

		<tr>
			<th>부서명&nbsp;&nbsp;&nbsp;&nbsp;</th>
			<td>
				<select disabled id="department_name" class="mypageSelecteVal">
<%-- 				<option selected="selected" value="<%=dto.getDepartment_name() %>"><%=dto.getDepartment_name() %></option> --%>

					<option class="SelectVal" value="인사팀">인사팀</option>
					<option class="SelectVal" value="영업팀">영업팀</option>
					<option class="SelectVal" value="IT팀">IT팀</option>
					<option class="SelectVal" value="생산팀">생산팀</option>
					<option class="SelectVal" value="마케팅팀">마케팅팀</option>
					<option class="SelectVal" value="재경팀">재경팀</option>
				</select>
			
				<%-- <input type="text" name="department_name" id="department_name" class="mypageval" style="padding-left: 30px;" value="<%=dto.getDepartment_name() %>" readonly="readonly"> --%>
			</td>
		</tr>
		<tr>
			<th>입사일&nbsp;&nbsp;&nbsp;&nbsp;</th>
			<td>
				<input type="text" name="edate" id="edate" class="mypageval" style="padding-left: 30px;" value="<%=dto.getEdate().substring(0,10) %>" readonly="readonly">
			</td>
		</tr>
		<tr align="center">
			<td colspan="2">
				<input type="button" onclick="changeInfo()" class="changeBtn" name="changeInfo" id="changeInfo" value="나의 정보변경">
				<input type="button" onclick="changePwd()" class="changeBtn" name="changePwd" id="changePwd" value="비밀번호 변경">		
				<input type="button" onclick="cancelBtn()" class="changeBtn" name="cancelBtn" id="cancelBtn" value="취소"  style="display: none;">
			</td>
		</tr>
	</table>

</div>
  </div>
  
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</div>
</body>

</html>