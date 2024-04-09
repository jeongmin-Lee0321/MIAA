<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="resources/css/mypageform.css" />
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div style="text-align: center; font-size: 60px; margin-top: 50px;">

<a style="color : #0066ff";><%= request.getAttribute("userId") %></a> 님 환영합니다 !  

<table>
<tr>
<td class="left">아이디</td>
<td class="right"><a><%= request.getAttribute("userId") %></a></td>
</tr>
<tr>
<td class="left">이메일</td>
<td class="right"><a><%= request.getAttribute("userEmail") %></a></td>
</tr>
<tr>
<td class="left">비밀번호</td>
<td class="right">******</td>
</tr>
</table>
<br />
<table>
<tr>
<td class="left">주소</td>
<td class="right"><a><%= request.getAttribute("userAddr") %></a></td>
</tr>
<tr>
<td class="left">상세주소</td>
<td class="right"><a><%= request.getAttribute("userDaddr") %></a></td>
</tr>
<tr>
<td class="left">우편번호</td>
<td class="right"><a><%= request.getAttribute("userPostcode") %></a></td>
</tr>
</table>




</div>
</body>
</html>