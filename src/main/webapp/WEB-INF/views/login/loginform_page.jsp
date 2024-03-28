<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h3>로그인 하기</h3>
		아직 계정이 없으신가요? <a href="joinform">가입하기</a> <br>
		<br>
		<form action="login">
			아이디 : <input type="text" id="id" name="id" /> <br>
			비밀번호 : <input type="text" id="pw" name="pw" /> <br> 
			<input type="submit" id="login" value="로그인">
		</form>
		<a href="searchidform">아이디 찾기</a> <a href="searchpwform">비밀번호 찾기</a> <br>
</body>
</html>