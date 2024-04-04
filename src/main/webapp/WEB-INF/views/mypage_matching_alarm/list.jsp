<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mypage_matching_alarm_list_page.css"/>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div>

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
      <table id="total_lost_item_list_content">                   
          <div class="registrationed_alarm_keywords">
				<a href="###">등록된 알림 키워드(5개)</a>
		  </div>
          <div class="registrationed_alarm_keywords_list">
			  <c:forEach items="${list }" var="list">
					<input type="checkbox" class="lost_item_name" id="lost_item_name" value="lost_item_name">
						${list.item_name}			
					<a href="$$$" class="item_tag_01">물건</a> 
					<a href="$$$" class="item_tag_02">${list.item_name}</a> 
 					<a href="$$$" class="item_tag_03">${list.lostday}</a> 					
					<c:set var="upperkind" value="${list.upkind}"/>
					
					<c:choose>
						<c:when test="${upperkind == 'PRB000'}">
							<c:set var="upperkind" value="도서용품"/>
						</c:when>
						<c:when test="${upperkind == 'PRC000'}">
							<c:set var="upperkind" value="서류"/>
						</c:when>
						<c:when test="${upperkind == 'PRD000'}">
							<c:set var="upperkind" value="산업용품"/>
						</c:when>
						<c:when test="${upperkind == 'PRE000'}">
							<c:set var="upperkind" value="스포츠용품"/>
						</c:when>
						<c:when test="${upperkind == 'PRF000'}">
							<c:set var="upperkind" value="자동차"/>
						</c:when>
						<c:when test="${upperkind == 'PRG000'}">
							<c:set var="upperkind" value="전자기기"/>
						</c:when>
						<c:when test="${upperkind == 'PRH000'}">
							<c:set var="upperkind" value="지갑"/>
						</c:when>
						<c:when test="${upperkind == 'PRI000'}">
							<c:set var="upperkind" value="컴퓨터"/>
						</c:when>
						<c:when test="${upperkind == 'PRJ000'}">
							<c:set var="upperkind" value="휴대폰"/>
						</c:when>
						<c:when test="${upperkind == 'PRK000'}">
							<c:set var="upperkind" value="의류"/>
						</c:when>
						<c:when test="${upperkind == 'PRL000'}">
							<c:set var="upperkind" value="현금"/>
						</c:when>
						<c:when test="${upperkind == 'PRM000'}">
							<c:set var="upperkind" value="유가증권"/>
						</c:when>
						<c:when test="${upperkind == 'PRN000'}">
							<c:set var="upperkind" value="증명서"/>
						</c:when>
						<c:when test="${upperkind == 'PRO000'}">
							<c:set var="upperkind" value="귀금속"/>
						</c:when>
						<c:when test="${upperkind == 'PRP000'}">
							<c:set var="upperkind" value="카드"/>
						</c:when>
						<c:when test="${upperkind == 'PRQ000'}">
							<c:set var="upperkind" value="쇼핑백"/>
						</c:when>
						<c:when test="${upperkind == 'PRR000'}">
							<c:set var="upperkind" value="악기"/>
						</c:when>
						<c:when test="${upperkind == 'PRX000'}">
							<c:set var="upperkind" value="유류품"/>
						</c:when>
						<c:when test="${upperkind == 'PRZ000'}">
							<c:set var="upperkind" value="기타물품"/>
						</c:when>
					</c:choose>	
									
					<c:set var="lowerkind" value="${list.upr_cd}"/>	
					<a href="$$$" class="item_tag_04">${upperkind} > ${lowerkind}</a> 
		<%-- 			<a href="$$$" class="item_tag_04">${list.upkind} > ${list.upr_cd}</a>  --%>
					<a href="$$$" class="item_tag_05">${list.address}</a> 
					<a href="list02" class="show_all_result">모두 보기(49개)</a>
			  </c:forEach>
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
       </table> 
      </div>
      </div>
</body>