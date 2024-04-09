<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/main_contents.css" />
<title>Insert title here</title>
</head>
<body>
      <div class="main-contents">
        <!-- 검색창과 검색결과 -->
        <div class="searchbar-container">
          <form action="#">
            <!-- 서치바 셀렉 그룹시작 -->
            <div class="searchbar-select-group">
              <div class="searchbar-title">
                <span>기간</span>
              </div>
              <div class="searchbar-content">
                <input type="date" name="" id="">
                <span>~</span>
                <input type="date" name="" id="">
                <span>(분실일 기준)</span>
              </div>
            </div>

            <!-- 멀티그룹묶음 -->
            <div class="searchbar-mutil-group">
              <div class="searchbar-title">
                <span>분실지역</span>
              </div>
              <div class="searchbar-select-group">
                <div class="searchbar-title">
                  <span>시도</span>
                </div>
                <div class="searchbar-content">
                  <select name="" id="">
                    <option value="부산광역시">부산광역시</option>
                    <option value="서울특별시">서울특별시</option>
                  </select>
                </div>
              </div>
              <div class="searchbar-select-group">
                <div class="searchbar-title">
                  <span>시군구</span>
                </div>
                <div class="searchbar-content">
                  <select name="" id="">
                    <option value="구로구">구로구</option>
                    <option value="영등포구">영등포구</option>
                  </select>
                </div>
              </div>
            </div>

            <div class="searchbar-mutil-group">
              <div class="searchbar-select-group">
                <div class="searchbar-title">
                  <span>품목</span>
                </div>
                <div class="searchbar-content">
                  <select onchange="itemkind(this)" id=itemkind1 name="itemkind1">
                  <option>대분류</option>
                  <option value="PRI000">컴퓨터</option>
                  <option value="PRJ000">휴대폰</option>
                  <option value="PRH000">지갑</option>
                  <option value="PRG000">전자기기</option>
                  <option value="PRD000">산업용품</option>
                  <option value="PRO000">귀금속</option>
                  <option value="PRZ000">기타물품</option>
                  <option value="PRE000">스포츠용품</option>
                  <option value="PRF000">자동차</option>
                  <option value="PRL000">현금</option>
                  <option value="PRK000">의류</option>
                  <option value="PRQ000">쇼핑백</option>
                  <option value="PRR000">악기</option>
                  <option value="PRP000">카드</option>
                  <option value="PRM000">유가증권</option>
                  <option value="PRN000">증명서</option>
                  <option value="PRA000">가방</option>
                  <option value="PRB000">도서용품</option>
                  <option value="PRX000">유류품</option>
                </select>
                  <span>-</span>
                  <select name="itemkind2" id="itemkind2">
                  <option>중분류</option>
                </select>
                </div>
              </div>
              <div class="searchbar-select-group">
                <div class="searchbar-title">
                  <span>색상</span>
                </div>
                <div class="searchbar-content">
                  <select name="colorCd" id="colorCd">
                    <option>색상을 선택하세요</option>
                    <option value="CL1001">흰색</option>
                    <option value="CL1002">검정</option>
                    <option value="CL1003">빨강</option>
                    <option value="CL1004">주황</option>
                    <option value="CL1005">노랑</option>
                    <option value="CL1006">초록</option>
                    <option value="CL1007">파랑</option>
                    <option value="CL1008">갈색</option>
                    <option value="CL1009">보라</option>
                    <option value="CL1010">핑크</option>
                    <option value="CL1011">기타</option>
                  </select>
                </div>
              </div>
            </div>

            <div class="searchbar-select-group">
              <div class="searchbar-title">
                <span>분실물명</span>
              </div>
              <div class="searchbar-content">
                <input type="search" name="q" id="q" style="min-width: 300px; ">
              </div>
            </div>

            <!-- form 조회용 버튼 -->
            <div class="search-btn-block">
              <button>
                조회<img src="resources/img/searchIcon.png" alt="">
              </button>
            </div>
          </form>
        </div>
        <!-- 검색창과 검색결과 끝 -->

        <!-- result-container시작 -->

        <div class="result-container">
          <!-- 결과 리스트 총 갯수 프레임 -->
          <div class="total-resultNum-wrapper">
            <div class="total-resultNum-container">
              <span>전체 </span><span class="totalNum">${totalCount }</span><span>건</span>
            </div>
          </div>

          <!-- 검색 결과 리스트프레임 -->
          <div class="result-list">

            <!-- 목록1개가 list-card -->
			<c:forEach items="${itemList }" var="itemList">
            <div class="list-card" onclick="location.href='lost_item_detail_page?total_id=${itemList.total_id }';" style="cursor: pointer;">
              <div class="card-photo">
              	<img src="${itemList.filename}">
              </div>
              <div class="content-items">
                <div class="item-title">
                  <span>${itemList.item_name } </span>
                </div>
                <ul class="item-details">
                  <li><span class="detail-title">분실날짜:</span><span>${itemList.lostday }</span></li>
                  <li><span class="detail-title">물품분류:</span><span>${itemList.upr_cd }</span></li>
                  <li><span class="detail-title">분실장소:</span><span>${itemList.address }</span></li>
                  <li><span class="detail-title">특징:</span><span>${itemList.sepcialmark }</span></li>
                </ul>
              </div>
            </div>
			</c:forEach>

          </div>
          <!-- 검색결과 리스트 프레임 끝 -->
        <!-- 페이징 프레임시작 -->
        <div class="page-container">
            <div class="currentOftotal">
                <span>Page</span><span class="current-page">${pageVo.page}</span><span>of</span><span
                    class="total-page">${pageVo.totPage}</span>
            </div>
            <ul class="pagelist-container">
                <li class="btn-prev"><a class="test" href="lost_item_search_page?page=${pageVo.page - 1}"><img
                        src="resources/img/chevron-left.png" alt=""></a></li>
                <c:forEach begin="${pageVo.pageStart}" end="${pageVo.pageEnd}" var="i">
                    <c:choose>
                        <c:when test="${i eq pageVo.page}">
                            <li><a href="#" style="color: red">${i}</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="lost_item_search_page?page=${i}">${i}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <li class="btn-next"><a href="lost_item_search_page?page=${pageVo.page + 1}"><img
                        src="resources/img/chevron-left.png" alt=""></a></li>
            </ul>

            <ul class="switchBtn-container">
                <li class="btn-prev-group"><a href="lost_item_search_page?page=${pageVo.page - 1}">Previous</a></li>
                <li class="btn-next-group"><a href="lost_item_search_page?page=${pageVo.page + 1}">Next</a></li>
            </ul>
        </div>
        <!-- 페이징 프레임 끝 -->
        </div>
        <!-- result-container끝 -->
      </div>
      
</body>