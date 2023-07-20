<%@page import="ssg.com.maeil.dto.AnnouncementSearch"%>
<%@page import="java.util.List"%>
<%@page import="util.AnnouncementUtil"%>
<%@page import="ssg.com.maeil.dto.AnnouncementDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<AnnouncementDto> list = (List)request.getAttribute("announcementList");
	int annPage = (Integer)request.getAttribute("annPage");
	
	AnnouncementSearch Annsearch = (AnnouncementSearch)request.getAttribute("Annsearch");
	int pageNumber = Annsearch.getPageNumber();
	String choice = Annsearch.getChoice();
	String search = Annsearch.getSearch();

%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="jquery/jquery.twbsPagination.min.js"></script>
<style type="text/css">
.center{
	margin: auto;
	width: 1000px;
	text-align: center;
}
th{
	background: royalblue;
	color: white;
} 
tr {
   line-height: 12px;   
}
</style>
</head>

<body>


<div class="center">

<table class="table table-hover">
<col width="70"><col width="600"><col width="100"><col width="150">

<thead>
<tr>
	<th>번호</th><th>제목</th><th>작성자</th><th>조회수</th>
</tr>
</thead>
</div>
<tbody>




</tbody>
<div></div>
	 
		   <h2>공지사항</h2>
		   <hr/><br><br>
				
			   
				       			<tr>
				       				<td width="45%">${vo.subject }</td>
				       				<!-- <td width="50%" style="text-align: right;">${vo.dbday }</td>  -->
				       				
				       			</tr>
						 </button>
						  <div></div>
							  	<br><br>

									  <tr>
					        			
					        		</tr>
					     			<tr>
					        			<td colspan="4">
					        		    	<buttontype="button" style=" display: inline-block;" >
					        				<a href="announcementupdate.do?no=${dto.seq }">수정</a>
					        				</button>
					        			</td>
					        		</tr>
					
						  
					
			
  <div>
        <div>
   			<table>
       			<tr>
       				<td>
       				
       					<div>
					  		<a href="announcementinsert.do">새글</a>
							<a href="main.do">홈</a>
						</div>
       				</td>
       				
       				<td>
       				    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	       					<a href="#">이전</a>
	       					${annPage} page / ${annPage} pages
	       					<a href="#">다음</a>
       					</td>
       			</tr>
       		</table>
        </div>
    </div>
  


</table>
</body>
</html>