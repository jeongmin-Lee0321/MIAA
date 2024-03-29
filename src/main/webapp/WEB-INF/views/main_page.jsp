<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<title>miaa</title>
<link rel="stylesheet" href="resources/css/main_page.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css'
	rel='stylesheet' type='text/css'>
</head>
<body>
	<!-- main -->

	<main>
		<div
			style="width: 90%; height: 65%; border: 1px solid red; display: flex; justify-content: center; align-items: center; margin: auto; margin-top: 20px; text-align: center;">

			<div
				style="width: 47%; height: 90%; border: 1px solid red; float: left;">
				<div class="main_text">
					MISSING <br /> ITEM <br /> ANIMAL <br /> ALARM
				</div>
			</div>
			<div
				style="width: 47%; height: 90%; border: 1px solid green; float: right;">
				<div class="main_img">
					<img class="main_img_src" src="resources/img/lostimg.png" />
				</div>
			</div>



		</div>
		</div>
		<div
			style="width: 90%; height: 65%; border: 1px solid green; display: flex; justify-content: center; align-items: center; margin: auto; margin-top: 20px;">
			<button onclick="location.href='found_item_search_page'"
				class="item_find">
				<img src="resources/img/item_find.png" alt="" />
				<p style="font-weight: bold; font-size: x-large;">습득물 찾기</p>
				LOST112경찰청 데이터에 의 <br />해 제공됩니다
			</button>
			<button onclick="location.href='lost_item_search_page'"
				class="item_registration">
				<img src="resources/img/item_registration.png" alt="" />
				<p style="font-weight: bold; font-size: x-large;">분실물 등록</p>
				분실물을 등록하여 알람설정을<br />받을수 있습니다
			</button>
			<button onclick="location.href='rescue_ani_search_page'"
				class="animal_find">
				<img src="resources/img/animal_find.png" alt="" />
				<p style="font-weight: bold; font-size: x-large;">보호동물 찾기</p>
				보호중인 동물과 보호처를 찾<br />을수 있습니다
			</button>
			<button onclick="location.href='missing_ani_search_page'"
				class="animal_registration">
				<img src="resources/img/animal_registration.png" alt="" />
				<p style="font-weight: bold; font-size: x-large;">실종동물 등록</p>
				잃어버린 반려동물을 등록하여<br />알람설정을 받을수 있습니다
			</button>
		</div>

	</main>

</body>
</html>
