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
<div>
	<main>
	
		<div
			style="width: 100%; height: 65%;  display: flex; justify-content: center; align-items: center; margin: auto; margin-top: 20px; text-align: center; margin-top: 60px; margin-bottom: 80px;">

			<div
				style="width: 50%; height: 100%;  float: left;">
				<div class="main_text">
					MISSING <br /> ITEM <br /> ANIMAL <br /> ALARM
				</div>
			</div>
			<div
				style="width: 50%; height: 100%;  float: right;">
				<div class="main_img">
					<img class="main_img_src" src="resources/img/lostimg.png"/>
				</div>
			</div>
			



		</div>
<<<<<<< HEAD
		<a href="rescue_ani_detail_page">rescue_ani_detail_page</a><br>
		<a href="missing_ani_detail_page">missing_ani_detail_page</a><br>
		<a href="found_item_detail_page">found_item_detail_page</a><br>
		<a href="lost_item_detail_page">lost_item_detail_page</a><br>
=======
		</div>
		<div
			style="width: 100%; height: 65%;  display: flex; justify-content: center; align-items: center; margin: auto; margin-top: 20px; margin-top: 80px; margin-bottom: 80px; ">
			<button onclick="location.href='found_item_search_page'"
				class="item_find" style="cursor: pointer;">
				<img src="resources/img/item_find.png" alt="" />
				<p style="font-weight: bold; font-size: x-large;">습득물 찾기</p>
				LOST112경찰청 데이터에 의 <br />해 제공됩니다
			</button>
			<button onclick="location.href='lost_item_search_page'"
				class="item_registration" style="cursor: pointer;">
				<img src="resources/img/item_registration.png" alt="" />
				<p style="font-weight: bold; font-size: x-large;">분실물 등록</p>
				분실물을 등록하여 알람설정을<br />받을수 있습니다
			</button>
			<button onclick="location.href='rescue_ani_search_page'"
				class="animal_find" style="cursor: pointer;">
				<img src="resources/img/animal_find.png" alt="" />
				<p style="font-weight: bold; font-size: x-large;">보호동물 찾기</p>
				보호중인 동물과 보호처를 찾<br />을수 있습니다
			</button>
			<button onclick="location.href='missing_ani_search_page'"
				class="animal_registration" style="cursor: pointer;">
				<img src="resources/img/animal_registration.png" alt="" />
				<p style="font-weight: bold; font-size: x-large;">실종동물 등록</p>
				잃어버린 반려동물을 등록하여<br />알람설정을 받을수 있습니다
			</button>
		</div>

	</main>
</div>
>>>>>>> release/MSW
</body>
</html>
