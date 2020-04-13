<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="section.SectionDAO" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO" %>
<%@ page import="lecture.LectureDAO" %>
<%@ page import="java.util.ArrayList" %>
  <% 
	request.setCharacterEncoding("UTF-8");  	
    	String sectionID = null;
	if(request.getParameter("sectionID") != null){
		sectionID = (String) request.getParameter("sectionID");
	}
	//out.print(sectionID + "<br>");
	LectureDAO lecturedao = new LectureDAO();
	ArrayList<String> title = lecturedao.Title(sectionID);
	ArrayList<String> update = lecturedao.UpDate(sectionID);
	ArrayList<String> view = lecturedao.View(sectionID);
	ArrayList<String> upno = lecturedao.UpNo(sectionID);
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 뷰포트 / 모바일로 보았을 때 전반적인 것들의 디자인을 자동적으로 해주는 반응형 플랫폼이기 때문에 . -->

<meta name="viewport" content="width=device-width" initial-scale="1, shrink-to-fit=no">

<!-- 스타일시트 참조  -->

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
<title>강의 및 수강생 페이지</title>
</head>
<body>
 <nav class="navbar navbar-default">
  <div class="navbar-header">
  	<a class="listpage"><font size="6">강의 자료</font></a>
  </div>

 </nav>
 <div class="container">
 
 	<div class="row">
 			<table class="table table-striped" width="513" style="border: 1ps solid #dddddd">
 		<tbody>

 		<td colspan="2" width="513">
 		<% 
	 		String choosing = (String)session.getAttribute("choosing");
			if(choosing.equals("교수"))
			{
 		%>
 			<input type=button value="수강생 관리" OnClick="window.location='userManage.jsp?sectionID=<%=sectionID%>'">
			<input type=button value="글쓰기" OnClick="window.location='upload.jsp?sectionID=<%=sectionID%>'">
			<%} %>
			
		<tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
		
		   <td width="53">번호</td>
		   <td width="300">제목</td>
		   <td width="100">작성일</td>
   		</tr>
 		<% 
			for(int i = 0; i<title.size();i++){		
		%> 
		<tr height="25" align="center">
			<td><%=upno.get(i) %></td>
			<td align ="left"><a href="view.jsp?upno=<%= upno.get(i)%>"><%=title.get(i) %></a></td>
			<td align = "center"><%=update.get(i) %></td>	
				
		</tr>
		<tr height="0.1" bgcolor="#D2D2D2"><td colspan="6"></td>
		</tr>
			<%
			}
			%>

		</tbody>
		</table>
 	

	</div>
</div>

 <!-- 애니매이션 담당 JQUERY -->

 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 

 <!-- 부트스트랩 JS  -->

 <script src="./js/jquery.min.js"></script>
 <script src="./js/popper.js"></script>
  <script src="./js/bootstrap.min.js"></script>
 
</body>
</html>