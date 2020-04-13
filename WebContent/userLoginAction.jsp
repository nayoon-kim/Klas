<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="student.StudentDTO" %>
<%@ page import="student.StudentDAO" %>
<%@ page import="professor.ProfessorDTO" %>
<%@ page import="professor.ProfessorDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String userPassword = null;
	String choosing = request.getParameter("choosing");
	
	/*
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
	if(userID != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다');");
		script.println("location.href = 'index.jsp';");//사용자를 다시 원래 화면으로 돌려보낸다
		script.println("</script>");
		script.close();
	}*/
	
	
	if(request.getParameter("userID") != null)
	{
		userID = (String)request.getParameter("userID");
	}
	if(request.getParameter("userPassword") != null)
	{
		userPassword = (String)request.getParameter("userPassword");
	}
	if(userID == null || userPassword == null)
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("location.href='index.jsp';");//사용자를 다시 원래 화면으로 돌려보낸다
		script.println("</script>");
		script.close();
		return;
	}
	
	if(choosing.equals("학부생"))
	{
		StudentDAO studentDAO = new StudentDAO();
		int result = studentDAO.login(userID, userPassword);
		if(result == 1){
			session.setAttribute("userID", userID);
			session.setAttribute("choosing", choosing);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인에 성공했습니다.');");
			script.println("location.href = 'main.jsp';");//사용자를 다시 원래 화면으로 돌려보낸다
			script.println("</script>");
			script.close();
			
		}
		else if(result == 0)
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀렸습니다.');");
			script.println("location.href = 'index.jsp';");//사용자를 다시 원래 화면으로 돌려보낸다
			script.println("</script>");
			script.close();
		}
		else if(result == -2)
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류');");
			script.println("location.href = 'index.jsp';");//사용자를 다시 원래 화면으로 돌려보낸다
			script.println("</script>");
			script.close();
		}
		else
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이유를 모름');");
			script.println("location.href = 'index.jsp';");//사용자를 다시 원래 화면으로 돌려보낸다
			script.println("</script>");
			script.close();
			
		}
		
	}
	else if(choosing.equals("교수"))
	{
		ProfessorDAO professorDAO = new ProfessorDAO();
		int result = professorDAO.login(userID, userPassword);
		if(result == 1){
			session.setAttribute("userID", userID);
			session.setAttribute("choosing", choosing);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인에 성공했습니다.');");
			script.println("location.href = 'main.jsp';");//사용자를 다시 원래 화면으로 돌려보낸다
			script.println("</script>");
			script.close();
		}
		else if(result == 0)
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀렸습니다.');");
			script.println("location.href = 'index.jsp';");//사용자를 다시 원래 화면으로 돌려보낸다
			script.println("</script>");
			script.close();
		}
		else
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류');");
			script.println("location.href = 'index.jsp';");//사용자를 다시 원래 화면으로 돌려보낸다
			script.println("</script>");
			script.close();
		}
	}
	else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('사용자가 선택되지 않았습니다');");
		script.println("location.href = 'index.jsp';");//사용자를 다시 원래 화면으로 돌려보낸다
		script.println("</script>");
		script.close();
	}

	
%>