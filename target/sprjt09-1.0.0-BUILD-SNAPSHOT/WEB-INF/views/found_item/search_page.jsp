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
	function getSubCategories(mainCategory) {
		var prd_subCategory = document.getElementById("prd_subCategory");
		switch (mainCategory) {
		case 'PRI000': // 컴퓨터
			prd_subCategory.innerHTML = '<option value="삼성 노트북">삼성 노트북</option><option value="LG 노트북">LG 노트북</option><option value="삼보 노트북">삼보 노트북</option><option value="기타">기타</option><option value="HP 노트북">HP 노트북</option><option value="애플 노트북">애플 노트북</option>';
			break;
		case 'PRJ000': // 휴대폰
			prd_subCategory.innerHTML = '<option value="삼성 휴대폰">삼성 휴대폰</option><option value="LG 휴대폰">LG 휴대폰</option><option value="스카이 휴대폰">스카이 휴대폰</option><option value="아이폰">아이폰</option><option value="기타 통신기기">기타 통신기기</option><option value="모토로라 휴대폰">모토로라 휴대폰</option><option value="기타 휴대폰">기타 휴대폰</option>';
			break;
		case 'PRH000': // 지갑
			prd_subCategory.innerHTML = '<option value="남성용 지갑">남성용 지갑</option><option value="여성용 지갑">여성용 지갑</option><option value="어린이용 지갑">어린이용 지갑</option>';
			break;
		case 'PRG000': // 전자기기
			prd_subCategory.innerHTML = '<option value="PMP">PMP</option><option value="MP3">MP3</option><option value="PDA">PDA</option><option value="카메라">카메라</option><option value="전자수첩">전자수첩</option><option value="기타용품">기타용품</option><option value="태블릿">태블릿</option><option value="스마트워치">스마트워치</option><option value="무선이어폰">무선이어폰</option>';
			break;
		case 'PRD000': // 산업용품
			prd_subCategory.innerHTML = '<option value="기타물품">기타물품</option>';
			break;
		case 'PRO000': // 귀금속
			prd_subCategory.innerHTML = '<option value="반지">반지</option><option value="목걸이">목걸이</option><option value="귀걸이">귀걸이</option><option value="시계">시계</option><option value="기타">기타</option>';
			break;
		case 'PRZ000': // 기타물품
			prd_subCategory.innerHTML = '<option value="기타">기타</option><option value="매장문화재">매장문화재</option><option value="선글라스">선글라스</option><option value="안경">안경</option>';
			break;
		case 'PRC000': // 서류
			prd_subCategory.innerHTML = '<option value="서류">서류</option><option value="기타물품">기타물품</option>';
			break;
		case 'PRE000': // 스포츠용품
			prd_subCategory.innerHTML = '<option value="스포츠용품">스포츠용품</option><option value="수영복">수영복</option><option value="수영물품">수영물품</option>';
			break;
		case 'PRF000': // 자동차
			prd_subCategory.innerHTML = '<option value="자동차열쇠">자동차열쇠</option><option value="네비게이션">네비게이션</option><option value="자동차번호판">자동차번호판</option><option value="기타용품">기타용품</option><option value="임시번호판">임시번호판</option>';
			break;
		case 'PRL000': // 현금
			prd_subCategory.innerHTML = '<option value="현금">현금</option><option value="수표">수표</option><option value="기타">기타</option><option value="외화">외화</option>';
			break;
		case 'PRK000': // 의류
			prd_subCategory.innerHTML = '<option value="여성의류">여성의류</option><option value="남성의류">남성의류</option><option value="아기의류">아기의류</option><option value="기타의류">기타의류</option><option value="모자">모자</option><option value="신발">신발</option>';
			break;
		case 'PRQ000': // 쇼핑백
			prd_subCategory.innerHTML = '<option value="쇼핑백">쇼핑백</option>';
			break;
		case 'PRR000': // 악기
			prd_subCategory.innerHTML = '<option value="건반악기">건반악기</option><option value="관악기">관악기</option><option value="타악기">타악기</option><option value="현악기">현악기</option><option value="기타악기">기타악기</option>';
			break;
		case 'PRP000': // 카드
			prd_subCategory.innerHTML = '<option value="신용(체크)카드">신용(체크)카드</option><option value="일반카드">일반카드</option><option value="기타카드">기타카드</option>';
			break;
		case 'PRM000': // 유가증권
			prd_subCategory.innerHTML = '<option value="어음">어음</option><option value="상품권">상품권</option><option value="채권">채권</option><option value="기타">기타</option>';
			break;
		case 'PRN000': // 증명서
			prd_subCategory.innerHTML = '<option value="신분증">신분증</option><option value="면허증">면허증</option><option value="여권">여권</option><option value="기타">기타</option><option value="판결문">판결문</option>';
			break;
		case 'PRA000': // 가방
			prd_subCategory.innerHTML = '<option value="여성용가방">여성용가방</option><option value="남성용가방">남성용가방</option><option value="기타가방">기타가방</option>';
			break;
		case 'PRB000': // 도서용품
			prd_subCategory.innerHTML = '<option value="학습서적">학습서적</option><option value="소설">소설</option><option value="컴퓨터서적">컴퓨터서적</option><option value="만화책">만화책</option><option value="기타서적">기타서적</option>';
			break;
		case 'PRX000': // 유류품
			prd_subCategory.innerHTML = '<option value="유류품">유류품</option>';
			break;
		default:
			prd_subCategory.innerHTML = ''; //초기화
			break;
		}
	}

	function updateCity2() {
		var cityname = document.getElementById("cityname").value;
		var cityname2 = document.getElementById("cityname2");

		switch (cityname) {
		case "LCA000": // 서울특별시
			cityname2.innerHTML = '<option value="LCA001">강남구</option><option value="LCA002">강동구</option><option value="LCA003">강복구</option><option value="LCA004">강서구</option><option value="LCA005">관악구</option><option value="LCA006">광진구</option><option value="LCA007">구로구</option><option value="LCA008">금천구</option><option value="LCA009">노원구</option><option value="LCA010">도봉구</option><option value="LCA011">동대문구</option><option value="LCA012">마포구</option><option value="LCA013">서대문구</option><option value="LCA014">서초구</option><option value="LCA015">성동구</option><option value="LCA016">성복구</option><option value="LCA017">송파구</option><option value="LCA018">양천구</option><option value="LCA019">영등포구</option><option value="LCA020">용산구</option><option value="LCA021">은평구</option><option value="LCA022">종로구</option><option value="LCA023">중구</option><option value="LCA024">중랑구</option>';
			break;
		case "LCT000": // 부산광역시
			cityname2.innerHTML = '<option value="LCT001">강서구</option><option value="LCT002">금정구</option><option value="LCT003">기장군</option><option value="LCT004">남구</option><option value="LCT005">동구</option><option value="LCT006">동래구</option><option value="LCT007">부산진구</option><option value="LCT008">북구</option><option value="LCT009">사상구</option><option value="LCT010">사하구</option><option value="LCT011">서구</option><option value="LCT012">수영구</option><option value="LCT013">연제구</option><option value="LCT014">영도구</option><option value="LCT015">중구</option><option value="LCT016">해운대구</option>';
			break;
		case "LCI000": // 경기도
			cityname2.innerHTML = '<option value="LCI001">가평군</option><option value="LCI002">고양시 덕양구</option><option value="LCI003">고양시 일산동구</option><option value="LCI004">고양시 일산서구</option><option value="LCI005">과천시</option><option value="LCI006">광명시</option><option value="LCI007">광주시</option><option value="LCI008">구리시</option><option value="LCI009">군포시</option><option value="LCI010">김포시</option><option value="LCI011">남양주시</option><option value="LCI012">동두천시</option><option value="LCI013">부천시</option><option value="LCI014">성남시</option><option value="LCI015">수원시</option><option value="LCI016">시흥시</option><option value="LCI017">안산시</option><option value="LCI018">안성시</option><option value="LCI019">안양시</option><option value="LCI020">양주시</option><option value="LCI021">양평군</option><option value="LCI022">여주군</option><option value="LCI023">연천군</option><option value="LCI024">오산시</option><option value="LCI025">용인시</option><option value="LCI026">의왕시</option><option value="LCI027">의정부시</option><option value="LCI028">이천시</option><option value="LCI029">파주시</option><option value="LCI030">평택시</option><option value="LCI031">포천시</option><option value="LCI032">하남시</option><option value="LCI033">화성시</option>';
			break;
		case "LCJ000": // 경상남도
			cityname2.innerHTML = '<option value="LCJ001">거제시</option><option value="LCJ002">거창군</option><option value="LCJ003">고성군</option><option value="LCJ004">김해시</option><option value="LCJ005">남해군</option><option value="LCJ006">밀양시</option><option value="LCJ007">사천시</option><option value="LCJ008">산청군</option><option value="LCJ009">양산시</option><option value="LCJ010">의령군</option><option value="LCJ011">진주시</option><option value="LCJ012">창녕군</option><option value="LCJ013">창원시</option><option value="LCJ014">통영시</option><option value="LCJ015">하동군</option><option value="LCJ016">함안군</option><option value="LCJ017">함양군</option><option value="LCJ018">합천군</option>';
			break;
		case "LCH000": // 강원도
			cityname2.innerHTML = '<option value="LCH001">강릉시</option><option value="LCH002">고성군</option><option value="LCH003">동해시</option><option value="LCH004">삼척시</option><option value="LCH005">속초시</option><option value="LCH006">양구군</option><option value="LCH007">양양군</option><option value="LCH008">영월군</option><option value="LCH009">원주시</option><option value="LCH010">인제군</option><option value="LCH011">정선군</option><option value="LCH012">철원군</option><option value="LCH013">춘천시</option><option value="LCH014">태백시</option><option value="LCH015">평창군</option><option value="LCH016">홍천군</option><option value="LCH017">화천군</option><option value="LCH018">횡성군</option>';
			break;
		case "LCW000": // 세종특별자치시
			cityname2.innerHTML = '<option value="LCW001">소정면</option><option value="LCW002">전의면</option><option value="LCW003">연서면</option><option value="LCW004">연기면</option><option value="LCW005">한솔동</option><option value="LCW006">장군면</option><option value="LCW007">전동면</option><option value="LCW008">조치원읍</option><option value="LCW009">연동면</option><option value="LCW010">부강면</option><option value="LCW011">금남면</option><option value="LCW012">도담동</option>';
			break;

		case "LCK000": // 경상북도
			cityname2.innerHTML = '<option value="LCK001">경산시</option><option value="LCK002">경주시</option><option value="LCK003">고령군</option><option value="LCK004">구미시</option><option value="LCK005">군위군</option><option value="LCK006">김천시</option><option value="LCK007">문경시</option><option value="LCK008">봉화군</option><option value="LCK009">상주시</option><option value="LCK010">성주군</option><option value="LCK011">안동시</option><option value="LCK012">영덕군</option><option value="LCK013">영양군</option><option value="LCK014">영주시</option><option value="LCK015">영천시</option><option value="LCK016">예천군</option><option value="LCK017">울릉군</option><option value="LCK018">울진군</option><option value="LCK019">의성군</option><option value="LCK020">청도군</option><option value="LCK021">청송군</option><option value="LCK022">칠곡군</option>';
			break;

		case "LCQ000": // 광주광역시
			cityname2.innerHTML = '<option value="LCQ001">광산구</option><option value="LCQ002">남구</option><option value="LCQ003">동구</option><option value="LCQ004">북구</option><option value="LCQ005">서구</option>';
			break;

		case "LCR000": // 대구광역시
			cityname2.innerHTML = '<option value="LCR001">남구</option><option value="LCR002">달서구</option><option value="LCR003">달성군</option><option value="LCR004">동구</option><option value="LCR005">북구</option><option value="LCR006">서구</option><option value="LCR007">수성구</option><option value="LCR008">중구</option>';
			break;

		case "LCS000": // 대전광역시
			cityname2.innerHTML = '<option value="LCS001">대덕구</option><option value="LCS002">동구</option><option value="LCS003">서구</option><option value="LCS004">유성구</option><option value="LCS005">중구</option>';
			break;

		case "LCU000": // 울산광역시
			cityname2.innerHTML = '<option value="LCU001">남구</option><option value="LCU002">동구</option><option value="LCU003">북구</option><option value="LCU004">울주군</option><option value="LCU005">중구</option>';
			break;

		case "LCV000": // 인천광역시
			cityname2.innerHTML = '<option value="LCV001">강화군</option><option value="LCV002">계양구</option><option value="LCV003">남구</option><option value="LCV004">남동구</option><option value="LCV005">동구</option><option value="LCV006">부평구</option><option value="LCV007">서구</option><option value="LCV008">연수구</option><option value="LCV009">옹진구</option><option value="LCV010">중구</option>';
			break;

		case "LCL000": // 전라남도
			cityname2.innerHTML = '<option value="LCL001">강진구</option><option value="LCL002">고흥군</option><option value="LCL003">곡성군</option><option value="LCL004">광양시</option><option value="LCL005">구례군</option><option value="LCL006">나주시</option><option value="LCL007">담양군</option><option value="LCL008">목포시</option><option value="LCL009">무안군</option><option value="LCL010">보성군</option><option value="LCL011">순천시</option><option value="LCL012">신안군</option><option value="LCL013">여수시</option><option value="LCL014">영광군</option><option value="LCL015">영암군</option><option value="LCL016">완도군</option><option value="LCL017">장성군</option><option value="LCL018">장흥군</option><option value="LCL019">진도군</option><option value="LCL020">함평군</option><option value="LCL021">해남군</option><option value="LCL022">화수군</option>';
			break;

		case "LCM000": // 전라북도
			cityname2.innerHTML = '<option value="LCM001">고창군</option><option value="LCM002">군산시</option><option value="LCM003">김제시</option><option value="LCM004">남원시</option><option value="LCM005">무주군</option><option value="LCM006">부안군</option><option value="LCM007">순창군</option><option value="LCM008">완주군</option><option value="LCM009">익산시</option><option value="LCM010">임실군</option><option value="LCM011">장수군</option><option value="LCM012">전주시 덕진구</option>';
			break;

		case "LCN000": // 충청남도
			cityname2.innerHTML = '<option value="LCN001">계룡시</option><option value="LCN002">공주시</option><option value="LCN003">금산시</option><option value="LCN004">논산시</option><option value="LCN005">당진군</option><option value="LCN006">보령시</option><option value="LCN007">부여군</option><option value="LCN008">서산시</option><option value="LCN009">서천군</option><option value="LCN010">아산시</option><option value="LCN011">연기군</option><option value="LCN012">예산군</option><option value="LCN013">천안시 동남구</option><option value="LCN014">천안시 서북구</option>';
			break;

		case "LCO000": // 충청북도
			cityname2.innerHTML = '<option value="LCO001">괴산군</option><option value="LCO002">단양군</option><option value="LCO003">보은군</option><option value="LCO004">영동군</option><option value="LCO005">옥천군</option><option value="LCO006">음성군</option><option value="LCO007">제천시</option><option value="LCO008">증평군</option><option value="LCO009">진천군</option><option value="LCO010">청원군</option><option value="LCO011">청주시 상당구</option><option value="LCO012">청주시 흥덕구</option><option value="LCO013">충주시</option>';
			break;

		case "LCP000": // 제주특별자치도
			cityname2.innerHTML = '<option value="LCP001">서귀포시</option><option value="LCP002">제주시</option>';
			break;
		case "LCF000": // 해외
			cityname2.innerHTML = '<option value="LCF000">해외시</option>';
			break;
		default:
			cityname2.innerHTML = ''; //초기화
			break;
		}
	}
</script>
<body>
	<div class="main-contents">
		<!-- 검색창과 검색결과 -->
		<div class="searchbar-container">
			<form action="found_item_search1">
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
							<select name="cityname" id="cityname" onchange="updateCity2()">
								<option value="">--도시를선택해주세요--</option>
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
							<select name="cityname2" id="cityname2">
								<option value="">--시도를먼저선택해주세요--</option>
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
							<select name="prd_mainCategory" id="prd_mainCategory"
								onchange="getSubCategories(this.value)">
								<option value="">--분류를선택해주세요--</option>
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
				<c:forEach items="${list }" var="dto">
				<div class="list-card">
					<div class="card-photo">
						<img src="${dto.fdFilePathImg}" alt="">
					</div>
					<div class="content-items">
						<div class="item-title">
							<span>$"dto.fdPrdtNm"</span>
						</div>
						<ul class="item-details">
							<li><span>${dto.atcid}</span></li>
							<li><span class="detail-title">물품분류:</span><span>${dto.prdtClNm}</span></li>
							<li><span class="detail-title">보관장소:</span><span>${dto.depPlace} </span></li>
							<li><span class="detail-title">습득날짜:</span><span>${dto.fdYmd}</span></li>
						</ul>
					</div>
				</div>
				</c:forEach>
				

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