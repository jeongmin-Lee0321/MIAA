<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css'
	rel='stylesheet' type='text/css'>
</head>
<body>
<h3>비밀번호 찾기</h3>
<form action="loginform">
아이디 : <input type="text" id="id" name="id"> <br>
이메일 : <input type="text" id="email" name="email"> <br>

<input type="button" id="searchpw" name="searchpw" onclick="searchpw();" value="찾기">
<input type="submit" value="확인">
</form>

<script>
$(document).ready(function(){
	$("#searchpw").click(searchpw);
});
function searchpw() {
	$.ajax({
		url: "searchpw",
		type: "post",
		datatype: "json",
		data: {
			"id" : $("#id").val(),
			"email" : $("#email").val()
		},
		success: function(finepw) {
			if(finepw != null){
				if(finepw == ""){
					alert("아이디,이름,이메일을 다시 입력하세요.")
				}else{
					alert("비밀번호 : "+finepw);
				}
			}
		}
	});
}
</script>
</form>
</body>
</html>