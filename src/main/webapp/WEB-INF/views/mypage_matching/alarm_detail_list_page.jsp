<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Title</title>
<link rel="stylesheet"
	href="resources/css/mypage_matching_alarm_detail_list_page.css">
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<!-- 원진호_0410_선택삭제기능추가 -->
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
				$.ajax({
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
</head>
<div class="main-body">
	<div class="page_root">내정보 > 내칭 알림 목록 > 매칭 알람(상세목록)</div>
	<div class="content-selection">
		<div class="content-container">
			<div class="list-control-container">
				<span id="item-name-text">분실물명 :</span> <span id="item-name-value">에어팟</span>
				<button class="btn-list" id="btn-off-alert">
					<img src="resources/img/bell-off.png" alt=""> 알림제거
				</button>
				<button class="btn-list" id="btn-delete" onclick="deleteValue();"
					style="cursor: pointer;">선택 목록 삭제</button>
			</div>
			<div class="registrationed_alarm_keywords_list">
				<a href="$$$" class="item_tag_01">물건</a> <a href="$$$"
					class="item_tag_02">에어팟</a> <a href="$$$" class="item_tag_03">2024-03-01</a>
				<a href="$$$" class="item_tag_04">전자기기 > 무선이어폰</a> <a href="$$$"
					class="item_tag_05">월게,이마트,트레이더스</a> <a href="$$$"
					class="show_all_result">매칭된 게시물 총(${totalCount }개)</a>
			</div>

			<table class="info-table">
				<tr>
					<th class="table-check"><input type="checkbox" name="" id=""
						class="table-check-box"></th>
					<th class="table-img">사진</th>
					<th class="table-title">게시 제목</th>
					<th class="table-happen-dt">사건일자</th>
					<th class="table-happen-place">보관장소/관리번호</th>
					<th class="table-ctrl"></th>
				</tr>

				<c:forEach items="${list}" var="list">
					<tr>
						<td class="table-check"><input type="checkbox" name="" id=""
							class="table-check-box"></td>
						<td class="table-img"><img src="resources/img/image_no.png"
							alt="" class="item-image"></td>
						<td class="table-title">${list.item_name }</td>
						<td class="table-happen-dt">${list.lostday }</td>
						<td class="table-happen-place"><span
							class="happen-place-value">${lost.address }</span> <span
							class="admin-value">F12391273091724081270</span></td>
						<td class="table-ctrl"><img
							src="resources/img/trash_icon.png" alt="" class="ctrl-icon">
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>

	<div class="result-container">
		<div class="page-container">
			<div class="currentOftotal">
				<span>Page</span><span class="current-page">1</span><span>of</span><span
					class="total-page">10</span>
			</div>
			<ul class="pagelist-container">
				<li class="btn-prev"><a class="test" href="#"><img
						src="resources/img/chevron-right.png" alt=""></a></li>
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
	</div>

</div>
</html>
