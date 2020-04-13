<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
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
	<div class="uptitle">
		<a class="pagename" href="index.jsp">유캠퍼스 웹 사이트</a>
	</div>
	<section class="container" style="max-width: 560px;">
		<form method="post" action="./userLoginAction.jsp">
		<div>
			<span>
				<select name="choosing">
					<option value="">--사용자--</option>
					<option value="학부생">학부생</option>
					<option value="교수">교수</option>
				</select>
			</span>
		</div>
			
			<div class="form-group">
				<label>아이디</label>
				<input type="text" name="userID" class="form-control">
			</div>
			<div class="form-group">
				<label>비밀번호</label>
				<input type="password" name="userPassword" class="form-control">
			</div>
			<button type="submit" class="btn btn-primary">로그인</button>
		</form>
	</section>
	</body> 
</html>