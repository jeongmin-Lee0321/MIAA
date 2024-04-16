<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Title</title>
<link rel="stylesheet"
	href="resources/css/mypage_matching_alarm_keyword_list_page.css" />
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
</head>
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
		/*weonjinho_0412*/
		var url = "mypage_alarm_delete"; // Controller로 보내고자 하는 URL
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
<body>
	<div class="main-body">
		<!-- main -->
		<!-- 원진호_0408_버튼&검색창 추가.  -->
		<div class="page_root">내정보 > 내칭 알림 목록 > 매칭 알람(키워드목록)</div>
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
				<button class="alarm_delete" onclick="deleteValue();">
					<img class="alarm_off" src="./resources/img/bell-off.png"> <span>알림제거</span>
				</button>
			</div>
		</div>
		<!-- 원진호_0408_버튼&검색창 추가.끝  -->
		<div class="registrationed_alarm_keywords">
			<span>등록된 알림 키워드(${totalCount }개)</span>
		</div>

		<div class="content-wrapper">
			<div class="content-container">
				<div class="list-control-container">
					<button class="btn-list" id="btn-write" onclick="deleteValue();"
						style="cursor: pointer;">해당 알림제거</button>
					<button class="btn-list" id="btn-delete" onclick="deleteValue();"
						style="cursor: pointer;">원글삭제</button>
				</div>
				<table class="info-table">
					<tr>
						<th><input type="checkbox" name="allCheck" id="allCheck"
							class="table-check-box"></th>
						<th class="table-title">
							<div class="show_item_list_title">게시 제목</div>
						</th>
						<th></th>
					</tr>
					<c:forEach items="${list}" var="list">

						<tr>
							<td><input type="checkbox" name="RowCheck"
								value="${list.item_id}" class="table-check-box"></td>
							<td class="table-title">
								<div class="show_item_name">${list.item_name}
									<br />
								</div>
								<div class="show_item_info">
									<span class="item_tag_01">물건</span> <span class="item_tag_02">${list.item_name}</span>
									<span class="item_tag_03">${list.lostday}</span>
									<c:set var="upperkind" value="${list.upkind}" />
									<!-- 소분류코드 한글전환 -->
									<c:set var="lowerkind" value="${list.upr_cd}" />
									<c:choose>
										<c:when test="${lowerkind == 'PRI100'}">
											<c:set var="lowerkind" value="삼성노트북" />
										</c:when>
										<c:when test="${lowerkind == 'PRI200'}">
											<c:set var="lowerkind" value="LG노트북" />
										</c:when>
										<c:when test="${lowerkind == 'PRI300'}">
											<c:set var="lowerkind" value="삼보노트북" />
										</c:when>
										<c:when test="${lowerkind == 'PRI400'}">
											<c:set var="lowerkind" value="기타" />
										</c:when>
										<c:when test="${lowerkind == 'PRI500'}">
											<c:set var="lowerkind" value="HP노트북" />
										</c:when>
										<c:when test="${lowerkind == 'PRI600'}">
											<c:set var="lowerkind" value="애플노트북" />
										</c:when>
										<c:when test="${lowerkind == 'PRJ100'}">
											<c:set var="lowerkind" value="삼성휴대폰" />
										</c:when>
										<c:when test="${lowerkind == 'PRJ200'}">
											<c:set var="lowerkind" value="LG휴대폰" />
										</c:when>
										<c:when test="${lowerkind == 'PRJ300'}">
											<c:set var="lowerkind" value="스카이휴대폰" />
										</c:when>
										<c:when test="${lowerkind == 'PRJ400'}">
											<c:set var="lowerkind" value="아이폰" />
										</c:when>
										<c:when test="${lowerkind == 'PRJ500'}">
											<c:set var="lowerkind" value="기타통신기기" />
										</c:when>
										<c:when test="${lowerkind == 'PRJ600'}">
											<c:set var="lowerkind" value="모토로라휴대폰" />
										</c:when>
										<c:when test="${lowerkind == 'PRJ900'}">
											<c:set var="lowerkind" value="기타휴대폰" />
										</c:when>
										<c:when test="${lowerkind == 'PRH100'}">
											<c:set var="lowerkind" value="여성용지갑" />
										</c:when>
										<c:when test="${lowerkind == 'PRH200'}">
											<c:set var="lowerkind" value="남성용지갑" />
										</c:when>
										<c:when test="${lowerkind == 'PRH300'}">
											<c:set var="lowerkind" value="기타지갑" />
										</c:when>
										<c:when test="${lowerkind == 'PRG100'}">
											<c:set var="lowerkind" value="PMP" />
										</c:when>
										<c:when test="${lowerkind == 'PRG200'}">
											<c:set var="lowerkind" value="MP3" />
										</c:when>
										<c:when test="${lowerkind == 'PRG300'}">
											<c:set var="lowerkind" value="PDA" />
										</c:when>
									</c:choose>

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
									<span class="item_tag_04">${upperkind}>${lowerkind}</span> <span
										class="item_tag_05">${list.address}</span>
								</div>
							</td>
							<td>
								<button id="trash_can_icon" onclick="deleteValue();">
									<input type="image" src="resources/img/trash_icon.png" name=""
										style="cursor: pointer;" />
								</button>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<!-- page -->
		<div class="result-container">
			<!-- 페이징 프레임시작 -->
			<div class="page-container">
				<div class="currentOftotal">
					<span>Page</span><span class="current-page">${pageVO.page}</span><span>of</span><span
						class="total-page">${pageVO.totPage}</span>
				</div>
				<ul class="pagelist-container">
					<li class="btn-prev"><a class="test"
						href="mypage_customer_inquiry_list_page?page=${pageVO.page - 1}"><img
							src="resources/img/chevron-left.png" alt=""></a></li>
					<c:forEach begin="${pageVO.pageStart}" end="${pageVO.pageEnd}"
						var="i">
						<c:choose>
							<c:when test="${i eq pageVO.page}">
								<li><a href="#" style="color: red">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="mypage_customer_inquiry_list_page?page=${i}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<li class="btn-next"><a
						href="mypage_customer_inquiry_list_page?page=${pageVO.page + 1}"><img
							src="resources/img/chevron-left.png" alt=""></a></li>
				</ul>

				<ul class="switchBtn-container">
					<li class="btn-prev-group"><a
						href="mypage_customer_inquiry_list_page?page=${pageVO.page - 1}">Previous</a></li>
					<li class="btn-next-group"><a
						href="mypage_customer_inquiry_list_page?page=${pageVO.page + 1}">Next</a></li>
				</ul>
			</div>
			<!-- 페이징 프레임 끝 -->
		</div>
	</div>
</body>
</html>