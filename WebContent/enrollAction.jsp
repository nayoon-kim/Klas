<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="section.SectionDAO" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String action = request.getParameter("act");
	String[] value = request.getParameterValues("check");
	int result = 0;
	
	String userID = null;
	userID = (String)session.getAttribute("userID");
	SectionDAO sectionDAO = new SectionDAO();
	
	if(action.equals("enroll"))
	{
		for(String val : value)
		{
			result = sectionDAO.enroll(userID, val);
			if(result == 1)
			{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('강의가 등록되었습니다');");
				script.println("location.href = 'enroll.jsp';");//사용자를 다시 원래 화면으로 돌려보낸다
				script.println("</script>");
				script.close();
			}
			else if(result == 0)
			{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('강의가 등록되지 않았습니다');");
				script.println("location.href = 'enroll.jsp';");//사용자를 다시 원래 화면으로 돌려보낸다
				script.println("</script>");
				script.close();
			}
			else
			{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('데이터베이스 오류');");
				script.println("location.href = 'enroll.jsp';");//사용자를 다시 원래 화면으로 돌려보낸다
				script.println("</script>");
				script.close();
			}
		}
	}
	else if(action.equals("cancel")){
		for(String val : value)
		{
			result = sectionDAO.cancel(userID, val);
			if(result == 1)
			{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('강의가 취소되었습니다');");
				script.println("location.href = 'enroll.jsp';");//사용자를 다시 원래 화면으로 돌려보낸다
				script.println("</script>");
				script.close();
			}
			else if(result == 0)
			{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('강의가 등록되지 않았습니다');");
				script.println("location.href = 'enroll.jsp';");//사용자를 다시 원래 화면으로 돌려보낸다
				script.println("</script>");
				script.close();
			}
			else
			{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('데이터베이스 오류');");
				script.println("location.href = 'enroll.jsp';");//사용자를 다시 원래 화면으로 돌려보낸다
				script.println("</script>");
				script.close();
			}
		}
	}
%>
</body>
</html>