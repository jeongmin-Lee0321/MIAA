<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="resources/css/mypage_matching_alarm_list_page.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<script type="text/javascript">
		$(function() {
			var chkObj = document.getElementsByName("RowCheck");
			var rowCnt = chkObj.length;

			$("input[name='allCheck']").click(function() {
				var chk_listArr = $("input[name='RowCheck']");
				for (var i = 0; i < chk_listArr.length; i++) {
					chk_listArr[i].checked = this.checked;
				}
			});
			$("input[name='RowCheck']").click(function() {
				if ($("input[name='RowCheck']:checked").length == rowCnt) {
					$("input[name='allCheck']")[0].checked = true;
				} else {
					$("input[name='allCheck']")[0].checked = false;
				}
			});
		});
		function deleteValue() {
			var url = "delete"; // Controller로 보내고자 하는 URL
			var valueArr = new Array();
			var list = $("input[name='RowCheck']");
			for (var i = 0; i < list.length; i++) {
				if (list[i].checked) { //선택되어 있으면 배열에 값을 저장함
					valueArr.push(list[i].value);
				}
			}
			if (valueArr.length == 0) {
				alert("선택된 글이 없습니다.");
			} else {
				var chk = confirm("정말 삭제하시겠습니까?");

				if (chk) {
					$
							.ajax({
								url : url, // 전송 URL
								type : 'POST', // POST 방식
								traditional : true,
								data : {
									valueArr : valueArr
								// 보내고자 하는 data 변수 설정
								},
								success : function(jdata) {
									if (jdata = 1) {

										alert("삭제 성공");
										location
												.replace("mypage_customer_inquiry_list_page") //페이지 새로고침
									} else {
										alert("삭제 실패");
									}
								}
							});
				} else {
					alert("삭제 취소");
				}
			}
		}
	</script>

	<div class="main-body">
		<div class="main-contents">
			<!-- 검색창과 검색결과 -->
			<!-- result-container시작 -->
			<div class="result-container">
				<div class="page_root">내정보 > 내칭 알림 목록(전체목록)</div>
				<div class="border_01">
					<div class="btn-set">
						<button class="view_all_btn"
							onclick="location.href='mypage_matching_alarm_list_page'">View
							all</button>
						<button class="item_btn"
							onclick="location.href='mypage_matching_alarm_item_list_page'">물건</button>
						<button class="ani_btn"
							onclick="location.href='mypage_matching_alarm_ani_list_page'">동물</button>
						<button class="keyword_list_btn"
							onclick="location.href='mypage_matching_alarm_keyword_list_page'">키워드목록</button>
					</div>
					<div class="set_02">
						<select name="select_content" id="select_content">
							<option value="제목+내용">제목+내용</option>
							<option value="제목">제목</option>
							<option value="내용">내용</option>
						</select>


						<div class="search">
							<input class="search_bar" type="text" placeholder="검색어 입력">
							<img class="search_icon"
								src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"
								onclick="alert('hello world!')">
						</div>
						<button class="alarm_delete" onclick="deleteValue();">알림제거</button>
					</div>
				</div>

				<table id="total_lost_item_list_content">
					<!-- <div class="registrationed_alarm_keywords"> -->
					<span>등록된 알림 키워드(${totalCount }개)</span>
					<!-- </div> -->
					<div class="registrationed_alarm_keywords_list">
						<c:forEach items="${list }" var="list" varStatus="status">
							<div class="show_lost_item_info_container">
								<a href="mypage_matching_alarm_detail_list_page"
									class="item_tag_00"> <input type="checkbox"
									class="lost_item_name" id="lost_item_name"
									value="lost_item_name"> ${list.upr_cd} <!-- 소분류 -->
								</a> <a href="$$$" class="item_tag_01">물건</a> <a href="$$$"
									class="item_tag_02">${list.item_name}</a> <a href="$$$"
									class="item_tag_03">${list.lostday}</a>

								<c:set var="upperkind" value="${list.upkind}" />
								<c:choose>
									<c:when test="${upperkind == 'PRB000'}">
										<c:set var="upperkind" value="도서용품" />
									</c:when>
									<c:when test="${upperkind == 'PRC000'}">
										<c:set var="upperkind" value="서류" />
									</c:when>
									<c:when test="${upperkind == 'PRD000'}">
										<c:set var="upperkind" value="산업용품" />
									</c:when>
									<c:when test="${upperkind == 'PRE000'}">
										<c:set var="upperkind" value="스포츠용품" />
									</c:when>
									<c:when test="${upperkind == 'PRF000'}">
										<c:set var="upperkind" value="자동차" />
									</c:when>
									<c:when test="${upperkind == 'PRG000'}">
										<c:set var="upperkind" value="전자기기" />
									</c:when>
									<c:when test="${upperkind == 'PRH000'}">
										<c:set var="upperkind" value="지갑" />
									</c:when>
									<c:when test="${upperkind == 'PRI000'}">
										<c:set var="upperkind" value="컴퓨터" />
									</c:when>
									<c:when test="${upperkind == 'PRJ000'}">
										<c:set var="upperkind" value="휴대폰" />
									</c:when>
									<c:when test="${upperkind == 'PRK000'}">
										<c:set var="upperkind" value="의류" />
									</c:when>
									<c:when test="${upperkind == 'PRL000'}">
										<c:set var="upperkind" value="현금" />
									</c:when>
									<c:when test="${upperkind == 'PRM000'}">
										<c:set var="upperkind" value="유가증권" />
									</c:when>
									<c:when test="${upperkind == 'PRN000'}">
										<c:set var="upperkind" value="증명서" />
									</c:when>
									<c:when test="${upperkind == 'PRO000'}">
										<c:set var="upperkind" value="귀금속" />
									</c:when>
									<c:when test="${upperkind == 'PRP000'}">
										<c:set var="upperkind" value="카드" />
									</c:when>
									<c:when test="${upperkind == 'PRQ000'}">
										<c:set var="upperkind" value="쇼핑백" />
									</c:when>
									<c:when test="${upperkind == 'PRR000'}">
										<c:set var="upperkind" value="악기" />
									</c:when>
									<c:when test="${upperkind == 'PRX000'}">
										<c:set var="upperkind" value="유류품" />
									</c:when>
									<c:when test="${upperkind == 'PRZ000'}">
										<c:set var="upperkind" value="기타물품" />
									</c:when>
								</c:choose>
								<c:set var="lowerkind" value="${list.upr_cd}" />
								<a href="$$$" class="item_tag_04">${upperkind} >
									${lowerkind}</a>
								<%-- <a href="$$$" class="item_tag_04">${list.upkind} > ${list.upr_cd}</a> --%>
								<a href="$$$" class="item_tag_05">${list.address}</a> <a
									href="mypage_matching_alarm_detail_list_page"
									class="show_all_result">모두 보기(49개)</a>
							</div>
							<div class="result-list">
								<!-- 목록1개가 list-card -->
								<c:forEach items="${itemList }" var="itemList">
									<c:choose>
										<c:when test="${list.upr_cd eq itemList.upr_cd }">
											<div class="list-card"
												onclick="location.href='lost_item_detail_page?item_id=${itemList.item_id }';"
												style="cursor: pointer;">
												<div class="card-photo">
													<img src="resources/img/null_img_icon.png" alt="">
												</div>
												<div class="content-items">
													<div class="item-title">
														<span>${itemList.item_name } </span>
													</div>
													<ul class="item-details">
														<li>
															<!-- <span class="detail-title"></span> --> <span>${itemList.lostday }</span>
														</li>
														<li>
															<!-- <span class="detail-title"></span> --> <span>${itemList.address }</span>
														</li>
														<li>
															<!-- <span class="detail-title"></span> --> <span>${upperkind}
																> ${itemList.upr_cd }</span>
														</li>
													</ul>
												</div>
											</div>
										</c:when>
									</c:choose>
								</c:forEach>
							</div>
						</c:forEach>
					</div>
				</table>
			</div>
		</div>
	</div>
</body>
</html>