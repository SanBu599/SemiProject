<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
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
	width: 700px;
	margin-left: 550px;
	font-size: 2em;
}

.table {
	border-collapse: separate;
	border-spacing: 0 1rem;
}

.mypageval {
	border-radius: 10px;
	padding : 10px;
	width: 400px;
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

.emailchk {
	width: 70px;
	height: 40px;
	border-radius: 10px;
	font-size:0.6em;
}

/* .mypageSelecteVal {
	border-radius: 10px;
	padding : 10px;
	width: 445px;
	height: 57px;
	font-size: 1em;

}
 */
 
select {
	border-radius: 10px;
	padding : 10px;
	padding-left : 30px;
	width: 445px;
	height: 57px;
	font-size: 1em;
	border: 2px solid black;
}

 
select[disabled] {
	border-radius: 10px;
	padding : 10px;
	padding-left : 30px;
	width: 445px;
	height: 57px;
	font-size: 1em; 
	color: black; /* 텍스트 색상 */
	background-color: white; /* 배경 색상 */
	cursor: not-allowed; /* 커서 모양 */
	border: 2px solid black; /* 테두리 스타일 */
}

.imgfile {
	width: 150px;
	height: 200px;
	align-content: center;
}
</style>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

</head>
<body>

<div align="center">
	<h1>MY PAGE</h1>
</div>
<hr/><br/>

<div align="center">
<img src="http://localhost:9200/Maeil_Naeil/upload/<%=dto.getNewfilename() %>" alt="프로필 이미지" class="imgfile">
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

<script>


let departmentSelect = document.getElementById("department_name");

for(var i = 0; i < departmentSelect.options.length; i++) {
    if(departmentSelect.options[i].value == "<%=dto.getDepartment_name() %>") {
        departmentSelect.options[i].selected = true;
        break;
      }
}


let saveYn = "NO";


function emailchkBtn() {
	if($("#employee_email").val().trim() == "") {
		alert("이메일을 입력해주세요.");
		return;
	}
		$.ajax ({
		url: "emailchkBtn.do",
		type: "post",
		data: { employee_email:$("#employee_email").val().trim() },
		success: function( response ) {
		/* 	alert((response)); */
			if( response == "USE_YES") {
				alert("사용가능한 이메일입니다");
				saveYn = "YES";
				return;
			} else if ($("#employee_email").val().trim() == ("<%= dto.getEmployee_email() %>")) {
				alert("현재 사용중인 이메일입니다");
				saveYn = "YES";
				return;
			} else {
				alert("이미 등록된 이메일입니다.")
				$("#employee_email").val("");
				saveYn = "NO";
			}
		},
		error: function(){
			alert("error");
		}
	});
}

function changeInfo() {
	
	// 나의 정보변경 버튼 클릭 시 저장으로 변경
	
	if($("#changeInfo").val() == "나의 정보변경") {

		
		$("#changeInfo").val("저장");
		$("#changePwd").hide();
		$("#cancelBtn").show();
		$("#emailchk").show();
		
	/* $("#department_name option").not(":selected").removeAttr("disabled"); */
		$("#department_name").removeAttr("disabled");
	
	/* 	$("#department_name").removeAttr("readonly"); */
		$("#employee_email").removeAttr("readonly");
		
	} else {
		
				
		if($("#employee_email").val().trim() != ("<%= dto.getEmployee_email() %>") && saveYn == "NO"){
			alert("이메일을 확인해주세요.");
			return;
		}
		
		// 저장 클릭 시 나의 정보변경으로 변경
		
		$("#changeInfo").val("나의 정보변경");
		$("#changePwd").show();
		$("#cancelBtn").hide();
		$("#emailchk").hide();
		
/*		$("#department_name option").not(":selected").attr("disabled", "disabled"); */
		$("#department_name").attr("disabled", "disabled");

/* 		$("#department_name").attr("readonly", "readonly"); */
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
				department_name: $("#department_name").val(),
				edate: $("#edate").val().trim(),
			}),
			success: function( response ) {
				if( response == "success" ) {
					alert("정보가 변경되었습니다.");
				} else {
					alert("이메일 확인 후 저장해주세요.")
					location.reload();
				}
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

function cancelBtn() {
	location.href="mypage.do";
}


</script>


</body>
</html>