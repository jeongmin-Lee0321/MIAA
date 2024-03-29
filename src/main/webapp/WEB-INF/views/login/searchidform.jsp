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
</head>
<body>
<h3>아이디 찾기</h3>
<form action="loginform">
이메일 : <input type="text" id="email" name="email"> <br>
<input type="button" id="searchid" name="searchid" onclick="searchid();" value="찾기">
<input type="submit" value="확인">
</form>
</main>

<script>
$(document).ready(function(){
	$("#searchid").click(searchid);
});
function searchid() {
	$.ajax({
		url: "searchid",
		type: "post",
		datatype: "json",
		data: {
			"email" : $("#email").val()
		},
		success: function(fineid) {
			if(fineid != null){
				if(fineid == ""){
					alert("아이디가 없습니다.")
				}else{
					alert("아이디 : "+fineid);
				}
			}
		}
	});
}
</script>
</form>
</body>
</html>