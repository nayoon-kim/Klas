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
	<title>������û ������</title>

	<!-- ��Ʈ��Ʈ��  css �߰��ϱ� -->
	<link rel = "stylesheet" href = "./css/bootstrap.min.css">
	<!-- Ŀ���� css �߰��ϱ� -->
	<link rel = "stylesheet" href = "./css/custom.css">
</head>
<body>
	<!-- �������� �ڹٽ�ũ��Ʈ �߰��ϱ� -->
	<script src="./js/jquery.min.js"></script>
	<!-- ���� �ڹٽ�ũ��Ʈ �߰��ϱ� -->
	<script src="./js/popper.min.js"></script>
	<!-- ��Ʈ��Ʈ�� �ڹٽ�ũ��Ʈ �߰��ϱ� -->
	<script src="./js/bootstrap.min.js"></script>
	<div class="uptitle" style="background-color: #eeeeee">
		<a class="mainpage" href="main.jsp"><font size="6">��ķ�۽�</font></a>
	</div>
	<section class="container">
		<form method="post" action="./enrollAction.jsp">
			<div>
				<button type="submit" class="btn btn-primary pull-right" name='act' value='cancel'>���</button>
				<button type="submit" class="btn btn-primary pull-right" name='act' value='enroll'>���</button> 
			</div><br><br>
			<div class="container">
				<div class="row">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align:center;">����</th>
							<th style="background-color: #eeeeee; text-align:center;">��ȣ</th>
							<th style="background-color: #eeeeee; text-align:center;">���Ǹ�</th>
							<th style="background-color: #eeeeee; text-align:center;">�ð�ǥ</th>
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