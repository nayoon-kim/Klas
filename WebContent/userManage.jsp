<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="takes.TakesDAO" %>
<%@ page import="professor.ProfessorDAO" %>
<%@ page import="java.util.ArrayList" %>
  <% 
	request.setCharacterEncoding("UTF-8");  	
    	String sectionID = null;
	if(request.getParameter("sectionID") != null){
		sectionID = (String) request.getParameter("sectionID");
	}
	TakesDAO takesdao = new TakesDAO();
	ProfessorDAO professorDAO = new ProfessorDAO();
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- ����Ʈ / ����Ϸ� ������ �� �������� �͵��� �������� �ڵ������� ���ִ� ������ �÷����̱� ������ . -->

<meta name="viewport" content="width=device-width" initial-scale="1, shrink-to-fit=no">

<!-- ��Ÿ�Ͻ�Ʈ ����  -->

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
<title>���������� ������</title>

</head>
<body>
 <nav class="navbar navbar-default">
  <div class="navbar-header">
     <a class="manage"><font size="6">������ ����</font></a>
  </div>

 </nav>
 <section class="container">
 	<form method="post" action='./mmail.jsp?sectionID=<%=sectionID %>'>
 		<div>
			<button type="submit" class="btn btn-primary pull-right" name="action" value='mail'>���� ����</button>
			<button type="submit" class="btn btn-primary pull-right" name="action" value='message'>���� ����</button>
		</div><br>
		<div class="container">
		<div class="row">
		<table class="table table-striped" width="513" style="border: 1ps solid #dddddd">
		<tbody>
		<td colspan="2" width="513">
					<tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
					<td width="10"></td>
					<td width="85">�̸�</td>
   					<td width="15">�й�</td>
   					<td width="85">�а�</td>
   					<td width="35">�г�</td>
   					<td width="138">�̸���</td>
   					<td width="145">�޴��� ��ȣ</td>	
  </tr>	
			
 		<% 
			for(int i = 0; i<takesdao.user_list(sectionID).size();i++){
								
		%> 
			<tr height="25" align="center">
				<td><input type='checkbox' name='check_student' value="<%=takesdao.user_list(sectionID).get(i)%>"></td>
				<td><%=professorDAO.info(takesdao.user_list(sectionID).get(i)).get(0) %></td>
				<td align ="left"><%=takesdao.user_list(sectionID).get(i) %></td>
				<td align ="center"><%=professorDAO.info(takesdao.user_list(sectionID).get(i)).get(1) %></td>
				<td align ="center"><%=professorDAO.info(takesdao.user_list(sectionID).get(i)).get(2)+"�г�" %></td>
				<td align = "center"><%=professorDAO.info(takesdao.user_list(sectionID).get(i)).get(3) %></td>
				<td align = "center"><%=professorDAO.info(takesdao.user_list(sectionID).get(i)).get(4) %></td>
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
	</form>
</section>

 <!-- �ִϸ��̼� ��� JQUERY -->

 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 

 <!-- ��Ʈ��Ʈ�� JS  -->

 <script src="./js/jquery.min.js"></script>
 <script src="./js/popper.js"></script>
  <script src="./js/bootstrap.min.js"></script>
 

</body>
</html>