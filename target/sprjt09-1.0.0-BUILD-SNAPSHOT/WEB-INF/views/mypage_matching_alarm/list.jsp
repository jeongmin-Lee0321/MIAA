<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mypage_matching_alarm_list_page.css"/>
<title>Insert title here</title>
</head>
<body>
      <div class="main-contents">
        <!-- 검색창과 검색결과 -->
        <!-- result-container시작 -->
        <div class="result-container">       
          <div class="page_root">내정보>내칭 알림 목록</div>
         <div class="border_01">
         	<div class="btn-set">
              <button class="view_all_btn" onclick="location.href='##&&##'">View all</button>
              <button class="item_btn" onclick="location.href='#$$#'">물건</button>
              <button class="ani_btn" onclick="location.href='##$'">동물</button>
              <button class="keyword_list_btn" onclick="location.href='##%%%'">키워드목록</button>
         	</div>
         	<div class="set_02">
         	  <select name="select_content" id="select_content">
         			<option value="제목+내용">제목+내용</option>
         			<option value="제목">제목</option>
         			<option value="내용">내용</option>
         	  </select>
	          <div class="search">
	  			<input class="search_bar" type="text" placeholder="검색어 입력">
	  			<img class="search_icon" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
			  </div>
	         <button class="alarm_delete">알림제거</button>
         	</div>
         </div>
                    
          <div class="registrationed_alarm_keywords">
				<a href="###">등록된 알림 키워드(5개)</a>
		  </div>
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
          
          <!-- 검색 결과 리스트프레임 -->
          <div class="result-list">
            <!-- 목록1개가 list-card -->
            <div class="list-card">
              <div class="card-photo">
                <img src="resources/img/null_img_icon.png" alt="">
              </div>                            
              <div class="content-items">
                <div class="item-title">
                  <span>남성용 반지갑 </span>
                </div>
                <ul class="item-details">
                  <li><span>F2018080900000674</span></li>
                  <li><span class="detail-title">물품분류:</span><span>지갑>기타지갑</span></li>
                  <li><span class="detail-title">보관장소:</span><span>서울 은평 경찰서 </span></li>
                  <li><span class="detail-title">습득날짜:</span><span>2024-03-15 </span></li>
                </ul>
              </div>
          	</div>
          	
          	
            <div class="list-card">
              <div class="card-photo">
                <img src="resources/img/null_img_icon.png" alt="">
              </div> 
              <div class="content-items">
                <div class="item-title">
                  <span>남성용 반지갑 </span>
                </div>
                <ul class="item-details">
                  <li><span>F2018080900000674</span></li>
                  <li><span class="detail-title">물품분류:</span><span>지갑>기타지갑</span></li>
                  <li><span class="detail-title">보관장소:</span><span>서울 은평 경찰서 </span></li>
                  <li><span class="detail-title">습득날짜:</span><span>2024-03-15 </span></li>
                </ul>
              </div>
          	</div>
          	
          	          	
            <div class="list-card">
              <div class="card-photo">
                <img src="resources/img/null_img_icon.png" alt="">
              </div>       
              <div class="content-items">
                <div class="item-title">
                  <span>남성용 반지갑 </span>
                </div>
                <ul class="item-details">
                  <li><span>F2018080900000674</span></li>
                  <li><span class="detail-title">물품분류:</span><span>지갑>기타지갑</span></li>
                  <li><span class="detail-title">보관장소:</span><span>서울 은평 경찰서 </span></li>
                  <li><span class="detail-title">습득날짜:</span><span>2024-03-15 </span></li>
                </ul>
              </div>
          	</div>
          	
            <div class="list-card">
              <div class="card-photo">
                <img src="resources/img/null_img_icon.png" alt="">
              </div>       
              <div class="content-items">
                <div class="item-title">
                  <span>남성용 반지갑 </span>
                </div>
                <ul class="item-details">
                  <li><span>F2018080900000674</span></li>
                  <li><span class="detail-title">물품분류:</span><span>지갑>기타지갑</span></li>
                  <li><span class="detail-title">보관장소:</span><span>서울 은평 경찰서 </span></li>
                  <li><span class="detail-title">습득날짜:</span><span>2024-03-15 </span></li>
                </ul>
              </div>
          	</div>
          
        </div>
      
      </div>
</body>