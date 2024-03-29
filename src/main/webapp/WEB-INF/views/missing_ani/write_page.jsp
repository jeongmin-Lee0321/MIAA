<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div>
	<h2>실종동물 등록</h2><br>
	소중한 반려동물이 실종되었습니다. 아래와 같은 동물을 발견하셨다면 관할기관에 맡겨주세요. <br>
	*표시는 필수 입력란입니다
	<h3>보호자 정보</h3>
	<form action="missing_ani_write">
		연락처 : <input type="text" id="tel" name="tel"> <br> 
		공개여부 : 공개<input type="radio" name="openclose" value="open"> 
				 비공개<input type="radio" name="openclose" value="close"> <br>
		<hr>
		<h3>실종 일시 및 장소</h3>
		분실날짜 : <input type="date" id="lostday" name="lostday"> <br>
		분실장소 <br> <input type="text" id="sample6_address" name="address" placeholder="주소"> 
		<input type="hidden" id="sample6_extraAddress" name="address2" placeholder="참고항목">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<hr>
		<h3>실종동물 정보</h3>
		이름 : <input type="text" name="animalname"> <br> 
		품종/품종 : <select onchange="animalkind(this)" id=animalkind1 name="animalkind1">
			<option>품종 종류를 선택하세요</option>
			<option value="a">강아지</option>
			<option value="b">고양이</option>
			<option value="c">기타</option>
		</select> 
		<select id=animalkind2 name="animalkind2">
			<option>품종을 선택하세요</option>
		</select> <br> 
		성별 : 암컷<input type="radio" name="sexCd" value="M">
			   수컷<input type="radio" name="sexCd" value="F"><br> 
		색상 : <select name="colorCd" id="colorCd">
			<option>색상을 선택하세요</option>
			<option value="흰색">흰색</option>
			<option value="검은색">검은색</option>
			<option value="갈색">갈색</option>
		</select> 
		나이 : <input type="text" name="age"> <br> 
		특징 : <input type="text" name="sepcialMark"><br> 
		<br> <input type="submit" value="등록하기">
		<input type="hidden" name="userId" value="${userId }">
	</form>
</div>
<script>
	//주소록 찾기
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
								document.getElementById("sample6_extraAddress").value = extraAddr;

							} else {
								document.getElementById("sample6_extraAddress").value = '';
							}

							document.getElementById("sample6_address").value = addr;
						}
					}).open();
		}
</script>
<script>
//분류표 선택 
	function animalkind(e) {
		var kind_a = [ "요크셔테리어", "불독", "진도개" ];
		var kind_b = [ "집고양이", "거리고양이", "점박고양이" ];
		var kind_c = [ "새", "물고기", "곤충" ];
		var target = document.getElementById("animalkind2");

		if (e.value == "a")
			var d = kind_a;
		else if (e.value == "b")
			var d = kind_b;
		else if (e.value == "c")
			var d = kind_c;
		target.options.length = 0;

		for (x in d) {
			var opt = document.createElement("option");
			opt.value = d[x];
			opt.innerHTML = d[x];
			target.appendChild(opt);
		}
	}
</script>
</body>
</html>