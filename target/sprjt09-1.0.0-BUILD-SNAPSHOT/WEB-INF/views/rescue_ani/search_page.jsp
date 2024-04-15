<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/main_contents.css" />
	<script src="/resources/js/jquery-3.7.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	// $(document).ready(function (){
	// 	$("SidoSelectBox").onchange(alert("ADSf"));
	// });
	// $("SidoSelectBox").onchange(alert("ADSfddddd"));
	$(document).ready(function (){
		$("SidoSelectBox").onchange(selectedSido(val));
	});
	function selectedSido(val){
		alert(val);
		$.ajax({
			url : "selectedsido",
			type : "post",
			// dataType : "json",
			data : {
				"btn" : id, "btnValue":val
			},
			success : function() {
				alert("성공");
			},
			error: function (){
				alert("실패");
			}
		});
	}
</script>

<title>Insert title here</title>
</head>
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
							type="date" name="" id=""> <span>(접수일기준)</span>
					</div>
				</div>

				<!-- 멀티그룹묶음 -->
				<div class="searchbar-mutil-group">
					<div class="searchbar-select-group">
						<div class="searchbar-title">
							<span>시도</span>
						</div>
						<div class="searchbar-content">
							<select name="" id="SidoSelectBox" onchange="selectedSido(this.value);">
								<c:forEach items="${sidolist }" var="sido">
									<option value="${sido.getOrgdownNm() }">${sido.getOrgdownNm() }</option>
								</c:forEach>
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
					<div class="searchbar-select-group">
						<div class="searchbar-title">
							<span>보호센터</span>
						</div>
						<div class="searchbar-content">
							<select name="" id="">
								<option value="전체">전체</option>
							</select>
						</div>
					</div>
				</div>

				<div class="searchbar-mutil-group">
					<div class="searchbar-select-group">
						<div class="searchbar-title">
							<span>축종 및 품종</span>
						</div>
						<div class="searchbar-content">
							<select name="" id="">
								<option value="전체">전체</option>
							</select> <span>-</span> <select name="" id="">
								<option value="전체">전체</option>
							</select>
						</div>
					</div>
					<div class="searchbar-select-group">
						<div class="searchbar-title">
							<span>성별</span>
						</div>
						<div class="searchbar-content">
							<select name="" id="">
								<option value="전체">수컷</option>
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
							<span>믹스견</span>
						</div>
						<ul class="item-details">
							<li><span class="detail-title">구조날짜:</span><span>2024-03-15</span></li>
							<li><span class="detail-title">공고번호:</span><span>경북-구미-2024-00092</span></li>
							<li><span class="detail-title">성별:</span><span>남성</span></li>
							<li><span class="detail-title">발견날짜:</span><span>삼랑진읍
									천태로 overflow확인 </span></li>
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
</html>