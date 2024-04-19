<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Title</title>
<link rel="stylesheet"
	href="resources/css/mypage_matching_alarm_list_page.css">
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
</head>
<body>
	<div class="main-body">
		<div class="main-contents">

			<!-- main -->

			<!-- 검색창과 검색결과 -->

			<div class="searchbar-container">
				<!-- <form action=""> -->
				<div class="searchbar-select-group">
					<div style="display: flex;">
						<button class="btn-list" id="btn-search-all"
							onclick="location.href='mypage_matching_alarm_list_page'"
							style="cursor: pointer;">전체보기</button>
						<button class="btn-list" id="btn-search-item"
							onclick="location.href='mypage_matching_alarm_item_list_page'"
							style="cursor: pointer;">물건</button>
						<button class="btn-list" id="btn-search-ani"
							onclick="location.href='mypage_matching_alarm_ani_list_page'"
							style="cursor: pointer;">동물</button>
						<button class="btn-list" id="btn-search-key"
							onclick="location.href='mypage_matching_alarm_keyword_list_page'"
							style="cursor: pointer;">키워드목록</button>
					</div>
					<div style="display: flex;">
						<div class="searchbar-content">
							<select id="reply_status" style="border: 1px solid #D8D8D8;">
								<option>제목+내용</option>
								<option>제목</option>
								<option>내용</option>
							</select>
						</div>
						<div class="searchbar-content">
							<input type="text"
								style="border: 1px solid #D8D8D8; width: 334px;"
								placeholder="Search">
						</div>
						<button class="btn-list" id="btn-search-alarm" onclick="#"
							style="cursor: pointer;">
							<img src="resources/img/bell-off.png" alt="">알림제거
						</button>
						<button class="btn-list" id="btn-search" onclick="#"
							style="cursor: pointer;">
							조회<img src="resources/img/search.png" alt="">
						</button>
					</div>

				</div>
				<!-- </form> -->



			</div>

			<!-- 검색창과 검색결과 끝 -->

			<div class="result-totnum-container">
				<span>등록된 알림 키워드(5개)</span>
			</div>
			<!--           </div> -->
			<!-- 검색결과 리스트 프레임 끝 -->
			<!--등록게시물 키워드 시작 1  -->
			<div class="content-wrapper">
				<div class="talbe-caption-container">
					<div class="table-caption-item">
						<div style="display: flex;">
							<input type="checkbox" class="table-check-box" /> &nbsp; <span
								id="item-name-text">분실물명 :</span> <span id="item-name-value"><strong>&nbsp;에어팟</strong></span>
						</div>

					</div>
					<div class="table-caption">
						<div class="registrationed_alarm_keywords_list">
							<span class="item_tag_01">물건</span> <span class="item_tag_02">에어팟</span>
							<span class="item_tag_03">2024-03-01시경</span> <span
								class="item_tag_04">전자기기 > 무선이어폰</span> <span
								class="item_tag_05">월게,이마트,트레이더스</span>
						</div>
					</div>
				</div>
				<div class="list-control-container">
					<a href="#">모두 보기(49개)</a>
				</div>
			</div>


			<!-- 검색 결과 리스트프레임 -->
			<div class="result-list">
				<!-- 목록1개가 list-card -->
				<div class="list-card" style="cursor: pointer">
					<div class="card-photo">
						<img src="resources/img/image_no.png" alt="">
					</div>
					<div class="content-items">
						<div class="item-title">
							<span>dgdgsd</span>
						</div>
						<ul class="item-details">
							<li><span class="detail-title">구조날짜:</span><span>sgsdg</span></li>
							<li><span class="detail-title">공고번호:</span><span>gdss</span></li>
							<li><span class="detail-title">성별:</span><span>dsg</span></li>
							<li><span class="detail-title">발견장소:</span><span>sdgsw</span></li>
						</ul>
					</div>
				</div>
				<!-- list-card 1개 끝 -->
			</div>
			<!-- 검색 결과 리스트프레임 끝-->

			<!-- page -->

			<div class="result-container">
				<div class="page-container">
					<div class="currentOftotal">
						<span>Page</span><span class="current-page">1</span><span>of</span><span
							class="total-page">1</span>
					</div>
					<ul class="pagelist-container">
						<li class="btn-prev"><a href="javascript:void(0);"
							onclick="goToPage(${pageVo.page}-1)"><img
								src="resources/img/chevron-left.png" alt=""></a></li>
						<c:forEach begin="${pageVo.pageStart}" end="${pageVo.pageEnd}"
							var="i">
							<c:choose>
								<c:when test="${i eq pageVo.page}">
									<li><span class="currpage">${i}</span></li>
								</c:when>
								<c:otherwise>
									<li><a href="javascript:void(0);" onclick="goToPage(${i})">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<li class="btn-next"><a href="javascript:void(0);"
							onclick="goToPage(${pageVo.page}+1)"><img
								src="resources/img/chevron-left.png" alt=""></a></li>
					</ul>

					<ul class="switchBtn-container">
						<li class="btn-prev-group"><a href="javascript:void(0);"
							onclick="goToPage(${pageVo.page}-10)">Previous</a></li>
						<li class="btn-next-group"><a href="javascript:void(0);"
							onclick="goToPage(${pageVo.page}+10)">Next</a></li>
					</ul>
				</div>
			</div>


		</div>
	</div>
</body>


</html>
