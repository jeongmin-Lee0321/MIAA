<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/main_selection.css" />
<link rel="stylesheet" href="resources/css/searchpwform.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css'
	rel='stylesheet' type='text/css'>
</head>
<body>

	<div class="main-selection">
		<div class="selection-name">
			<span>비밀번호 찾기</span>
		</div>
		<div class="selection-explain">
			<span></span>
		</div>
	</div>

	<main>

		<div class="searchid_insert"
			style="width: 100%; height: 400px;  display: flex; justify-content: center; align-items: center; margin: auto; margin-top: 20px; text-align: center;">
			<form action="loginform">
				<div class="input-box">
					<input type="text" id="id" name="id" placeholder="아이디" required="required"/> <label
						for="id">아이디</label>
				</div>
				<div class="input-box">
					<input type="text" id="email" name="email" placeholder="이메일" required="required"/> <label
						for="email">이메일</label>
				</div>
				<div
					style="display: flex; justify-content: flex-start; margin-top: 40px;">
					<input type="button" id="searchpw" name="searchpw"
						onclick="searchpw();" value="찾기" style="cursor: pointer;"> <input type="submit"
						id="searchpw" value="확인" style="margin-left: 10px; cursor: pointer;">
				</div>

			</form>
		</div>
	</main>

	<script>
		$(document).ready(function() {
			$("#searchpw").click(searchpw);
		});
		function searchpw() {
			$.ajax({
				url : "searchpw",
				type : "post",
				datatype : "json",
				data : {
					"id" : $("#id").val(),
					"email" : $("#email").val()
				},
				success : function(finepw) {
					if (finepw != null) {
						if (finepw == "") {
							alert("아이디,이름,이메일을 다시 입력하세요.")
						} else {
							alert("비밀번호 : " + finepw);
						}
					}
				}
			});
		}
	</script>
	</form>
</body>
</html>