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
					<th>분실/실종일자</th>
					<th>분실/실종 장소</th>
					<th>알람설정</th>
					<th class="table-image"></th>
					<th class="table-image"></th>
				</tr>
				<c:forEach items="${dtos }" var="dtos">
				<input type="hidden" name="kind" id="kind" value="">
				<tr>
					<td><input type="checkbox" name="RowCheck" value=""
						class="table-check-box"></td>
					<td>${dtos.kind }</td>
					<td><input type="image" src="${dtos.filename }"
						id="item-image-value" onclick="" style="cursor: pointer;" /></td>
					<td class="table-title"><a href="#">${dtos.name }</a></td>
					<td>${dtos.day }</td>
					<td>${dtos.address }</td>
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
					<c:if test="${dtos.kind eq '동물' }">
					<td class="table-image"><input type="image" src="resources/img/trash_icon.png"
						onclick="deletes_an('${dtos.total_id}')" 
						style="cursor: pointer;" />
						</td>
					<td class="table-image"><input type="image" src="resources/img/write_icon.png"
						onclick="modify_an('${dtos.total_id}')" style="cursor: pointer; margin-top: 10px;"/></td>
					</c:if>
					<c:if test="${dtos.kind eq '물건' }">
					<td class="table-image"><input type="image" src="resources/img/trash_icon.png"
						onclick="deletes_it('${dtos.total_id}')" 
						style="cursor: pointer;" />
						</td>
					<td class="table-image"><input type="image" src="resources/img/write_icon.png"
						onclick="modify_it('${dtos.total_id}')" style="cursor: pointer; margin-top: 10px;"/></td>
					</c:if>
				</tr>
				</c:forEach>
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
<script>
function deletes_an(total_id){
	if(window.confirm("게시물을 삭제하시겠습니까?")){
		location.href='mypage_ani_delete?total_id='+total_id;
	}
};
function deletes_it(total_id){
	if(window.confirm("게시물을 삭제하시겠습니까?")){
		location.href='mypage_item_delete?total_id='+total_id;
	}
};
function modify_an(total_id) {
	if(window.confirm("게시물을 수정하시겠습니까?")){
		location.href='mypage_ani_modify_page?total_id='+total_id;
	}
};
function modify_it(total_id) {
	if(window.confirm("게시물을 수정하시겠습니까?")){
		location.href='mypage_item_modify_page?total_id='+total_id;
	}
};
</script>
</body>
</html>
