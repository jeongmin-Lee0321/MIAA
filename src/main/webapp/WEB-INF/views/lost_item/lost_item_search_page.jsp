<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>습득물 찾기</title>
</head>
<body>
		<table width="500" border="1">
			<tr>
				<td>이름</td>
				<td>위치</td>
				<td>분실일</td>
			</tr>
			<c:forEach items="${itemList }" var="dto">
			<tr>
				<td>${dto.item_name }</td>
				<td>${dto.address }</td>
				<td>${dto.lostday }</td>
			</tr>
			</c:forEach>
		</table>
</body>
</html>