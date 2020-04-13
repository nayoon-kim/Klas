<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="lecture.LectureDAO" %>
<%@ page import="java.io.File" %>
<% 
	request.setCharacterEncoding("UTF-8");
    String _upno = null;
    int _upno_int = 0;
	if(request.getParameter("upno") != null){
		_upno = (String)request.getParameter("upno");
		_upno_int = Integer.parseInt(_upno);
	}
	
	LectureDAO lecturedao = new LectureDAO();
	
%>
<!DOCTYPE html>
<!-- 게시판 / 내용 적기 -->
<html>
<head>
<title>게시판 글쓰기</title>
<meta charset="EUC-KR">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 뷰포트 / 모바일로 보았을 때 전반적인 것들의 디자인을 자동적으로 해주는 반응형 플랫폼이기 때문에 . -->

<meta name="viewport" content="width=device-width" initial-scale="1, shrink-to-fit=no">

<!-- 스타일시트 참조  -->

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
<title>강의목록 페이지</title>
</head>
<body>
 <nav class="navbar navbar-default">
  <div class="navbar-header">
     <a class="navbar-toggle collapsed" 

    data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"

    aria-expaned="false">
  		프로페서 WOOSAENG과 함께 재밌는 U-campus </a>
  </div>

 </nav>

</head>
<body>
<div class="container">
 
 	<div class="row">
 		<table class="table table-striped" width="513" style="border: 1ps solid #dddddd">
 		<tbody>
 		<td colspan="2" width="513" style="text-align:center"><%=lecturedao.Title(_upno_int)%></td>
 		<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
                <tr>
      	<td width="0">&nbsp;</td>
                   <td width="399" colspan="2" height="200" style="text-align:left"><%=lecturedao.Content(_upno_int) %></td>
                </tr>
     	<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
     		<%      	
     		String directory = application.getRealPath("/upload/");
			String files[] = new File(directory).list();

			for(String file: files){
				if(file.equals(lecturedao.CFName(_upno_int))){
			%>
			<td colspan="2" width="513" style="text-align:center">
			<% 
				out.write("<a href=\"" + request.getContextPath()+ "/downloadAction?file=" +
				java.net.URLEncoder.encode(file, "UTF-8") + "\">" + file+"</a><br>");
			%>
			</td>
			<% 
				}
			}		
			%>
</tbody>
</table>
	</div>
</div>

 <!-- 애니매이션 담당 JQUERY -->

 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 

 <!-- 부트스트랩 JS  -->

 <script src="./js/jquery.min.js"></script>
 <script src="./js/popper.js"></script>
  <script src="./js/bootstrap.min.js"></script>
  
</body>
</html>