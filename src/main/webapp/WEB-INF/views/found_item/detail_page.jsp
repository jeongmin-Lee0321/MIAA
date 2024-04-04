<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="resources/css/ani_detail_page.css">
</head>
<body>
<div class="main-body">
    <div class="main-selection">
        <div class="page-route">
            <span>습득물>상세검색>습득물 상세페이지</span>
        </div>
        <div class="selection-name">
            <span>습득물 상세페이지</span>
        </div>
        <div class="selection-explain">
            <span>분실하신 물건 여부를 확인하시고, 아래 기재된 보관장소연락처로 관리번호를 말씀해주시기 바랍니다.</span>
        </div>
        <div class="btn-top-container">
            <button class="btn-list" id="btn-top-rescue-list">목록으로</button>
        </div>
    </div>

    <div class="image-selection">
        <div class="image-container">
            <img src="resources/img/chevron-left.png" alt="" id="chevron-left">
            <img src="${dto.fdFilePathImg}" alt="" id="ani-image">
            <img src="resources/img/chevron-right.png" alt="" id="chevron-right">
        </div>

    </div>

    <div class="found-item-info">
        <div class="info-name-container">
            <img src="resources/img/clipboard.png" alt="" class="info-icon">
            <span class="info-name">물품정보</span>
        </div>
        <table class="info-table">
            <tr>
                <th class="info-table-name">습득물명</th>
                <td class="info-table-value" colspan="3">
                    <div class="table-value-container" id="fd_prdt_nm">
                        ${dto.fdPrdtNm}
                    </div>
                </td>
            </tr>
            <tr>
                <th class="info-table-name">습득일자</th>
                <td class="info-table-value" colspan="3">
                    <div class="table-value-container" id="fd_ymd">
                        ${dto.fdYmd}
                    </div>
                </td>
            </tr>
            <tr>
                <th class="info-table-name">습득장소</th>
                <td class="info-table-value">
                    <div class="table-value-container" id="fd_place">
                  ${dto.fdPlace}      
                    </div>
                </td>
                <th class="info-table-name">물품분류</th>
                <td class="info-table-value">
                    <div class="table-value-container" id="prdt_cl_nm">${dto.prdtClNm}</div>
                </td>
            </tr>
            <tr>
                <th class="info-table-name">관리번호</th>
                <td class="info-table-value">
                    <div class="table-value-container" id="atc_ic">
                        ${dto.atcId}
                    </div>
                </td>
                <th class="info-table-name">보관상태</th>
                <td class="info-table-value">
                    <div class="table-value-container" id="cste_ste_nm">${dto.csteSteNm}</div>
                </td>
            </tr>
            <tr>
                <th class="info-table-name" rowspan="3">특징</th>
                <td class="info-table-value" colspan="3" rowspan="3">
                    <div class="table-value-container" id="uniq">
                       ${dto.uniq}
                    </div>
                </td>
            </tr>
            <tr></tr>
            <tr></tr>
        </table>

    </div>

    <div class="rescue-info">
        <div class="info-name-container">
            <img src="resources/img/clipboard.png" alt="" class="info-icon">
            <span class="info-name">보관장소</span>
            <button class="btn-map">지도로 위치 찾기</button>
        </div>
        <table class="info-table">
            <tr>
                <th class="info-table-name">보관장소</th>
                <td class="info-table-value" colspan="3">
                    <div class="table-value-container" id="dep_place">
                        ${dto.depPlace}
                    </div>
                </td>
            </tr>
            <tr>
                <th class="info-table-name">전화번호</th>
                <td class="info-table-value" colspan="3">
                    <div class="table-value-container" id="tel">
                        ${dto.tel}
                    </div>
                </td>
            </tr>

        </table>
    </div>

    <div class="btn-bottom-container">
        <button class="btn-list" id="btn-bottom-list">목록으로</button>
    </div>
</div>
</body>
</html>
