<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kor">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/admin_inquiry_write_page.css">
<title>Document</title>
<style>
body {
	margin: 0px;
	padding: 0px;
	font-family: "Noto Sans KR", sans-serif;
	font-optical-sizing: auto;
	font-weight: 500;
	font-style: normal;
}
</style>
</head>

<body>
	<div class="main-container">
		<div class="main-selection">
			<div class="index">
				<span>1대1문의 관리</span><span>></span><span>상세검색</span><span>></span><span>문의글
					상세페이지</span>
			</div>
			<div class="main-selection-flex">
				<div class="main-selection-ex">
					<div class="title">문의글 상세페이지</div>
				</div>
			</div>
		</div>

		<div class="main-contents">
			<ul class="top-btns">
				<li><button type="button" id="list">목록으로</button></li>
				<li><button type="button" id="delete">삭제하기</button></li>
			</ul>
			<!-- form 시작 -->
			<form action="admin_inquiry_write" id="inquiry_write_form">
				<!-- table1 -->
				<div class="table-container">
					<div class="table-title">
						<img src="resources/img/clipboard.png" alt=""><span>회원
							문의내용</span>
					</div>
					<div class="table">

						<div class="table-row">
							<div class="row-title">
								<span>관리번호</span>
							</div>
							<div class="row-content">${list.userInquiry.board_num}</div>
						</div>
						<div class="table-row">
							<div class="row-title">
								<span>제목</span>
							</div>
							<div class="row-content">${list.userInquiry.board_title}</div>
						</div>
						<div class="table-row" id="lg-content">
							<div class="row-title">
								<span>내용</span>
							</div>
							<div class="row-content" id="lg-content">${list.userInquiry.board_content}</div>
						</div>
						<div class="table-row">
							<div class="row-title">
								<span>등록일자</span>
							</div>
							<div class="row-content">${list.userInquiry.board_registration_date}</div>
						</div>
						<div class="table-row">
							<div class="row-title">
								<span>첨부파일</span>
							</div>
							<div class="row-content"><%-- ${list.userInquiry.board_filesrc} --%></div>
						</div>
						<div class="table-row">
							<div class="row-title">
								<span>처리상태</span>
							</div>
							<div class="row-content">${list.userInquiry.board_reply_status}</div>
						</div>
					</div>
				</div>
				<!-- table2 -->
				<div class="table-container">
					<div class="table-title">
						<img src="resources/img/clipboard.png" alt=""><span>관리자
							답변</span>
					</div>
					<div class="table">
						<div class="table-row">
							<div class="row-title">
								<span>처리일자</span>
							</div>
							<div class="row-content">${list.board_reply_date}</div>
						</div>
						<div class="table-row">
							<div class="row-title">
								<span>답변내용</span>
							</div>
							<div class="row-content" id="textarea-content">
								<!-- 텍스트제한 표시 추가 필요 -->
								<textarea name="board_reply" id="board_reply" maxlength="300"
									placeholder="텍스트를 입력하세요.">${list.board_reply}</textarea>
								<div class="textLengthWrap">
									<span class="textCount">0자</span> <span class="textTotal">/300자</span>
								</div>
							</div>
						</div>
					</div>
				</div>

				<ul class="bottom-btns">
					<li><button type="submit" form="inquiry_write_form">답변등록</button></li>
				</ul>
				<!-- hidden 세션로그인 id -->
				<input type="hidden" name="board_num" value="${list.userInquiry.board_num}">
			</form>
			<!-- form 끝 -->
		</div>
	</div>
	<!-- 글자수 제한 표현 -->
	<script>
	$(document).ready(function() {
	    function updateTextCount() {
	        let content = $("#board_reply").val();
	        let textCount = content.length > 0 ? content.length + '자' : '0자';
	        $('.textCount').text(textCount);
	        
	        if (content.length > 300) {
	            $("#board_reply").val(content.substring(0, 300));
	            alert('글자수는 300자까지 입력 가능합니다.');
	        }
	    }

	    // 페이지 로드 시 호출
	    updateTextCount();

	    // 입력 변경 시 호출
	    $(document).on("keydown change", "#board_reply", updateTextCount);
	});
	</script>
</body>

</html>