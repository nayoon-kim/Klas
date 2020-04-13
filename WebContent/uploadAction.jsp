<%@ page import="lecture.LectureDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.PrintWriter" %>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 업로드</title>
</head>
<body> 
<%
	String directory =  application.getRealPath("/upload/");
int maxSize = 1024*1024*100;
String encoding = "EUC-KR";
String cfname = null;
String curl = null;
String title = null;
String content = null;
MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
if(multipartRequest.getOriginalFileName("file") != null)
{
	cfname = multipartRequest.getOriginalFileName("file");
}
if(multipartRequest.getFilesystemName("file") != null)
{
	curl = multipartRequest.getFilesystemName("file");
}
	title = multipartRequest.getParameter("title");
	content = multipartRequest.getParameter("content");
int num = 0;
if(cfname != null)
{
	if(!cfname.endsWith(".doc")&& !cfname.endsWith(".hwp") && !cfname.endsWith(".pdf") && !cfname.endsWith(".xls")&&!cfname.endsWith(".pptx")){
		File file = new File(directory + curl);
		file.delete();
		num = -1;
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('업로드할 수 없는 확장자 입니다');");
		script.println("</script>");
		script.close();
	}
	else{
		num = new LectureDAO().upload(sectionID,title, cfname, curl, content, "0");
		out.print(num);
	}
}
else{
	num = new LectureDAO().upload(sectionID,title, cfname, curl, content, "0");
	out.print(num);
}

if(num >= 0){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('업로드가 성공적으로 완료되었습니다');");	
	script.println("history.back(); history.back()");
	script.println("</script>");
	script.close();
	return;
}

%>

</body>
</html>