<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>  
     <% 
	request.setCharacterEncoding("UTF-8");  	
    	String sectionID = null;
	if(request.getParameter("sectionID") != null){
		sectionID = (String) request.getParameter("sectionID");
	}
	%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ���ε�</title>
</head>
<body> 

<form action="uploadAction.jsp?sectionID=<%=sectionID%>" method="post" enctype="multipart/form-data">

	���� : <input type="text" size="50" name="title"><br>
	���� : <input type="text" cols="50" size="50" name="content"><br>
 	���� : <input type="file" name="file"><br>
	<input type="submit" value="���ε�">
</form>


</body>
</html>