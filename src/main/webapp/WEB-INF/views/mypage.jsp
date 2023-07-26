<%@page import="ssg.com.maeil.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDto dto = (MemberDto)session.getAttribute("login");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>

<style>

.content {
	border-radius: 20px;
	padding : 50px;
	background-color: rgb(180, 250, 250);
	width: 500px;
	margin-left: 650px;
	font-size: 2em;
}

.table {
	border-collapse: separate;
	border-spacing: 0 1rem;
}

.mypageval {
	border-radius: 10px;
	padding : 10px;
	width: 300px;
	height: 30px;
	font-size: 1em;
}

.changeBtn {
	border-radius: 20px;
	width: 150px;
	height: 50px;
	font-size: 0.6em;
	margin-top: 30px;
}


</style>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

</head>
<body>

<div align="center">
	<h1>MY PAGE</h1>
</div>
<hr/><br/>
 

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
			</td>
		</tr>

		<tr>
			<th>부서명&nbsp;&nbsp;&nbsp;&nbsp;</th>
			<td>
				<input type="text" name="department_name" id="department_name" class="mypageval" style="padding-left: 30px;" value="<%=dto.getDepartment_name() %>" readonly="readonly">
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
			</td>
		</tr>
	</table>

</div>

<script>
function changeInfo() {
	
	// 나의 정보변경 버튼 클릭 시 저장으로 변경
	
	if($("#changeInfo").val() == "나의 정보변경") {
		
		$("#changeInfo").val("저장");
		$("#changePwd").hide();
		
		$("#department_name").removeAttr("readonly");
		$("#employee_email").removeAttr("readonly");
	} else {
		
		// 저장 클릭 시 나의 정보변경으로 변경
		
		$("#changeInfo").val("나의 정보변경");
		$("#changePwd").show();
		
		$("#department_name").attr("readonly", "readonly");
		$("#employee_email").attr("readonly", "readonly");
		
		
 		$.ajax ({
			url: "changeInfo.do",
			type: "post",
			contentType: "application/json",
			data: JSON.stringify({
				employee_id: $("#employee_id").val().trim(),
				employee_name: $("#employee_name").val().trim(),
				erank: $("#erank").val().trim(),
				employee_email: $("#employee_email").val().trim(),
				department_name: $("#department_name").val().trim(),
				edate: $("#edate").val().trim(),
			}),
			success: function( response ) {
				
				alert("정보가 변경되었습니다");
			},
			error:function(request, status, error){

			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

			}

		});
	}
	
}

function changePwd() {
	window.open('changePwd.do','비밀번호 변경하기','width=430,height=500,location=no,status=no,scrollbars=yes');
}

</script>


</body>
</html>