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
<link rel="stylesheet" href="resources/css/mypage_customer_inquiry_write_page.css">
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

		<div class="main-contents">

			<form action="inquiry_write">

				<div class="table-container">
					<div class="table-title">
						<img src="resources/img/clipboard.png" alt=""><span>*필수입력사항</span>
					</div>
					<div class="table">

						<div class="table-row">
							<div class="row-title">
								<span>*제목</span>
							</div>
							<div class="row-content">
								<input type="text" name="inquiry_title" id="inquiry_title"
									placeholder="제목을 입력하세요" required="required">
							</div>
						</div>

						<div class="table-row">
							<div class="row-title">
								<span>*내용</span>
							</div>
							<div class="row-content" id="textarea-content">
								<!-- 텍스트제한 표시 추가 필요 -->
								<textarea name="inquiry_content" id="inquiry_content" maxlength="300"
									placeholder="내용을 입력하세요." required="required"></textarea>
							</div>
						</div>
						<!-- 파일형식 제한 필요 -->
						<div class="table-row">
							<div class="row-title">
								<span>사진첨부</span>
							</div>
							<div class="col-content">
								<div class="in-row-content">
									<input type="file" name="inquiry_file" id="file1" accept="image/*">
									<label for="file1">사진첨부</label>
								</div>

								<div class="image-ex-text">*첨부파일은 한개당 3mb까지 제한되고 확장자는
									JPEG,GIF,PNG로 제한됩니다.</div>
							</div>
						</div>
					</div>
				</div>

				<ul class="bottom-btns">
					<li><button type="submit">등록하기</button></li>
					<li><button type="button"
							onclick="location.href='mypage_customer_inquiry_list_page';">취소하기</button></li>
				</ul>

			</form>

		</div>
	</div>
</body>

</html>