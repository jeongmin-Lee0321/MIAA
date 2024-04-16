<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/main_contents.css" />
<title>실종동물 상세검색</title>
</head>
<body>
      <div class="main-contents">
        <!-- 검색창과 검색결과 -->
		<div class="searchbar-container">
			<form id="search_form" action="missing_ani_search_page">
				<!-- 서치바 셀렉 그룹시작 -->
				<input type="hidden" name="allsearchPage" value="1" />
				<div class="searchbar-select-group">
					<div class="searchbar-title">
						<span>기간</span>
					</div>
					<div class="searchbar-content">
						<input type="date" name="searchday1" id="searchday1"> 
						<span>~</span> 
						<input type="date" name="searchday2" id="searchday2"> 
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
							<select name="addressCode1" id="addressCode1">
								<option value="">전체지역(all)</option>
								<option value="6110000">서울특별시</option>
								<option value="6260000">부산광역시</option>
								<option value="6270000">대구광역시</option>
								<option value="6280000">인천광역시</option>
								<option value="6290000">광주광역시</option>
								<option value="5690000">세종특별자치시</option>
								<option value="6300000">대전광역시</option>
								<option value="6310000">울산광역시</option>
								<option value="6410000">경기도</option>
								<option value="6530000">강원특별자치도</option>
								<option value="6430000">충청북도</option>
								<option value="6440000">충청남도</option>
								<option value="6540000">전북특별자치도</option>
								<option value="6460000">전라남도</option>
								<option value="6470000">경상북도</option>
								<option value="6480000">경상남도</option>
								<option value="6500000">제주특별자치도</option>
							</select>
							<span>-</span>
								<div class="searchbar-select-group">
									<div class="searchbar-content">
										<select name="addressCode2" id="addressCode2">
										</select>
									</div>
								</div>
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
              <span>전체 </span><span class="totalNum">${totalCount }</span><span>건</span>
            </div>
          </div>

          <!-- 검색 결과 리스트프레임 -->
          <div class="result-list">

            <!-- 목록1개가 list-card -->
            <c:forEach items="${animalList }" var="animalList">
            <div class="list-card" style="cursor: pointer;">
              <div class="card-photo">
                <img src="${animalList.filename }" alt="">
              </div>
              <div class="content-items">
                <div class="item-title">
                  <span>${animalList.animal_name }</span>
                </div>
                <ul class="item-details">
                  <li><span class="detail-title">실종날짜:</span><span>${animalList.missingday }</span></li>
                  <li><span class="detail-title">품종분류:</span><span>${animalList.upkind }>${animalList.upr_cd }</span></li>
                  <li><span class="detail-title">분실장소:</span><span>${animalList.address } </span></li>
                  <li><span class="detail-title">특징:</span><span>${animalList.sepcialmark } </span></li>
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
						href="missing_ani_search_page?page=${pageVo.page - 1}"><img
							src="resources/img/chevron-left.png" alt=""></a></li>
					<c:forEach begin="${pageVo.pageStart}" end="${pageVo.pageEnd}"
						var="i">
						<c:choose>
							<c:when test="${i eq pageVo.page}">
								<li><a href="#" style="color: red">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="missing_ani_search_page?page=${i}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<li class="btn-next"><a
						href="missing_ani_search_page?page=${pageVo.page + 1}"><img
							src="resources/img/chevron-left.png" alt=""></a></li>
				</ul>

				<ul class="switchBtn-container">
					<li class="btn-prev-group"><a
						href="missing_ani_search_page?page=${pageVo.page - 1}">Previous</a></li>
					<li class="btn-next-group"><a
						href="missing_ani_search_page?page=${pageVo.page + 1}">Next</a></li>
				</ul>
			</div>
			<!-- 페이징 프레임 끝 -->
        </div>
        <!-- result-container끝 -->
      </div>
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
</body>
</html>
