<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>유캠퍼스 웹 페이지</title>
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
	
	<%
		session.invalidate();
	%>
	<script>
		location.href = "index.jsp";
	</script>
	</body> 
</html>