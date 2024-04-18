<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Title</title>
<link rel="stylesheet"
	href="resources/css/mypage_matching_alarm_detail_list_page.css">
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
</head>

<div class="main-body">

	<!-- main -->

	<div class="content-wrapper">
		<div class="content-container">

			<div class="table-caption-wrapper">
				<div class="talbe-caption-container">
					<div class="table-caption">
						<div>
							<span id="item-name-text">분실물명 :</span> <span
								id="item-name-value"><strong>에어팟</strong></span>
						</div>
					</div>
					<div class="table-caption">
						<button class="btn-list" id="btn-write" onclick="#"
							style="cursor: pointer; font-family: inherit;">
							<img src="resources/img/bell-off.png" alt="">알림제거
						</button>
					</div>

				</div>
				<div class="list-control-container">
					<button class="btn-list" id="btn-delete" onclick="#"
						style="cursor: pointer; font-family: inherit;">선택 목록 삭제
					</button>
				</div>

			</div>
			<div class="table-caption-wrapper">
				<div class="talbe-caption-container">
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
					<a href="#">매칭된 게시물 총(49개)&nbsp;&nbsp;</a>
				</div>

			</div>

			<table class="info-table">
				<tr>
					<th><input type="checkbox" name="allCheck" id="allCheck"
						class="table-check-box"></th>
					<th>사진</th>
					<th class="table-title">게시 제목</th>

					<th>습득일자</th>
					<th>보관장소/관리번호</th>
					<th></th>
				</tr>

				<tr>
					<td><input type="checkbox" name="RowCheck" value=""
						class="table-check-box"></td>
					<td><input type="image" src="resources/img/image_no.png"
						id="item-image-value" onclick="" style="cursor: pointer;" /></td>
					<td class="table-title"><a href="#">에어팟 3세대</a></td>
					<td>2018-06-01</td>
					<td>서울은평경찰서
						<p style="color: #A4A4A4;">F2018080900000674</p>
					</td>
					<td><input type="image" src="resources/img/trash_icon.png"
						onclick="" style="cursor: pointer;" /></td>
				</tr>
				<tr>
					<td><input type="checkbox" name="RowCheck" value=""
						class="table-check-box"></td>
					<td><input type="image" src="resources/img/image_no.png"
						id="item-image-value" onclick="" style="cursor: pointer;" /></td>
					<td class="table-title"><a href="#">에어팟 3세대</a></td>
					<td>2018-06-01</td>
					<td>서울은평경찰서
						<p style="color: #A4A4A4;">F2018080900000674</p>
					</td>
					<td><input type="image" src="resources/img/trash_icon.png"
						onclick="" style="cursor: pointer;" /></td>
				</tr>
				<tr>
					<td><input type="checkbox" name="RowCheck" value=""
						class="table-check-box"></td>
					<td><input type="image" src="resources/img/image_no.png"
						id="item-image-value" onclick="" style="cursor: pointer;" /></td>
					<td class="table-title"><a href="#">에어팟 3세대</a></td>
					<td>2018-06-01</td>
					<td>서울은평경찰서
						<p style="color: #A4A4A4;">F2018080900000674</p>
					</td>
					<td><input type="image" src="resources/img/trash_icon.png"
						onclick="" style="cursor: pointer;" /></td>
				</tr>
			</table>
		</div>
	</div>


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

</html>
