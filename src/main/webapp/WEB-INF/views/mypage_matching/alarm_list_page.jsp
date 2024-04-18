<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
   href="resources/css/mypage_matching_alarm_list_page.css" />
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<title>Insert title here</title>
</head>
<body>
   <script type="text/javascript">
      $(function() {
         var chkObj = document.getElementsByName("RowCheck");
         var rowCnt = chkObj.length;

         $("input[name='allCheck']").click(function() {
            var chk_listArr = $("input[name='RowCheck']");
            for (var i = 0; i < chk_listArr.length; i++) {
               chk_listArr[i].checked = this.checked;
            }
         });
         $("input[name='RowCheck']").click(function() {
            if ($("input[name='RowCheck']:checked").length == rowCnt) {
               $("input[name='allCheck']")[0].checked = true;
            } else {
               $("input[name='allCheck']")[0].checked = false;
            }
         });
      });
      function deleteValue() {
         var url = "delete"; // Controller로 보내고자 하는 URL
         var valueArr = new Array();
         var list = $("input[name='RowCheck']");
         for (var i = 0; i < list.length; i++) {
            if (list[i].checked) { //선택되어 있으면 배열에 값을 저장함
               valueArr.push(list[i].value);
            }
         }
         if (valueArr.length == 0) {
            alert("선택된 글이 없습니다.");
         } else {
            var chk = confirm("정말 삭제하시겠습니까?");
            if (chk) {
               $.ajax({
                        url : url, // 전송 URL
                        type : 'POST', // POST 방식
                        traditional : true,
                        data : {
                           valueArr : valueArr
                        // 보내고자 하는 data 변수 설정
                        },
                        success : function(jdata) {
                           if (jdata = 1) {

                              alert("삭제 성공");
                              location
                                    .replace("mypage_customer_inquiry_list_page") //페이지 새로고침
                           } else {
                              alert("삭제 실패");
                           }
                        }
                     });
            } else {
               alert("삭제 취소");
            }
         }
      }
   </script>

   <!-- <div class="main-body"> -->
   <div class="main-contents">
      <!-- 검색창과 검색결과 -->
      <!-- result-container시작 -->
      <div class="result-container">
         <div class="page_root">내정보 > 내칭 알림 목록(전체목록)</div>
         <div class="border_01">
            <div class="btn-set">
               <button class="view_all_btn"
                  onclick="location.href='mypage_matching_alarm_list_page'">View
                  all</button>
               <button class="item_btn"
                  onclick="location.href='mypage_matching_alarm_item_list_page'">물건</button>
               <button class="ani_btn"
                  onclick="location.href='mypage_matching_alarm_ani_list_page'">동물</button>
               <button class="keyword_list_btn"
                  onclick="location.href='mypage_matching_alarm_keyword_list_page'">키워드목록</button>
            </div>
            <div class="set_02">
               <select name="select_content" id="select_content">
                  <option value="title+content">제목+내용</option>
                  <option value="title">제목</option>
                  <option value="content">내용</option>
               </select>

               <div class="search">
                  <input class="search_bar" type="text" placeholder="검색어 입력">
                  <img class="search_icon"
                     src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"
                     onclick="alert('hello world!')">
               </div>
               <button class="alarm_delete" onclick="deleteValue();">
                  <img class="alarm_off" src="./resources/img/bell-off.png"> <span>알림제거</span>
               </button>
            </div>
         </div>

         <table id="total_lost_item_list_content">
            <!-- <div class="registrationed_alarm_keywords"> -->
            <span class="registration_item_alarmkeyword_count">등록된 알림 키워드(${totalCount }개)</span>

            <div class="registrationed_alarm_keywords_list">
               <c:forEach items="${list }" var="list" varStatus="status">
                  <div class="show_lost_item_info_container">
                     <!-- 분실물 : 대분류코드 한글전환 -->
                     <c:set var="upperkind" value="${list.upkind}" />
                     <c:choose>
                        <c:when test="${upperkind == 'PRB000'}">
                           <c:set var="upperkind" value="도서용품" />
                        </c:when>
                        <c:when test="${upperkind == 'PRC000'}">
                           <c:set var="upperkind" value="서류" />
                        </c:when>
                        <c:when test="${upperkind == 'PRD000'}">
                           <c:set var="upperkind" value="산업용품" />
                        </c:when>
                        <c:when test="${upperkind == 'PRE000'}">
                           <c:set var="upperkind" value="스포츠용품" />
                        </c:when>
                        <c:when test="${upperkind == 'PRF000'}">
                           <c:set var="upperkind" value="자동차" />
                        </c:when>
                        <c:when test="${upperkind == 'PRG000'}">
                           <c:set var="upperkind" value="전자기기" />
                        </c:when>
                        <c:when test="${upperkind == 'PRH000'}">
                           <c:set var="upperkind" value="지갑" />
                        </c:when>
                        <c:when test="${upperkind == 'PRI000'}">
                           <c:set var="upperkind" value="컴퓨터" />
                        </c:when>
                        <c:when test="${upperkind == 'PRJ000'}">
                           <c:set var="upperkind" value="휴대폰" />
                        </c:when>
                        <c:when test="${upperkind == 'PRK000'}">
                           <c:set var="upperkind" value="의류" />
                        </c:when>
                        <c:when test="${upperkind == 'PRL000'}">
                           <c:set var="upperkind" value="현금" />
                        </c:when>
                        <c:when test="${upperkind == 'PRM000'}">
                           <c:set var="upperkind" value="유가증권" />
                        </c:when>
                        <c:when test="${upperkind == 'PRN000'}">
                           <c:set var="upperkind" value="증명서" />
                        </c:when>
                        <c:when test="${upperkind == 'PRO000'}">
                           <c:set var="upperkind" value="귀금속" />
                        </c:when>
                        <c:when test="${upperkind == 'PRP000'}">
                           <c:set var="upperkind" value="카드" />
                        </c:when>
                        <c:when test="${upperkind == 'PRQ000'}">
                           <c:set var="upperkind" value="쇼핑백" />
                        </c:when>
                        <c:when test="${upperkind == 'PRR000'}">
                           <c:set var="upperkind" value="악기" />
                        </c:when>
                        <c:when test="${upperkind == 'PRX000'}">
                           <c:set var="upperkind" value="유류품" />
                        </c:when>
                        <c:when test="${upperkind == 'PRZ000'}">
                           <c:set var="upperkind" value="기타물품" />
                        </c:when>
                     </c:choose>

                     <!-- 분실물 : 소분류코드 한글전환 -->
                     <c:set var="lowerkind" value="${list.upr_cd}" />
                     <c:choose>
                        <c:when test="${lowerkind == 'PRI100'}">
                           <c:set var="lowerkind" value="삼성노트북" />
                        </c:when>
                        <c:when test="${lowerkind == 'PRI200'}">
                           <c:set var="lowerkind" value="LG노트북" />
                        </c:when>
                        <c:when test="${lowerkind == 'PRI300'}">
                           <c:set var="lowerkind" value="삼보노트북" />
                        </c:when>
                        <c:when test="${lowerkind == 'PRI400'}">
                           <c:set var="lowerkind" value="기타" />
                        </c:when>
                        <c:when test="${lowerkind == 'PRI500'}">
                           <c:set var="lowerkind" value="HP노트북" />
                        </c:when>
                        <c:when test="${lowerkind == 'PRI600'}">
                           <c:set var="lowerkind" value="애플노트북" />
                        </c:when>
                        <c:when test="${lowerkind == 'PRJ100'}">
                           <c:set var="lowerkind" value="삼성휴대폰" />
                        </c:when>
                        <c:when test="${lowerkind == 'PRJ200'}">
                           <c:set var="lowerkind" value="LG휴대폰" />
                        </c:when>
                        <c:when test="${lowerkind == 'PRJ300'}">
                           <c:set var="lowerkind" value="스카이휴대폰" />
                        </c:when>
                        <c:when test="${lowerkind == 'PRJ400'}">
                           <c:set var="lowerkind" value="아이폰" />
                        </c:when>
                        <c:when test="${lowerkind == 'PRJ500'}">
                           <c:set var="lowerkind" value="기타통신기기" />
                        </c:when>
                        <c:when test="${lowerkind == 'PRJ600'}">
                           <c:set var="lowerkind" value="모토로라휴대폰" />
                        </c:when>
                        <c:when test="${lowerkind == 'PRJ900'}">
                           <c:set var="lowerkind" value="기타휴대폰" />
                        </c:when>
                        <c:when test="${lowerkind == 'PRH100'}">
                           <c:set var="lowerkind" value="여성용지갑" />
                        </c:when>
                        <c:when test="${lowerkind == 'PRH200'}">
                           <c:set var="lowerkind" value="남성용지갑" />
                        </c:when>
                        <c:when test="${lowerkind == 'PRH300'}">
                           <c:set var="lowerkind" value="기타지갑" />
                        </c:when>
                        <c:when test="${lowerkind == 'PRG100'}">
                           <c:set var="lowerkind" value="PMP" />
                        </c:when>
                        <c:when test="${lowerkind == 'PRG200'}">
                           <c:set var="lowerkind" value="MP3" />
                        </c:when>
                        <c:when test="${lowerkind == 'PRG300'}">
                           <c:set var="lowerkind" value="PDA" />
                        </c:when>
                     </c:choose>

                     <a href="mypage_matching_alarm_detail_list_page" class="item_tag_00"> 
                        <input type="checkbox" class="lost_item_name" id="lost_item_name" value="lost_item_name"> 
                       	 분실물명 : ${list.item_name} <!-- 분실물 : 소분류 -->
                     </a> 
                     <a href="$$$" class="item_tag_01">물건</a> 
                     <a href="$$$" class="item_tag_02">${list.item_name}</a>  <!-- 분실물 : 물품명 -->
                     <a href="$$$" class="item_tag_03">${list.lostday}</a>  <!-- 분실물 : 분실날짜 -->
                     <a href="$$$" class="item_tag_04">${upperkind} > ${lowerkind}</a>  <!-- 분실물 : 대분류 > 소분류 -->
                     <a href="$$$" class="item_tag_05">${list.address}</a>  <!-- 분실물 : 분실장소 -->
                     <a href="mypage_matching_alarm_detail_list_page" class="show_all_result">모두 보기(${status.count }개)</a>
                  </div>
                  <div class="result-list">
                     <!-- 목록1개가 list-card -->
                      <c:forEach items="${alert_item_list }" var="alert_item_list">    
                         <c:choose>
                           <c:when test="${list.user_id eq alert_item_list.user_id }">  
                              <div class="list-card" onclick="location.href='lost_item_detail_page?item_id=${alert_item_list.fdPrdtNm }';" style="cursor: pointer;">
                                 <div class="card-photo">
                                    <img src="resources/img/null_img_icon.png" alt="">
                                 </div>
                                 <div class="content-items">
                                    <div class="item-title">
                                       ${alert_item_list.fdPrdtNm } <!-- 습득물 :  물품명 --> 
                                    </div>
                                    <ul class="item-details">
                                       <li class="item-details_01">
                                       ${alert_item_list.fdYmd } <!-- 습득물 : 습득일자 -->
                                       </li>
                                       <li class="item-details_02">
                                       ${alert_item_list.depPlace } <!-- 습득물 : 보관장소 -->                            
                                       </li>
                                       <li class="item-details_03">
                                        ${alert_item_list.prdtClNm } <!-- 습득물 : 물품분류명 -->
                                       </li>
                                    </ul>
                                 </div>
                              </div>
                           </c:when> 
                        </c:choose> 
                     </c:forEach> 
                  </div>
               </c:forEach>
            </div>
         </table>

         <!-- page -->
         <div class="result-container">
            <!-- 페이징 프레임시작 -->
            <div class="page-container">
               <div class="currentOftotal">
                  <span>Page</span><span class="current-page">${pageVO.page}</span><span>of</span><span
                     class="total-page">${pageVO.totPage}</span>
               </div>
               <ul class="pagelist-container">
                  <li class="btn-prev"><a class="test"
                     href="mypage_customer_inquiry_list_page?page=${pageVO.page - 1}">
                        <img src="resources/img/chevron-left.png" alt="">
                  </a></li>
                  <c:forEach begin="${pageVO.pageStart}" end="${pageVO.pageEnd}"
                     var="i">
                     <c:choose>
                        <c:when test="${i eq pageVO.page}">
                           <li><a href="#" style="color: red">${i}</a></li>
                        </c:when>
                        <c:otherwise>
                           <li><a href="mypage_customer_inquiry_list_page?page=${i}">${i}</a></li>
                        </c:otherwise>
                     </c:choose>
                  </c:forEach>
                  <li class="btn-next"><a
                     href="mypage_customer_inquiry_list_page?page=${pageVO.page + 1}"><img
                        src="resources/img/chevron-left.png" alt=""></a></li>
               </ul>

               <ul class="switchBtn-container">
                  <li class="btn-prev-group"><a
                     href="mypage_customer_inquiry_list_page?page=${pageVO.page - 1}">Previous</a></li>
                  <li class="btn-next-group"><a
                     href="mypage_customer_inquiry_list_page?page=${pageVO.page + 1}">Next</a></li>
               </ul>
            </div>
            <!-- 페이징 프레임 끝 -->
         </div>

      </div>
   </div>
</body>
</html>