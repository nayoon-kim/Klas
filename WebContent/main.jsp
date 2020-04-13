<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="section.SectionDTO" %>
<%@ page import="section.SectionDAO" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>광운대 유캠퍼스 메인 페이지</title>
	
	<!-- 부트스트랩  css 추가하기 -->
	<link rel = "stylesheet" href = "./css/bootstrap.min.css">
	<!-- 커스텀 css 추가하기 -->
	<link rel = "stylesheet" href = "./css/custom.css">
</head>
<body>
	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="./js/jquery.min.js"></script>
	<!-- 파퍼 자바스크립트 추가하기 -->
	<script src="./js/popper.min.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>
	
	<div class="uptitle" style="background-color: #eeeeee">
		<a class="mainpage" href="main.jsp"><font size="6">유캠퍼스</font></a>
		<%
			String choosing = (String)session.getAttribute("choosing");
			if(choosing.equals("학부생"))
			{
		%>
		<a href="logoutAction.jsp" class="btn btn-primary pull-right">로그아웃</a>
		<a href="enroll.jsp" class="btn btn-primary pull-right">수강신청</a>
		<%} else{
			%>
			<a href="logoutAction.jsp" class="btn btn-primary pull-right">로그아웃</a>
		<!-- <a href="enroll.jsp" class="btn btn-primary pull-right"></a>-->
		<%} %>
		
		
	</div><br><br>
		<section class="container" >
		<%
			if(session.getAttribute("userID") == null)
			{
				response.sendRedirect("./index.jsp");
			}
			else{
		%>
			<div class="container">
				<div class="row">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<%
							SectionDAO sectionDAO = new SectionDAO();
							List<SectionDTO> sections = new ArrayList<SectionDTO>();
							String userID = (String)session.getAttribute("userID");
							String key = null;
							if(choosing.equals("학부생")){
								sections = sectionDAO.s_getSection(userID);
							}
							else{
								sections = sectionDAO.p_getSection(userID);
							}
						%>
						<thead>
							<tr>
								<th style="background-color: #eeeeee; text-align: center;">번호</th>
								<th style="background-color: #eeeeee; text-align: center;">강의명</th>
								<th style="background-color: #eeeeee; text-align: center;">학기</th>
								<th style="background-color: #eeeeee; text-align: center;">강의실</th>
								<th style="background-color: #eeeeee; text-align: center;">시간</th>
								
							</tr>
						</thead>
						<tbody>
							<%
		    					for( SectionDTO section : sections ){
							%>
		        			<tr>
		            			<td><%= section.getSecid() %></td> 
		            			<td><a href="list.jsp?sectionID=<%= section.getSecid()%>"><%= section.getCoursename() %></a></td>
		            			<td><%= section.getYear() %></td>
		            			<td><%= section.getBuilding() %></td>
		           				<td><%= section.getSchedule() %></td>	
		       			 	</tr>
							<% } %>
						</tbody>
					</table>
					
				</div>
			</div>
		
			<% } %>
	</section>
</body>
</html>