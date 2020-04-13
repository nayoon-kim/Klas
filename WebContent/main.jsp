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
	<title>����� ��ķ�۽� ���� ������</title>
	
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
		<%
			String choosing = (String)session.getAttribute("choosing");
			if(choosing.equals("�кλ�"))
			{
		%>
		<a href="logoutAction.jsp" class="btn btn-primary pull-right">�α׾ƿ�</a>
		<a href="enroll.jsp" class="btn btn-primary pull-right">������û</a>
		<%} else{
			%>
			<a href="logoutAction.jsp" class="btn btn-primary pull-right">�α׾ƿ�</a>
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
							if(choosing.equals("�кλ�")){
								sections = sectionDAO.s_getSection(userID);
							}
							else{
								sections = sectionDAO.p_getSection(userID);
							}
						%>
						<thead>
							<tr>
								<th style="background-color: #eeeeee; text-align: center;">��ȣ</th>
								<th style="background-color: #eeeeee; text-align: center;">���Ǹ�</th>
								<th style="background-color: #eeeeee; text-align: center;">�б�</th>
								<th style="background-color: #eeeeee; text-align: center;">���ǽ�</th>
								<th style="background-color: #eeeeee; text-align: center;">�ð�</th>
								
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