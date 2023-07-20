<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
</head>
<body>
<div>
	<h2>공지사항 작성하기</h2>
		<hr/><br><br>
       	<div>
       	<form method=post action="announcementinsertAf.do" id="frm">
       		<table>
       			
	       		<tr>
	       		<th width=10%>사원번호</th>
		       			<td width=80%>
		       				<form method=post action="announcementinsert.do">
		       				<input type=text size=15 class="input-sm" id="id" style="height: 30px" value="${sessionScope.id }">
		       				</form>
		       			</td>
	       		</tr>
       			<tr>
       			<th width=20%>제목</th>
	       			<td width=80%>
	       				<input type=text name=subject size=50 class="input-sm" id="subject" >
	       				
	       			</td>
       			</tr>
       			<tr>
       			<th width=20%>내용</th>
	       			<td width=80%>
	       				<textarea rows="10" cols="50" name=content id="content"></textarea>
	       			</td>
       			</tr>       			
       			<tr>
	       			<td colspan="2">
	       				<div class="wrap">
	       					<input type="button" value="글쓰기" class="button" id="writeBtn">
	       					<input type=button value="취소" class="button" onclick="javascipt:history.back()">
						</div>
	       				
	       			</td>
       			</tr>
       		</table>
       		</form>
       	</div>
       	</div>
       	</div>
       	</div>


</div>
<script type="text/javascript">
$(document).ready(function(){
	$("#button").click(function(){
		// 제목이 비었는지?
			if( $("#title").val().trim() == ""){
				alert("제목을 기입해 주십시오");
				return;
			}				
			// 내용이 비었는지?
			if( $("#content").val().trim() == "" ){
				alert("내용을 기입해 주십시오");
				return;
			}
		
			$("#frm").attr("action", "bbswriteAf.do").submit();		
		});
});
	

</script>


</body>
</html>