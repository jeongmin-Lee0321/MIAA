<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/main_contents.css" />
<title>Insert title here</title>
</head>
<script>
	document.getElementById('prd_mainCategory').addEventListener(
			'change',
			function() {
				var mainCategory = this.value;

				// AJAX 요청을 보내어 해당하는 하위 카테고리를 가져옵니다.
				// 이 부분은 서버에서 해당하는 카테고리의 하위 카테고리를 가져오는 로직으로 대체되어야 합니다.
				// 예를 들어, 서버에 AJAX 요청을 보내고 서버는 해당하는 하위 카테고리를 JSON 형식으로 응답합니다.
				// 그런 다음 응답된 데이터를 기반으로 prd_subCategory의 옵션을 업데이트합니다.
				// 아래 예제는 간단한 예시로 빈 배열을 반환합니다.
				var subCategories = getSubCategories(mainCategory);

				// prd_subCategory 옵션을 업데이트합니다.
				var subCategorySelect = document
						.getElementById('prd_subCategory');
				subCategorySelect.innerHTML = ''; // 기존의 옵션을 지웁니다.
				// 새로운 옵션을 추가합니다.
				subCategories.forEach(function(subCategory) {
					var option = document.createElement('option');
					option.text = subCategory;
					option.value = subCategory;
					subCategorySelect.add(option);
				});
			});

	// AJAX 요청을 보내어 하위 카테고리를 가져오는 함수
	function getSubCategories(mainCategory) {
		switch (mainCategory) {
		case 'PRI000':
			return [ 'LG 노트북', '삼성 노트북', '레노버 노트북' ];
		case 'PRJ000':
			return [ '아이폰', '갤럭시', 'LG 폰', '노키아 폰' ];
		case 'PRH000':
			return [ '남성용 지갑', '여성용 지갑', '어린이용 지갑' ];
		case 'PRG000':
			return [ 'PMP', 'MP3', 'PDA', '카메라', '전자수첩', '기타용품', '태블릿',
					'스마트워치', '무선이어폰' ];
		case 'PRD000':
			return [ '기타물품' ];
		case 'PRO000':
			return [ '반지', '목걸이', '귀걸이', '시계', '기타' ];
		case 'PRZ000':
			return [ '기타', '매장문화재', '선글라스', '안경' ];
		case 'PRC000':
			return [ '서류', '기타물품' ];
		case 'PRE000':
			return [ '스포츠용품', '수영복', '수영물품' ];
		case 'PRF000':
			return [ '자동차열쇠', '네비게이션', '자동차번호판', '기타용품', '임시번호판' ];
		case 'PRL000':
			return [ '현금', '수표', '기타', '외화' ];
		case 'PRK000':
			return [ '여성의류', '남성의류', '아기의류', '기타의류', '모자', '신발' ];
		case 'PRQ000':
			return [ '쇼핑백' ];
		case 'PRR000':
			return [ '건반악기', '관악기', '타악기', '현악기', '기타악기' ];
		case 'PRP000':
			return [ '신용(체크)카드', '일반카드', '기타카드' ];
		case 'PRM000':
			return [ '어음', '상품권', '채권', '기타' ];
		case 'PRN000':
			return [ '신분증', '면허증', '여권', '기타', '판결문' ];
		case 'PRA000':
			return [ '여성용가방', '남성용가방', '기타가방' ];
		case 'PRB000':
			return [ '학습서적', '소설', '컴퓨터서적', '만화책', '기타서적' ];
		case 'PRX000':
			return [ '유류품' ];
		default:
			return [];
		}
	}
</script>
<body>
	<div class="main-contents">
		<!-- 검색창과 검색결과 -->
		<div class="searchbar-container">
			<form action="#">
				<!-- 서치바 셀렉 그룹시작 -->
				<div class="searchbar-select-group">
					<div class="searchbar-title">
						<span>기간</span>
					</div>
					<div class="searchbar-content">
						<input type="date" name="" id=""> <span>~</span> <input
							type="date" name="" id=""> <span>(습득일 기준)</span>
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
							<select name="cityname" id="cityname">
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
					<div class="searchbar-select-group">
						<div class="searchbar-title">
							<span>시군구</span>
						</div>
						<div class="searchbar-content">
							<select name="" id="">
								<option value="구로구">구로구</option>
								<option value="영등포구">영등포구</option>
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
							<select name="prd_mainCategory" id="prd_mainCategory">
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
							</select> <span>-</span> <select name="prd_subCategory"
								id="prd_subCategory">
								<option value="전체">전체</option>
							</select>
						</div>
					</div>
					<div class="searchbar-select-group">
						<div class="searchbar-title">
							<span>색상</span>
						</div>
						<div class="searchbar-content">
							<select name="" id="">
								<option value="전체">검정</option>
							</select>
						</div>
					</div>
				</div>

				<div class="searchbar-select-group">
					<div class="searchbar-title">
						<span>습득물명</span>
					</div>
					<div class="searchbar-content">
						<input type="search" name="q" id="q" style="min-width: 300px;">
					</div>
				</div>

				<!-- form 조회용 버튼 -->
				<div class="search-btn-block">
					<button>
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
					<span>전체 </span><span class="totalNum">223</span><span>건</span>
				</div>
			</div>

			<!-- 검색 결과 리스트프레임 -->
			<div class="result-list">

				<!-- 목록1개가 list-card -->
				<div class="list-card">
					<div class="card-photo">
						<img src="resources/img/null_img_icon.png" alt="">
					</div>
					<div class="content-items">
						<div class="item-title">
							<span>남성용 반지갑 </span>
						</div>
						<ul class="item-details">
							<li><span>F2018080900000674</span></li>
							<li><span class="detail-title">물품분류:</span><span>지갑>기타지갑</span></li>
							<li><span class="detail-title">보관장소:</span><span>서울
									은평 경찰서 </span></li>
							<li><span class="detail-title">습득날짜:</span><span>2024-03-15
							</span></li>
						</ul>
					</div>
				</div>

			</div>
			<!-- 검색결과 리스트 프레임 끝 -->
			<!-- 페이징 프레임시작 -->
			<div class="page-container">
				<div class="currentOftotal">
					<span>Page</span><span class="current-page">1</span><span>of</span><span
						class="total-page">10</span>
				</div>
				<ul class="pagelist-container">
					<li class="btn-prev"><a class="test" href="#"><img
							src="resources/img/chevron-left.png" alt=""></a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">6</a></li>
					<li><a href="#">7</a></li>
					<li><a href="#">8</a></li>
					<li><a href="#">9</a></li>
					<li><a href="#">10</a></li>
					<li class="btn-next"><a href="#"><img
							src="resources/img/chevron-left.png" alt=""></a></li>
				</ul>

				<ul class="switchBtn-container">
					<li class="btn-prev-group"><a href="#">Previous</a></li>
					<li class="btn-next-group"><a href="#">Next</a></li>
				</ul>
			</div>
			<!-- 페이징 프레임 끝 -->
		</div>
		<!-- result-container끝 -->
	</div>
</body>