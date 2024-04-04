<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/mypage_matching_alarm_list02_page.css"/>

<!-- 원진호_ajax라이브러리 추가 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


</head>
<body>
 <div class="main-body">
 <div class="content-wrapper">
            <div class="content-container">
                <div class="list-control-container">
                    <select id="content-select">
                        <option value="전체">전체</option>
                        <option value="물건">물건</option>
                        <option value="동물">동물</option>
                    </select>
                  <!--   <div class="delete_btn_set"> -->
	                    <button class="btn-list" id="btn-off-alert">
	                        <img src="resources/img/bell-off.png" alt="">
	                        	해당 알림제거
	                    </button>
	                    <button class="btn-delete" id="btn-delete">원글삭제</button>
                    <!-- </div> -->
                </div>
                <table class="info-table">
                    <tr>
                        <th class="table-check">
                            <input type="checkbox" name="" id="" class="table-check-box">
                        </th>
                        <th class="table-classification-title" colspan="7">게시목록</th>
                    </tr>
                    <tr>
                        <td class="table-check">
                            <input type="checkbox" name="" id="" class="table-check-box">
                        </td>
                        <td class="table-classification" colspan="6">
                            <div class="registrationed_alarm_keywords_list">
                                <div>에어팟<br/></div>
                                <a href="$$$" class="item_tag_01">물건</a> 
                                <a href="$$$" class="item_tag_02">에어팟</a> 
                                <a href="$$$" class="item_tag_03">2024-03-06시경</a>
                                <a href="$$$" class="item_tag_04">전자기기 > 무선이어폰</a> 
                                <a href="$$$" class="item_tag_05">월게,이마트,트레이더스</a>                        
                            </div> 
                        </td>
                        <td class="table-ctrl">
                            <img src="resources/img/delete_can.png" alt="" class="delete_can_icon">
                        </td>
                    </tr>
                    <tr>
                        <td class="table-check">
                            <input type="checkbox" name="" id="" class="table-check-box">
                        </td>
                        <td class="table-classification" colspan="6">
                            <div class="registrationed_alarm_keywords_list">
                                <div>에어팟<br/></div>
                                <a href="$$$" class="item_tag_01">물건</a> 
                                <a href="$$$" class="item_tag_02">에어팟</a> 
                                <a href="$$$" class="item_tag_03">2024-03-06시경</a>
                                <a href="$$$" class="item_tag_04">전자기기 > 무선이어폰</a> 
                                <a href="$$$" class="item_tag_05">월게,이마트,트레이더스</a>                        
                            </div> 
                        </td>                     
                        <td class="table-ctrl">
                            <img src="resources/img/delete_can.png" alt="" class="delete_can_icon">
                        </td>
                    </tr>
                    <tr>
                        <td class="table-check">
                            <input type="checkbox" name="" id="" class="table-check-box">
                        </td>
                        <td class="table-classification" colspan="6">
                            <div class="registrationed_alarm_keywords_list">
                                <div>에어팟<br/></div>
                                <a href="$$$" class="item_tag_01">물건</a> 
                                <a href="$$$" class="item_tag_02">에어팟</a> 
                                <a href="$$$" class="item_tag_03">2024-03-06시경</a>
                                <a href="$$$" class="item_tag_04">전자기기 > 무선이어폰</a> 
                                <a href="$$$" class="item_tag_05">월게,이마트,트레이더스</a>                        
                            </div> 
                        </td>
                        <td class="table-ctrl">
                            <img src="resources/img/delete_can.png" alt="" class="delete_can_icon">
                        </td>
                    </tr>                  
                </table>
            </div> 
            </div>    
        <div class="result-container">
            <div class="page-container">
                <div class="currentOftotal">
                    <span>Page</span><span class="current-page">1</span><span>of</span><span class="total-page">10</span>
                </div>
                <ul class="pagelist-container">
                    <li class="btn-prev">
                        <a class="test" href="#"><img src="resources/img/chevron-right.png" alt=""></a>
                    </li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">6</a></li>
                    <li><a href="#">7</a></li>
                    <li><a href="#">8</a></li>
                    <li><a href="#">9</a></li>
                    <li><a href="#">10</a></li>
                    <li class="btn-next">
                        <a href="#"><img src="resources/img/chevron-left.png" alt=""></a>
                    </li>
                </ul>  
                <ul class="switchBtn-container">
                    <li class="btn-prev-group"><a href="#">Previous</a></li>
                    <li class="btn-next-group"><a href="#">Next</a></li>
                </ul>
            </div>
        </div>
         
        </div>
    </div>
    
    
    
    
   <!--  <!-- Ajax 태스트 -->
    <script>
    	$(document).ready(function(){
    		$("")
    	})
    </script> -->
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
</body>
</html>