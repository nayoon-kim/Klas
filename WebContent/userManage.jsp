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

<!-- 뷰포트 / 모바일로 보았을 때 전반적인 것들의 디자인을 자동적으로 해주는 반응형 플랫폼이기 때문에 . -->

<meta name="viewport" content="width=device-width" initial-scale="1, shrink-to-fit=no">

<!-- 스타일시트 참조  -->

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
<title>수강생관리 페이지</title>

</head>
<body>
 <nav class="navbar navbar-default">
  <div class="navbar-header">
     <a class="manage"><font size="6">수강생 관리</font></a>
  </div>

 </nav>
 <section class="container">
 	<form method="post" action='./mmail.jsp?sectionID=<%=sectionID %>'>
 		<div>
			<button type="submit" class="btn btn-primary pull-right" name="action" value='mail'>메일 전송</button>
			<button type="submit" class="btn btn-primary pull-right" name="action" value='message'>문자 전송</button>
		</div><br>
		<div class="container">
		<div class="row">
		<table class="table table-striped" width="513" style="border: 1ps solid #dddddd">
		<tbody>
		<td colspan="2" width="513">
					<tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
					<td width="10"></td>
					<td width="85">이름</td>
   					<td width="15">학번</td>
   					<td width="85">학과</td>
   					<td width="35">학년</td>
   					<td width="138">이메일</td>
   					<td width="145">휴대폰 번호</td>	
  </tr>	
			
 		<% 
			for(int i = 0; i<takesdao.user_list(sectionID).size();i++){
								
		%> 
			<tr height="25" align="center">
				<td><input type='checkbox' name='check_student' value="<%=takesdao.user_list(sectionID).get(i)%>"></td>
				<td><%=professorDAO.info(takesdao.user_list(sectionID).get(i)).get(0) %></td>
				<td align ="left"><%=takesdao.user_list(sectionID).get(i) %></td>
				<td align ="center"><%=professorDAO.info(takesdao.user_list(sectionID).get(i)).get(1) %></td>
				<td align ="center"><%=professorDAO.info(takesdao.user_list(sectionID).get(i)).get(2)+"학년" %></td>
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

 <!-- 애니매이션 담당 JQUERY -->

 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 

 <!-- 부트스트랩 JS  -->

 <script src="./js/jquery.min.js"></script>
 <script src="./js/popper.js"></script>
  <script src="./js/bootstrap.min.js"></script>
 

</body>
</html>