<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/main_contents.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
</head>
<body>
	<div class="main-contents">
		<!-- 검색창과 검색결과 -->
		<div class="searchbar-container">
			<form id="search_form" action="lost_item_search_page">
				<!-- 서치바 셀렉 그룹시작 -->
				<input type="hidden" name="allsearchPage" value="1" />
				<div class="searchbar-select-group">
					<div class="searchbar-title">
						<span>기간</span>
					</div>
					<div class="searchbar-content">
						<input type="date" name="searchday1" id="searchday1" value="${searchContent.get(0) }"> 
						<span>~</span> 
						<input type="date" name="searchday2" id="searchday2" value="${searchContent.get(1) }"> 
						<span>(습득일 기준)</span>
					</div>
				</div>

				<!-- 멀티그룹묶음 -->
				<div class="searchbar-mutil-group">
					<div class="searchbar-title">
						<span>습득지역</span>
					</div>
					<div class="searchbar-select-group">
						<div class="searchbar-title">
							<span>시도</span>
						</div>
						<div class="searchbar-content">
							<select name="addressCode" id="addressCode">
								<option value="">전체지역(all)</option>
								<option value="LCA000">서울특별시</option>
								<option value="LCH000">강원도</option>
								<option value="LCI000">경기도</option>
								<option value="LCJ000">경상남도</option>
								<option value="LCK000">경상북도</option>
								<option value="LCQ000">광주광역시</option>
								<option value="LCR000">대구광역시</option>
								<option value="LCS000">대전광역시</option>
								<option value="LCT000">부산광역시</option>
								<option value="LCU000">울산광역시</option>
								<option value="LCV000">인천광역시</option>
								<option value="LCL000">전라남도</option>
								<option value="LCM000">전라북도</option>
								<option value="LCN000">충청남도</option>
								<option value="LCO000">충청북도</option>
								<option value="LCP000">제주특별자치도</option>
								<option value="LCW000">세종특별자치시</option>
								<option value="LCF000">해외</option>
								<option value="LCE000">기타</option>
							</select>
						</div>
					</div>
				</div>

				<div class="searchbar-mutil-group">
					<div class="searchbar-select-group">
						<div class="searchbar-title">
							<span>품목</span>
						</div>
						<div class="searchbar-content">
							<select name="itemkind1" id="itemkind1"
								onchange="getSubCategories(this.value)">
								<option value="">전체분류(all)</option>
								<option value="PRI000">컴퓨터</option>
								<option value="PRJ000">휴대폰</option>
								<option value="PRH000">지갑</option>
								<option value="PRG000">전자기기</option>
								<option value="PRD000">산업용품</option>
								<option value="PRO000">귀금속</option>
								<option value="PRZ000">기타물품</option>
								<option value="PRC000">서류</option>
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
							</select> <span>-</span> <select name="itemkind2" id="itemkind2">
								<option value=""></option>
							</select>
						</div>
					</div>
					<div class="searchbar-select-group">
						<div class="searchbar-title">
							<span>색상</span>
						</div>
						<div class="searchbar-content">
							<select name="colorCd" id="colorCd">
								<option value="">전체색상(all)</option>
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
							</select>
						</div>
					</div>
				</div>

				<!-- form 조회용 버튼 -->
				<div class="search-btn-block">
					<button style="font-family: inherit;">
						조회<img src="resources/img/searchIcon.png" alt="">
					</button>
				</div>
			</form>
		</div>
		<!-- 검색창과 검색결과 끝 -->

		<!-- result-container시작 -->

		<div class="result-container">
			<!-- 결과 리스트 총 갯수 프레임 -->
			<div class="total-resultNum-wrapper">
				<div class="total-resultNum-container">
					<span>전체 </span><span class="totalNum">${totalCount }</span><span>건</span>
				</div>
			</div>

			<!-- 검색 결과 리스트프레임 -->
			<div class="result-list">

				<!-- 목록1개가 list-card -->
				<c:forEach items="${itemList }" var="itemList">
					<div class="list-card"
						onclick="location.href='lost_item_detail_page?total_id=${itemList.total_id }';"
						style="cursor: pointer;">
						<div class="card-photo">
							<img src="${itemList.filename}">
						</div>
						<div class="content-items">
							<div class="item-title">
								<span>${itemList.item_name } </span>
							</div>
							<ul class="item-details">
								<li><span class="detail-title">분실날짜:</span><span>${itemList.lostday }</span></li>
								<li><span class="detail-title">물품분류:</span><span>${itemList.upkind }>${itemList.upr_cd }</span></li>
								<li><span class="detail-title">분실장소:</span><span>${itemList.address }</span></li>
								<li><span class="detail-title">특징:</span><span>${itemList.sepcialmark }</span></li>
							</ul>
						</div>
					</div>
				</c:forEach>

			</div>
			<!-- 검색결과 리스트 프레임 끝 -->
			<!-- 페이징 프레임시작 -->
			<div class="page-container">
				<div class="currentOftotal">
					<span>Page</span>
					<span class="current-page">${pageVo.page}</span>
					<span>of</span><span
						class="total-page">${pageVo.totPage}</span>
				</div>
				<ul class="pagelist-container">
					<li class="btn-prev"><a class="test"
						href="lost_item_search_page?page=${pageVo.page - 1}"><img
							src="resources/img/chevron-left.png" alt=""></a></li>
					<c:forEach begin="${pageVo.pageStart}" end="${pageVo.pageEnd}"
						var="i">
						<c:choose>
							<c:when test="${i eq pageVo.page}">
								<li><a href="#" style="color: #0066ff">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="lost_item_search_page?page=${i}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<li class="btn-next"><a
						href="lost_item_search_page?page=${pageVo.page + 1}"><img
							src="resources/img/chevron-left.png" alt=""></a></li>
				</ul>

				<ul class="switchBtn-container">
					<li class="btn-prev-group"><a
						href="lost_item_search_page?page=${pageVo.page - 1}">Previous</a></li>
					<li class="btn-next-group"><a
						href="lost_item_search_page?page=${pageVo.page + 1}">Next</a></li>
				</ul>
			</div>
			<!-- 페이징 프레임 끝 -->
		</div>
		<!-- result-container끝 -->
	</div>
</body>
<script>
	window.onload = function() {
		// 모델에 담긴 데이터로 셀렉트 박스를 선택하고 onchange 이벤트를 발생시킴
		var selectedMainCategory = "${searchContent.get(3) }";
		var selectedSubCategory = "${searchContent.get(4) }";
		var selectedAddressCode = "${searchContent.get(2) }";
		var selectedColorCd = "${searchContent.get(5) }";
		var prd_mainCategory = document.getElementById("itemkind1");
		var prd_subCategory = document.getElementById("itemkind2");
		var prd_addressCode = document.getElementById("addressCode");
		var prd_colorCd = document.getElementById("colorCd");

		prd_addressCode.value = selectedAddressCode;
		prd_mainCategory.value = selectedMainCategory;
		prd_colorCd.value = selectedColorCd;
		// 서브 카테고리 업데이트 함수 호출
		if (selectedMainCategory !== "" && selectedMainCategory !== null) {
			// 서브 카테고리 업데이트 함수 호출
			getSubCategories(selectedMainCategory);
			// 서브 카테고리 선택
			prd_subCategory.value = selectedSubCategory;
		}
	};
</script>
<script>
		function getSubCategories(mainCategory) {
			var prd_subCategory = document.getElementById("itemkind2");
			switch (mainCategory) {
			case 'PRI000': // 컴퓨터
				itemkind2.innerHTML = '<option value="all">전체검색</option><option value="PRI100">삼성 노트북</option><option value="PRI200">LG노트북</option><option value="PRI300">삼보 노트북</option><option value="PRI400">기타</option><option value="PRI500">HP노트북</option><option value="PRI600">애플 노트북</option>';
				break;
			case 'PRJ000': // 휴대폰
				itemkind2.innerHTML = '<option value="all">전체검색</option><option value="PRJ100">삼성 휴대폰</option><option value="PRJ200">LG휴대폰</option><option value="PRJ300">스카이휴대폰</option><option value="PRJ400">아이폰</option><option value="PRJ500">기타통신기기</option><option value="PRJ600">모토로라 휴대폰</option><option value="PRJ900">기타 휴대폰</option>';
				break;
			case 'PRH000': // 지갑
				itemkind2.innerHTML = '<option value="all">전체검색</option><option value="PRH100">여성용 지갑</option><option value="PRH200">남성용 지갑</option><option value="PRH300">기타 지갑</option>';
				break;
			case 'PRG000': // 전자기기
				itemkind2.innerHTML = '<option value="all">전체검색</option><option value="PRG100">PMP</option><option value="PRG200">MP3</option><option value="PRG300">PDA</option><option value="PRG400">카메라</option><option value="PRG500">전자수첩</option><option value="PRG600">기타용품</option><option value="PRG700">태블릿</option><option value="PRG800">스마트워치</option><option value="PRG900">무선이어폰</option>';
				break;
			case 'PRD000': // 산업용품
				itemkind2.innerHTML = '<option value="all">전체검색</option><option value="PRD100">기타물품</option>';
				break;
			case 'PRO000': // 귀금속
				itemkind2.innerHTML = '<option value="all">전체검색</option><option value="PRO100">반지</option><option value="PRO200">목걸이</option><option value="PRO300">귀걸이</option><option value="PRO400">시계</option><option value="PRO500">기타</option>';
				break;
			case 'PRZ000': // 기타물품
				itemkind2.innerHTML = '<option value="all">전체검색</option><option value="PRZ100">기타</option><option value="PRZ200">매장문화재</option><option value="PRZ600">선글라스</option><option value="PRZ700">안경</option>';
				break;
			case 'PRC000': // 서류
				itemkind2.innerHTML = '<option value="all">전체검색</option><option value="PRC100">서류</option><option value="PRC200">기타물품</option>';
				break;
			case 'PRE000': // 스포츠용품
				itemkind2.innerHTML = '<option value="all">전체검색</option><option value="PRE100">스포츠용품</option><option value="PRE200">수영복</option><option value="PRE300">수영물품</option>';
				break;
			case 'PRF000': // 자동차
				itemkind2.innerHTML = '<option value="all">전체검색</option><option value="PRF100">자동차열쇠</option><option value="PRF200">네비게이션</option><option value="PRF300">자동차번호판</option><option value="PRF400">기타용품</option><option value="PRF500">임시번호판</option>';
				break;
			case 'PRL000': // 현금
				itemkind2.innerHTML = '<option value="all">전체검색</option><option value="PRL100">현금</option><option value="PRL200">수표</option><option value="PRL300">기타</option><option value="PRL400">외화</option>';
				break;
			case 'PRK000': // 의류
				itemkind2.innerHTML = '<option value="all">전체검색</option><option value="PRK100">여성의류</option><option value="PRK200">남성의류</option><option value="PRK300">아기의류</option><option value="PRK400">기타의류</option><option value="PRK500">모자</option><option value="PRK600">신발</option>';
				break;
			case 'PRQ000': // 쇼핑백
				itemkind2.innerHTML = '<option value="all">전체검색</option><option value="PRQ100">쇼핑백</option>';
				break;
			case 'PRR000': // 악기
				itemkind2.innerHTML = '<option value="all">전체검색</option><option value="PRR100">건반악기</option><option value="PRR200">관악기</option><option value="PRR300">타악기</option><option value="PRR400">현악기</option><option value="PRR900">기타악기</option>';
				break;
			case 'PRP000': // 카드
				itemkind2.innerHTML = '<option value="all">전체검색</option><option value="PRP100">신용(체크)카드</option><option value="PRP200">일반카드</option><option value="PRP300">기타카드</option>';
				break;
			case 'PRM000': // 유가증권
				itemkind2.innerHTML = '<option value="all">전체검색</option><option value="PRM100">어음</option><option value="PRM200">상품권</option><option value="PRM300">채권</option><option value="PRM400">기타</option>';
				break;
			case 'PRN000': // 증명서
				itemkind2.innerHTML = '<option value="all">전체검색</option><option value="PRN100">신분증</option><option value="PRN200">면허증</option><option value="PRN300">여권</option><option value="PRN400">기타</option><option value="PRN500">판결문</option>';
				break;
			case 'PRA000': // 가방
				itemkind2.innerHTML = '<option value="all">전체검색</option><option value="PRA100">여성용가방</option><option value="PRA200">남성용가방</option><option value="PRA300">기타가방</option>';
				break;
			case 'PRB000': // 도서용품
				itemkind2.innerHTML = '<option value="all">전체검색</option><option value="PRB100">학습서적</option><option value="PRB200">소설</option><option value="PRB300">컴퓨터서적</option><option value="PRB400">만화책</option><option value="PRB500">기타서적</option>';
				break;
			case 'PRX000': // 유류품
				itemkind2.innerHTML = '<option value="all">전체검색</option><option value="PRX100">유류품</option>';
				break;
			default:
				itemkind2.innerHTML = ''; //초기화
				break;
			}
		}
	</script>
	<script>
		$(document).ready(
				function() {//로드완료시
					var now_utc = Date.now() // 지금 날짜를 밀리초로
					// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
					var timeOff = new Date().getTimezoneOffset() * 60000; // 분단위를 밀리초로 변환
					// new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
					var today = new Date(now_utc - timeOff).toISOString()
							.split("T")[0];
					document.getElementById("searchday1").setAttribute("max",
							today); //선택날짜 최대값 오늘날짜로 제한
					document.getElementById("searchday2").setAttribute("max",
							today); //선택날짜 최대값 오늘날짜로 제한
				});
	</script>