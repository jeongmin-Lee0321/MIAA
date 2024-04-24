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
<script>
function goToPage(total_id,page) {
	let currentPage = ${pagevo.page};
	let totalPage = ${pagevo.totPage};
	if(page<1){
		page=1;
	}else if(page>totalPage){
		page=totalPage;
	}
	let url = "mypage_matching_alarm_detail_list_page?total_id="+total_id+"&page="+page;
    window.location.href = url;
}

function goToDetailPage(atcid,fdSn) {
	let url = "mypage_matching_item_detail?atcid="+atcid+"&fdSn="+fdSn;
    window.location.href = url;
}

</script>



<body>
	<div class="main-body">

		<!-- main -->
		<c:if test="${not empty dto.item_dto}">
			<div class="content-wrapper">
				<div class="content-container">

					<div class="table-caption-wrapper">
						<div class="talbe-caption-container">
							<div class="table-caption">
								<div>
									<span id="item-name-text">분실물명 :</span> <span
										id="item-name-value"><strong>${dto.item_dto.item_name }</strong></span>
								</div>
							</div>
							<div class="table-caption">
								<!-- 						<button class="btn-list" id="btn-write" onclick="#"
							style="cursor: pointer; font-family: inherit;">
							<img src="resources/img/bell-off.png" alt="">알림제거
						</button> -->
							</div>

						</div>
						<div class="list-control-container">
							<!-- 				<button class="btn-list" id="btn-delete" onclick="#"
						style="cursor: pointer; font-family: inherit;">선택 목록 삭제
					</button> -->
						</div>

					</div>
					<div class="table-caption-wrapper">
						<div class="talbe-caption-container">
							<div class="table-caption">
								<div class="registrationed_alarm_keywords_list">
									<span class="item_tag_01">물건</span> <span class="item_tag_02">${dto.item_dto.item_name}</span>
									<span class="item_tag_03">${dto.item_dto.lostday}</span> <span
										class="item_tag_04">${dto.item_dto.upkind}>${dto.item_dto.upr_cd}</span>
									<span class="item_tag_05">${dto.item_dto.address}</span>
								</div>
							</div>
						</div>
						<div class="list-control-container">
							<a href="#">매칭된 게시물
								총(${dto.matching_item_dto.size()}개)&nbsp;&nbsp;</a>
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
						
						
						
						<c:forEach items="${dto.matching_item_dto }" var="dto2"
							begin="${pagevo.rowStart-1}" end="${pagevo.rowEnd-1}">

							<tr>
								<td><input type="checkbox" name="RowCheck" value=""
									class="table-check-box"></td>
								<td><input type="image" src="${dto2.fdFilePathImg}"
									id="item-image-value"
									onclick="goToDetailPage('${dto2.atcid}','${dto2.fdSn}')"
									style="cursor: pointer;" /></td>
								<td class="table-title"><a href="#">${dto2.fdPrdtNm}</a></td>
								<td>${dto2.fdYmd}</td>
								<td>${dto2.depPlace}
									<p style="color: #A4A4A4;">${dto2.atcid}</p>
								</td>
								<td><input type="image" src="resources/img/trash_icon.png"
									onclick="" style="cursor: pointer;" /></td>
							</tr>
						</c:forEach>

					</table>
				</div>
			</div>
		</c:if>
		
		<c:if test="${not empty dto.animal_dto}">
			<div class="content-wrapper">
				<div class="content-container">

					<div class="table-caption-wrapper">
						<div class="talbe-caption-container">
							<div class="table-caption">
								<div>
									<span id="item-name-text">분실동물명 :</span> <span
										id="item-name-value"><strong>${dto.animal_dto.animal_name }</strong></span>
								</div>
							</div>
							<div class="table-caption">
								<!-- 						<button class="btn-list" id="btn-write" onclick="#"
							style="cursor: pointer; font-family: inherit;">
							<img src="resources/img/bell-off.png" alt="">알림제거
						</button> -->
							</div>

						</div>
						<div class="list-control-container">
							<!-- 				<button class="btn-list" id="btn-delete" onclick="#"
						style="cursor: pointer; font-family: inherit;">선택 목록 삭제
					</button> -->
						</div>

					</div>
					<div class="table-caption-wrapper">
						<div class="talbe-caption-container">
							<div class="table-caption">
								<div class="registrationed_alarm_keywords_list">
									<span class="item_tag_01">동물</span> <span class="item_tag_02">${dto.animal_dto.animal_name}</span>
									<span class="item_tag_03">${dto.animal_dto.missingday}</span> <span
										class="item_tag_04">${dto.animal_dto.upkind}>${dto.animal_dto.upr_cd}</span>
									<span class="item_tag_05">${dto.animal_dto.address}</span>
								</div>
							</div>
						</div>
						<div class="list-control-container">
							<a href="#">매칭된 게시물
								총(${dto.matching_animal_dto.size()}개)&nbsp;&nbsp;</a>
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
						
						
						
						<c:forEach items="${dto.matching_animal_dto }" var="dto2"
							begin="${pagevo.rowStart-1}" end="${pagevo.rowEnd-1}">

							<tr>
								<td><input type="checkbox" name="RowCheck" value=""
									class="table-check-box"></td>
								<td>
								<!-- 동물 디테일페이지 만들어야됨 -->
								<input type="image" src="${dto2.filename}"
									id="item-image-value"
									onclick="goToDetailPage('${dto2.desertionNo}')"
									style="cursor: pointer;" /></td>
								<td class="table-title"><a href="#">${dto2.kindCd}</a></td>
								<td>${dto2.happenDt}</td>
								<td>${dto2.careAddr}
									<p style="color: #A4A4A4;">${dto2.desertionNo}</p>
								</td>
								<td><input type="image" src="resources/img/trash_icon.png"
									onclick="" style="cursor: pointer;" /></td>
							</tr>
						</c:forEach>

					</table>
				</div>
			</div>
		</c:if>
		
		

		<!-- page -->

		<div class="result-container">
			<div class="page-container">
				<div class="currentOftotal">
					<span>Page</span><span class="current-page">${pagevo.page}</span><span>of</span><span
						class="total-page">${pagevo.totPage}</span>
				</div>
				<ul class="pagelist-container">
					<li class="btn-prev"><a href="javascript:void(0);"
						onclick="goToPage('${dto.total_id}', '${pagevo.page - 1}')"><img
							src="resources/img/chevron-left.png" alt=""></a></li>
					<c:forEach begin="${pagevo.pageStart}" end="${pagevo.pageEnd}"
						var="i">
						<c:choose>
							<c:when test="${i eq pagevo.page}">
								<li><span class="currpage">${i}</span></li>
							</c:when>
							<c:otherwise>
								<li><a href="javascript:void(0);" onclick="goToPage('${dto.total_id}', '${i}')">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<li class="btn-next"><a href="javascript:void(0);"
						onclick="goToPage('${dto.total_id}', '${pagevo.page+1}')"><img
							src="resources/img/chevron-left.png" alt=""></a></li>
				</ul>

				<ul class="switchBtn-container">
					<li class="btn-prev-group"><a href="javascript:void(0);"
						onclick="goToPage('${dto.total_id}', '${pagevo.page-10}')">Previous</a></li>
					<li class="btn-next-group"><a href="javascript:void(0);"
						onclick="goToPage('${dto.total_id}', '${pagevo.page+10}')">Next</a></li>
				</ul>
			</div>
		</div>

	</div>
</body>
</html>
