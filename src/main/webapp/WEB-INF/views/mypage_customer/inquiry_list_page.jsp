<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Title</title>
<link rel="stylesheet"
	href="resources/css/mypage_customer_inquiry_list_page.css" />
</head>
<body>
	<div class="main-body">

		<!-- main -->

		<div class="content-wrapper">
			<div class="content-container">
				<div class="list-control-container">
					<button class="btn-list" id="btn-write" onclick="location.href='mypage_customer_inquiry_write_page';" style="cursor: pointer;">문의글 등록</button>
					<button class="btn-list" id="btn-delete" onclick="location.href=#" style="cursor: pointer;">삭제하기</button>
				</div>
				<table class="info-table">
					<tr>
						<th><input type="checkbox" name="" id=""
							class="table-check-box"></th>
						<th>글번호</th>
						<th class="table-title">제목</th>
						<th>처리상태</th>
						<th>문의 날짜</th>
						<th>답변 날짜</th>
						<th></th>
					</tr>
					<c:forEach items="${list }" var="list">
					<tr>
						<td><input type="checkbox" name="" id=""
							class="table-check-box"></td>
						<td>${list.rownum}</td>
						<td class="table-title">${list.board_title}</td>
						<td>${list.board_reply_status}</td>
						<td>${list.board_registration_date}</td>
						<td>-</td>						
						<td><img src="resources/img/write_icon.png" alt=""
							class="ctrl-icon" onclick="location.href=#" style="cursor: pointer;"></td>
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
		</div>

	</div>
</body>
</html>