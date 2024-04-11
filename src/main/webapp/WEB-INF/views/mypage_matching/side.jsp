<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/side.css" />
<title>Insert title here</title>
</head>
<body>
	  <div class="side-nav-container">
        <ul class="side-nav">
          <li class="menu-title">알림 페이지</li>
           <!-- 원진호_0409_수정 -->
           <!-- 원진호_0411_<a>태그 링크추가 -->
          <li class="menu-item"><a href="mypage_matching_alarm_list_page">매칭된 알림 목록</a></li>
          <li class="menu-title">등록 게시물 관리</li>
          <li class="menu-item"><a href="#">등록 게시물</a></li>
          <li class="menu-item"><a href="#">&nbsp;&nbsp;분실물</a></li>
          <li class="menu-item"><a href="#">&nbsp;&nbsp;실종동물</a></li>
          <li class="menu-title">1대1 문의 게시판</li>
           <!-- 원진호_0411_<a>태그 링크추가 -->
          <li class="menu-item"><a href="mypage_customer_inquiry_list_page">문의 내역</a></li>
           <!-- 원진호_0411_<a>태그 링크추가 -->
          <li class="menu-item"><a href="mypage_customer_inquiry_write_page">문의글 등록</a></li>
          <li class="menu-title">회원정보수정</li>
          <li class="menu-item"><a href="mypage_modify_account_page">회원정보수정</a></li>
          <li class="menu-title">회원탈퇴</li>
          <li class="menu-item"><a href="mypage_delete_account_page">회원탈퇴</a></li>
        </ul>
      </div>
</body>
</html>