<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림 목록</title>
<link rel="stylesheet" href="resources/css/footer.css" />
<link rel="stylesheet" href="resources/css/header.css" />
<link rel="stylesheet"
	href="resources/css/mypage_matching_alarm_list_page.css">
</head>
<body>
	<div class="mypage_matching_alarm_list_page_table">	
		<div class="page_root">내정보>내칭 알림 목록</div>
		<div class="page_titles">
			<div class="page_title">
				메칭 알람 목록
				<a href="###" class="registration_alarm_count">등록알림(5개)</a>
			</div>
		</div>
		<div class="page_discription">등록하신 분실물, 실종동물의 글을 기반으로 알림이 등록되고
			매칭됩니다.
		</div>
		<div class="alarm_search_result_group">buttons</div>
		<div class="alarm_search_bar">matching alarm search bar</div>
		
		<!-- 03/29 수정한 부분 -->	
<!-- 		<table class > -->
			<div class="registrationed_alarm_keywords">
				<a href="###">등록된 알림 키워드(5개)</a>
			</div>
			
			
			<table class="lost_list_line_01_info">
				<div class="registrationed_alarm_keywords_list">
					<input type="checkbox" class="lost_item_name">
					분실물명 : 에어팟 
					<a href="$$$" class="item_tag_01">물건</a> 
					<a href="$$$" class="item_tag_02">에어팟</a> 
					<a href="$$$" class="item_tag_03">2024-03-06시경</a>
					<a href="$$$" class="item_tag_04">전자기기 > 무선이어폰</a> 
					<a href="$$$" class="item_tag_05">월게,이마트,트레이더스</a> 
					<a href="$$$" class="show_all_result">모두 보기(49개)</a>
				</div>
				
				<table class="lost_list_line_01">
					<tr>
						<td class="lost_item_list_line_01_detail_01">
							<a href="#"> 
								<img src="resources/item1.jpg">
							</a>
							<br />
							<div>
								에어팟유닛(R)<br /> 2024-02-25<br /> 서울용산경찰서<br /> 전자기기 > 무선아이폰<br />
							</div>
						</td>
						<td class="lost_item_list_line_01_detail_02">
							<a href="#"> 
								<img src="resources/item1.jpg">
							</a>
							<br/>
							<div>
								에어팟유닛(R)<br /> 2024-02-25<br /> 서울용산경찰서<br /> 전자기기 > 무선아이폰<br />
							</div>
						</td>
						<td class="lost_item_list_line_01_detail_03">
							<a href="#">
								<img src="resources/item1.jpg">
							</a>
							<br />
							<div>
								에어팟유닛(R)<br /> 2024-02-25<br /> 서울용산경찰서<br /> 전자기기 > 무선아이폰<br />
							</div>
						</td>
						<td class="lost_item_list_line_01_detail_04">
							<a href="#">
								<img src="resources/item1.jpg">
							</a>
							<br />
							<div>
								에어팟유닛(R)<br/> 2024-02-25<br /> 서울용산경찰서<br /> 전자기기 > 무선아이폰<br />
							</div>
						</td>
					</tr>
				</table>
			</table>
	</div>
</body>
</html>