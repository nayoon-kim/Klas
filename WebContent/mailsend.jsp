<%
	// 메일 보내기
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="false"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Properties"%>
<%@ page import="java.io.File"%>
<%@ page import="javax.activation.*"%>
<%@ page import="javax.mail.Transport"%>
<%@ page import="javax.mail.Message"%>
<%@ page import="javax.mail.internet.InternetAddress"%>
<%@ page import="javax.mail.Address"%>
<%@ page import="javax.mail.internet.MimeMessage"%>
<%@ page import="javax.mail.Session"%>
<%@ page import="javax.mail.Authenticator"%>
<%@ page import="javax.mail.Authenticator"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="professor.ProfessorDAO" %> 
<%@ page import="professor.MyAuthentication" %>
<%@ page import="student.StudentDAO" %>
<%@ page import="section.SectionDAO" %> 
<%@ page import="takes.TakesDAO" %>
<%@ page import="java.util.ArrayList" %>


<%
request.setCharacterEncoding("UTF-8");
String sectionID = null;
if(request.getParameter("sectionID") != null){
	sectionID = request.getParameter("sectionID");
}
 //values = request.getParameterValues("send");
String[] values = request.getParameterValues("remail");
ProfessorDAO prodao = new ProfessorDAO();
StudentDAO studentdao = new StudentDAO();
TakesDAO takesdao = new TakesDAO();


ArrayList<String> pro_info = new ProfessorDAO().getInfo((new SectionDAO().get_professorID(sectionID)));
//ArrayList<String> array1 = prodao.getInfo(request.getParameter("sectionID"));

ArrayList<String> stu_info = new ArrayList<String>();/////////////////////
for(String value : values)
{
	stu_info.add(value);
}

String title_ =  request.getParameter("title_");
String content_ = request.getParameter("content_");

	String host = "smtp.gmail.com";
	Properties prop = new Properties();
	prop.put("mail.smtp.host", host);
	prop.put("mail.smtp.port",465);
	prop.put("mail.smtp.auth","true");
	prop.put("mail.trasport.protocol","smtp");
	prop.put("mail.smtp.ssl.enable","true");
	prop.put("mail.smtp.ssl.trust","smtp.gmail.com");

	Authenticator auth = new MyAuthentication(pro_info.get(0),pro_info.get(1));
	
	Session ses = Session.getInstance(prop, auth);
	
	String sender = pro_info.get(0);
	
	
	Properties p = new Properties();
	p.put("mail.smtp.user", sender);
	p.put("mail.smtp.host", "smtp.gmail.com");
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	// 반드시 true 
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.transport.protocol","smtp");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");

	MimeMessage msg = null;
	
	try {
		//for(int i = 0; i< stu_email.size();i++){
		ses.setDebug(true);

		msg = new MimeMessage(ses);

		Address fromAddr = new InternetAddress(sender);
		msg.setFrom(fromAddr);
	
		InternetAddress[] toAddr = new InternetAddress[stu_info.size()];
		System.out.println(stu_info.size());
		for(int i = 0;i<stu_info.size();i++){
			toAddr[i] = new InternetAddress(stu_info.get(i));
		}

		msg.setRecipients(Message.RecipientType.TO, toAddr);
		msg.setSubject(title_);
		msg.setContent(content_, "text/html;charset=utf-8");

		Transport.send(msg);
		//}

	} catch (Exception mex) {
		System.out.println(mex.toString());
		String script = "<script type='text/javascript'>\n";
		script += "alert('메일발송 실패');\n";
		script += "history.back();\n";
		script += "</script>";
		out.print(script);
		return;
	} 
	String script = "<script type='text/javascript'>\n";
	script += "alert('메일 발송 완료.');\n";
	script += "history.back();";
	script += "history.back();";
	script += "</script>";
	out.print(script);
%>