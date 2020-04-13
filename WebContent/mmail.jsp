<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="takes.TakesDAO" %>
<%@ page import="student.StudentDAO" %>
<%@ page import="professor.ProfessorDAO" %>

<%
	request.setCharacterEncoding("UTF-8");
	String sectionID = null;
	String action = request.getParameter("action");
	String[] values = request.getParameterValues("check_student"); //아이디(학변)
	//int size = values.length;
	if(request.getParameter("sectionID") != null){
		sectionID = (String)request.getParameter("sectionID");
	}
StudentDAO studentdao = new StudentDAO();
TakesDAO takesdao = new TakesDAO();

ArrayList<String> stu_phone = new ArrayList<String>();
ArrayList<String> stu_email = new ArrayList<String>();

for(String value : values){
	
	stu_email.add(studentdao.get_email(value));
}
for(String value: values)
{
	stu_phone.add(studentdao.get_phone(value));
}
%>

<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
  <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.css">
<title>수강생 MAIL 전송 </title>
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
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="js/bootstrap.js"></script>
    	<div class="container"> 
    		<%
    			if(action.equals("mail"))
    			{
    		%>
			<form action = "mailsend.jsp?sectionID=<%=sectionID%>" method="post">
				<table class="table table-striped" style="text-align; center; border; 1px solid #dddddd">
    			<thead>
    			<tr>
    			<th style="text-align:center;">메일 전송 양식</th>
    			</tr>
    			</thead>
    			<tbody>
    				<tr>
    					<td>
    						<textarea class="form-control" maxlength="45" name="title_" style="height:55px;" placeholder="제목"></textarea>
    					</td>
    				</tr>
    				<tr>
    					<td>
    						<textarea class="form-control" maxlength="45" name="content_" style="height:220px;" placeholder="보낼 내용"></textarea>
    					</td>
    				</tr>
    				<%for(String email : stu_email) {%>
    				<tr>
    					<td>
    						<input class="form-control" type="text" name="remail" value=<%=email %>>
    					</td>
    				</tr>
    			<%} %>
    				<tr>
    					<td>
        					<button type="submit" class="btn btn-primary">전송</button>
    					</td>
    				</tr>
    			</tbody>
    		</table> 
    	</form>
    	<%} else {%>
    	<form action = "smsSend.jsp?sectionID=<%=sectionID%>" method="post">
				<table class="table table-striped" style="text-align; center; border; 1px solid #dddddd">
    			<thead>
    			<tr>
    			<th style="text-align:center;">문자 전송 양식</th>
    			</tr>
    			</thead>
    			<tbody>
    				<tr>
    					<td>
    						<textarea class="form-control" maxlength="45" name="msg" style="height:220px;" placeholder="보낼 내용"></textarea>
    					</td>
    				</tr>
    				<%for(String phone : stu_phone) {%>
    				<tr>
    					<td>
    						<input class="form-control" type="text" name="rphone" value=<%= phone%>>
    						<input type="hidden" name="action" value="go">
	                      <input type="hidden" name="sphone1" value="010">
	                       <input type="hidden" name="sphone2" value="2626">
	                       <input type="hidden" name="sphone3" value="4815">
    					</td>
    				</tr>
    			<%} 
    			%>
    				<tr>
    					<td>
        					<button type="submit" class="btn btn-primary">전송</button>
    					</td>
    				</tr>
    			</tbody>
    		</table> 
    	</form>
    	<%} %>
    </div>   
    </body>

    </html>
