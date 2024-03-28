<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<h3>가입하기</h3>
	이미 사용 중인 계정이 있다면
	<a href="loginform">로그인</a> 하세요
	<br>
	<br>
	<form action="join">
		아이디 : <input type="text" id="id" name="id" /> 
		<input type="button" id="idchk" onclick="idchk();" value="아이디 중복확인"> <br>
		비밀번호 : <input type="text" id="pw" name="pw" /> <br> 
		비밀번호 확인 : <input type="password" id="pw2" name="pw2"> 
		<input type="button" id="pwchk" name="pwchk" value="비밀번호 확인"> <br> 
		이메일 : <input type="email" id="email" name="email" /> 
		<input type="button" id="emailchk" onclick="emailchk();" value="이메일 중복확인"> <br>
		우편번호 : <input type="text" id="sample6_postcode" name="postcode" placeholder="우편번호"> 
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		주소 : <input type="text" id="sample6_address" name="address" placeholder="주소"> 
		상세주소 : <input type="text" id="sample6_detailAddress" name="detailAddress" placeholder="상세주소"><br>
		<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
		<input type="submit" value="회원가입">

		<script>
			function sample6_execDaumPostcode() {
				new daum.Postcode(
						{
							oncomplete : function(data) {
								var addr = ''; // 주소 변수
								var extraAddr = ''; // 참고항목 변수
								if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
									addr = data.roadAddress;
								} else { // 사용자가 지번 주소를 선택했을 경우(J)
									addr = data.jibunAddress;
								}
								if (data.userSelectedType === 'R') {
									if (data.bname !== ''
											&& /[동|로|가]$/g.test(data.bname)) {
										extraAddr += data.bname;
									}
									if (data.buildingName !== ''
											&& data.apartment === 'Y') {
										extraAddr += (extraAddr !== '' ? ', '
												+ data.buildingName
												: data.buildingName);
									}
									if (extraAddr !== '') {
										extraAddr = ' (' + extraAddr + ')';
									}
									document
											.getElementById("sample6_extraAddress").value = extraAddr;

								} else {
									document
											.getElementById("sample6_extraAddress").value = '';
								}
								document.getElementById('sample6_postcode').value = data.zonecode;
								document.getElementById("sample6_address").value = addr;
								document
										.getElementById("sample6_detailAddress")
										.focus();
							}
						}).open();
			}
		</script>
		<script>
			$(document).ready(function() {
				$("#idchk").click(idchk);

			});
			function idchk() {
				$.ajax({
					url : "idcheck",
					type : "post",
					dataType : "json",
					data : {
						"id" : $("#id").val()
					},
					success : function(num) {
						if (num == 1) {
							alert("중복된 아이디입니다.");
						}else if(num==-1){
							alert("아이디를 입력하세요.")
						}else{
							alert("사용가능한 아이디입니다.")
						}
					}
				});
			}
		</script>
		<script>
			$(document).ready(function() {
				$("#emailchk").click(emailchk);
			});
			function emailchk() {
				$.ajax({
					url : "emailchk",
					type : "post",
					dataType : "json",
					data : {
						"email" : $("#email").val()
					},
					success : function(num2) {
						if (num2 == 1) {
							alert("중복된 이메일입니다.");
						} else if (num2 == 0) {
							alert("사용가능한 이메일입니다.")
						} else {
							alert("이메일을 입력하세요.")
						}
					}
				});
			}
		</script>
		<script>
			$(document).ready(function() {
				$("#pwchk").click(function() {
					if ($("#pw").val() == "" || $("#pw2").val() == "") {
						alert("비밀번호를 입력하세요.");
					} else if ($("#pw").val() == $("#pw2").val()) {
						alert("비밀번호가 일치합니다.");
					} else {
						alert("비밀번호가 일치하지 않습니다.");
					}
				})
			})
		</script>
	</form>
</body>
</html>