<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="section.SectionDTO" %>
<%@ page import="section.SectionDAO" %>

<%
		SectionDAO sectionDAO = new SectionDAO();
		List<SectionDTO> sections = new ArrayList<SectionDTO>();
		sections = sectionDAO.getSection();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	<title>수강신청 페이지</title>

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
	</div>
	<section class="container">
		<form method="post" action="./enrollAction.jsp">
			<div>
				<button type="submit" class="btn btn-primary pull-right" name='act' value='cancel'>취소</button>
				<button type="submit" class="btn btn-primary pull-right" name='act' value='enroll'>등록</button> 
			</div><br><br>
			<div class="container">
				<div class="row">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align:center;">선택</th>
							<th style="background-color: #eeeeee; text-align:center;">번호</th>
							<th style="background-color: #eeeeee; text-align:center;">강의명</th>
							<th style="background-color: #eeeeee; text-align:center;">시간표</th>
						</tr>
					</thead>
					<tbody>
					<%
    					for( SectionDTO section : sections ){
					%>
        			<tr>
        				<td> <input type='checkbox' name='check' value= "<%= section.getSecid() %>" /></td>
            			<td><%= section.getSecid() %></td> 
            			<td><%= section.getCoursename() %></td>
           				<td><%= section.getSchedule() %></td>	
       			 	</tr>
					<% } %>
					</tbody>
					</table>
				</div>
			</div>
		</form>
	
	</section>
	
</body>
</html>