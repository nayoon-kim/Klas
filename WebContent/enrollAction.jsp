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
				script.println("alert('���ǰ� ��ϵǾ����ϴ�');");
				script.println("location.href = 'enroll.jsp';");//����ڸ� �ٽ� ���� ȭ������ ����������
				script.println("</script>");
				script.close();
			}
			else if(result == 0)
			{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('���ǰ� ��ϵ��� �ʾҽ��ϴ�');");
				script.println("location.href = 'enroll.jsp';");//����ڸ� �ٽ� ���� ȭ������ ����������
				script.println("</script>");
				script.close();
			}
			else
			{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('�����ͺ��̽� ����');");
				script.println("location.href = 'enroll.jsp';");//����ڸ� �ٽ� ���� ȭ������ ����������
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
				script.println("alert('���ǰ� ��ҵǾ����ϴ�');");
				script.println("location.href = 'enroll.jsp';");//����ڸ� �ٽ� ���� ȭ������ ����������
				script.println("</script>");
				script.close();
			}
			else if(result == 0)
			{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('���ǰ� ��ϵ��� �ʾҽ��ϴ�');");
				script.println("location.href = 'enroll.jsp';");//����ڸ� �ٽ� ���� ȭ������ ����������
				script.println("</script>");
				script.close();
			}
			else
			{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('�����ͺ��̽� ����');");
				script.println("location.href = 'enroll.jsp';");//����ڸ� �ٽ� ���� ȭ������ ����������
				script.println("</script>");
				script.close();
			}
		}
	}
%>
</body>
</html>