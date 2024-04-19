<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="resources/css/mypage_post_list_page.css">
</head>
<body>

<div class="main-body">

	<!-- main -->
			
        <!-- 검색창과 검색결과 -->
        
			<div class="searchbar-container">
				<form action="mypage_post_list_page">				
					<div class="searchbar-select-group">
						<div class="searchbar-content">
							<select name="reply_status" id="reply_status" style="border: 1px solid #D8D8D8;">
								<option>제목+내용</option> 
								<option>제목</option> 
								<option>내용</option> 								
							</select>
						</div>
						<div class="searchbar-content">
							<input type="text" style="border: 1px solid #D8D8D8; width: 300px;" placeholder="Search">
						</div>
						<button class="btn-list" id="btn-search" onclick="#"
							style="cursor: pointer;">
							조회<img src="resources/img/search.png" alt="">
						</button>
					</div>
				</form>
			</div>
			
			<!-- 검색창과 검색결과 끝 -->

	
	<div style="padding: 15px 40px; color: #0066ff;">
	등록된 알림 키워드(5개)
	</div>

	<div class="content-wrapper">
		<div class="content-container">

			<div class="table-caption-wrapper">
				<div class="talbe-caption-container">
					<div class="table-caption">
						<div>
							<div class="searchbar-content">
							<select name="reply_status" id="reply_status" style="font-family: inherit; border: 1px solid #D8D8D8;">
								<option value="all" >전체</option>
								<option value="item" >물건</option>
								<option value="animal" >동물</option>														
							</select>
						</div>
						</div>
					</div>
					<div class="table-caption">
						
					</div>

				</div>
				<div class="list-control-container">
				<button class="btn-list" id="btn-write" onclick="#"
							style="cursor: pointer;">
							<img src="resources/img/bell-on.png" alt="">알림설정
						</button>
				<button class="btn-list" id="btn-write" onclick="#"
							style="cursor: pointer;">
							<img src="resources/img/bell-off.png" alt="">알림제거
						</button>
					<button id="btn-delete" onclick="#"
						style="cursor: pointer;">삭제하기</button>
				</div>

			</div>
			

			<table class="info-table">
				<tr>
					<th><input type="checkbox" name="allCheck" id="allCheck"
						class="table-check-box"></th>
					<th>분류</th>
					<th>사진</th>
					<th class="table-title">게시 제목</th>
					<th>분실/습득일자</th>
					<th>실종 분실 장소</th>
					<th>알람설정</th>
					<th class="table-image"></th>
					<th class="table-image"></th>
				</tr>

				<tr>
					<td><input type="checkbox" name="RowCheck" value=""
						class="table-check-box"></td>
					<td>물건</td>
					<td><input type="image" src="resources/img/image_no.png"
						id="item-image-value" onclick="" style="cursor: pointer;" /></td>
					<td class="table-title"><a href="#">에어팟 3세대</a></td>
					<td>2018-06-01</td>
					<td>서울 은평구 버스정류장</td>
					<td>
					
					<!-- 벨 ON OFF 설정 -->
					<%-- <c:if test="${들어오는값 eq 'Y'}"> --%>
					<input type="image" src="resources/img/bell-on.png"
						onclick="" style="cursor: pointer;" />
					<%-- </c:if> --%>	
					<%-- <c:if test="${들어오는값 eq 'N'}">
					<input type="image" src="resources/img/bell-off.png"
						onclick="" style="cursor: pointer;" />
					</c:if> --%>
					
					</td>
					<td class="table-image"><input type="image" src="resources/img/trash_icon.png"
						onclick="" style="cursor: pointer;" />
						</td>
					<td class="table-image"><input type="image" src="resources/img/write_icon.png"
						onclick="" style="cursor: pointer; margin-top: 10px;"/></td>
				</tr>
				<tr>
					<td><input type="checkbox" name="RowCheck" value=""
						class="table-check-box"></td>
					<td>동물</td>
					<td><input type="image" src="resources/img/image_no.png"
						id="item-image-value" onclick="" style="cursor: pointer;" /></td>
					<td class="table-title"><a href="#">푸들</a></td>
					<td>2018-06-01</td>
					<td>서울은평경찰서 근처</td>
					<td>
					
					<!-- 벨 ON OFF 설정 -->
					<%-- <c:if test="${들어오는값 eq 'Y'}"> --%>
					<!-- <input type="image" src="resources/img/bell-on.png"
						onclick="" style="cursor: pointer;" /> -->
					<%-- </c:if> --%>	
					<%-- <c:if test="${들어오는값 eq 'N'}"> --%>
					<input type="image" src="resources/img/bell-off.png"
						onclick="" style="cursor: pointer;" />
					<%-- </c:if> --%>
					
					</td>
					<td class="table-image"><input type="image" src="resources/img/trash_icon.png"
						onclick="" style="cursor: pointer;" />
						</td>
					<td class="table-image"><input type="image" src="resources/img/write_icon.png"
						onclick="" style="cursor: pointer; margin-top: 10px;"/></td>
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


</body>
</html>
