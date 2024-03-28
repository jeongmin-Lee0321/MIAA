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
</head>
<body>
	<div>
	<h2>분실물 등록</h2><br>
	잃어버리신 물품을 등록하시면 내정보 알림게시판에서 습득물에 대한 정보를 받아보실 수 있습니다.<br>
	*표시는 필수 입력란입니다
	<h3>분실자 정보</h3>
	<form action="lost_item_write">
		연락처 : <input type="text" id="tel" name="tel"> <br>
		공개여부 : 공개<input type="radio" name="openclose" value="true"> 
				비공개<input type="radio" name="openclose" value="false"> <br>
		<hr>
		<h3>분실 일시 및 장소</h3>
		분실날짜 : <input type="date" id="lostday" name="lostday"> <br>
		분실장소 <br> <input type="text" id="sample6_address" name="address" placeholder="주소"> 
		<input type="hidden" id="sample6_extraAddress" name="address2" placeholder="참고항목">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<hr>
		<h3>분실물품 정보</h3>
		품명 : <input type="text" name="itemname"> <br> 
		품목/종류 : <select onchange="animalkind(this)" id=itemkind1 name="itemkind1">
			<option>품목을 선택하세요</option>
			<option value="PRI000">컴퓨터</option>
			<option value="PRJ000">휴대폰</option>
			<option value="PRH000">지갑</option>
			<option value="PRG000">전자기기</option>
			<option value="PRD000">산업용품</option>
			<option value="PRO000">귀금속</option>
			<option value="PRZ000">기타물품</option>
			<option value="PRE000">스포츠용품</option>
			<option value="PRF000">자동차</option>
			<option value="PRL000">현금</option>
			<option value="PRK000">의류</option>
			<option value="PRQ000">쇼핑백</option>
			<option value="PRR000">악기</option>
			<option value="PRP000">카드</option>
			<option value="PRM000">유가증권</option>
			<option value="PRN000">증명서</option>
			<option value="PRA000">가방</option>
			<option value="PRB000">도서용품</option>
			<option value="PRX000">유류품</option>
		</select> <select id=itemkind2 name="itemkind2">
			<option>종류를 선택하세요</option>
		</select> <br> 
		색상 : <select name="colorCd" id="colorCd">
			<option>색상을 선택하세요</option>
			<option value="CL1001">흰색</option>
			<option value="CL1002">검정</option>
			<option value="CL1003">빨강</option>
			<option value="CL1004">주황</option>
			<option value="CL1005">노랑</option>
			<option value="CL1006">초록</option>
			<option value="CL1007">파랑</option>
			<option value="CL1008">갈색</option>
			<option value="CL1009">보라</option>
			<option value="CL1010">핑크</option>
			<option value="CL1011">기타</option>
		</select><br> 
		특징 : <input type="text" name="sepcialMark"><br> 
		<input type="hidden" name="userId" value="${userId }">
		<br> <input type="submit" value="등록하기">
	</form>
</div>
<script>
	//주소록 찾기 
	function sample6_execDaumPostcode() {
		new daum.Postcode({
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
		var kind_PRI000 = ["삼성노트북", "LG노트북", "삼보노트북","기타","HP노트북","애플노트북"];
		var kind_PRJ000 = [ "삼성휴대폰", "LG휴대폰", "스카이휴대폰", "아이폰", "기타통신기기", "모토로라휴대폰", "기타휴대폰"];
		var kind_PRH000 = [ "여성용 지갑", "남성용 지갑", "기타 지갑"];
		var kind_PRG000 = [ "PMP", "MP3", "PDA", "카메라", "전자수첩", "기타용품", "태블릿", "스마트워치", "무선이어폰"];
		var kind_PRD000 = [ "기타물품"];
		var kind_PRO000 = ["반지", "목걸이", "귀걸이","시계" ,"기타"];
		var kind_PRZ000 = ["기타", "매장문화재", "선글라스","안경"];
		var kind_PRC000 = ["서류", "기타물품"];
		var kind_PRE000 = ["스포츠용품", "수영복", "수영물품"];
		var kind_PRF000 = ["자동차열쇠", "네비게이션", "자동차번호판", "기타용품", "임시번호판"];
		var kind_PRL000 = ["현금", "수표", "기타", "외화"];
		var kind_PRK000 = ["여성의류", "남성의류", "아기의류", "기타의류", "모자", "신발"];
		var kind_PRQ000 = ["쇼핑백"];
		var kind_PRR000 = ["건반악기","관악기","타악기","현악기","기타악기"];
		var kind_PRP000 = ["신용(체크)카드","일반카드","기타카드"];
		var kind_PRM000 = ["어음","상품권","채권","기타"];
		var kind_PRN000 = ["신분증","면허증","여권","기타","판결문"];
		var kind_PRA000 = ["여성용가방","남성용가방","기타가방"];
		var kind_PRB000 = ["학습서적","소설","컴퓨터서적","만화책","기타서적"];
		var kind_PRX000 = ["유류품"];
		var target = document.getElementById("itemkind2");
		if (e.value == "PRI000")
			var d = kind_PRI000;
		else if (e.value == "PRJ000")
			var d = kind_PRJ000;
		else if (e.value == "PRH000")
			var d = kind_PRH000;
		else if (e.value == "PRG000")
			var d = kind_PRG000;
		else if (e.value == "PRD000")
			var d = kind_PRD000;
		else if (e.value == "PRO000")
			var d = kind_PRO000;
		else if (e.value == "PRZ000")
			var d = kind_PRZ000;
		else if (e.value == "PRC000")
			var d = kind_PRC000;
		else if (e.value == "PRE000")
			var d = kind_PRE000;
		else if (e.value == "PRF000")
			var d = kind_PRF000;
		else if (e.value == "PRL000")
			var d = kind_PRL000;
		else if (e.value == "PRK000")
			var d = kind_PRK000;
		else if (e.value == "PRQ000")
			var d = kind_PRQ000;
		else if (e.value == "PRR000")
			var d = kind_PRR000;
		else if (e.value == "PRP000")
			var d = kind_PRP000;
		else if (e.value == "PRM000")
			var d = kind_PRM000;
		else if (e.value == "PRN000")
			var d = kind_PRN000;
		else if (e.value == "PRA000")
			var d = kind_PRA000;
		else if (e.value == "PRB000")
			var d = kind_PRB000;
		else if (e.value == "PRX000")
			var d = kind_PRX000;
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