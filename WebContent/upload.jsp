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
<title>파일 업로드</title>
</head>
<body> 

<form action="uploadAction.jsp?sectionID=<%=sectionID%>" method="post" enctype="multipart/form-data">

	제목 : <input type="text" size="50" name="title"><br>
	내용 : <input type="text" cols="50" size="50" name="content"><br>
 	파일 : <input type="file" name="file"><br>
	<input type="submit" value="업로드">
</form>


</body>
</html>