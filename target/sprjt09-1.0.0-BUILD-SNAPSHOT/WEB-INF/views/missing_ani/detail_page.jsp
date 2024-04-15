<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="resources/css/ani_detail_page.css">
</head>
<div class="main-body">
    <div class="main-selection">
        <div class="page-route">
            <span>실종동물>상세검색>실종동물 상세페이지</span>
        </div>
        <div class="selection-name">
            <span>실종동물 상세페이지</span>
        </div>
        <div class="selection-explain">
            <span>소중한 반려동물이 실종되었습니다. 아래와 같은 동물을 발견하셨다면 관할기관에 맡겨주세요.</span>
        </div>
        <div class="btn-top-container">
            <button class="btn-list" id="btn-top-list-edit">게시물 수정</button>
            <button class="btn-list" id="btn-top-list-delete">게시물 삭제</button>
            <button class="btn-list" id="btn-top-list-report">게시물 신고</button>
            <button class="btn-list" id="btn-top-missing-list">목록으로</button>
        </div>
    </div>

    <div class="image-selection">
        <div class="image-container">
            <img src="resources/img/chevron-left.png" alt="" id="chevron-left">
            <img src="resources/img/media.png" alt="" id="ani-image">
            <img src="resources/img/chevron-right.png" alt="" id="chevron-right">
        </div>

    </div>

    <div class="ani-info">
        <div class="info-name-container">
            <img src="resources/img/clipboard.png" alt="" class="info-icon">
            <span class="info-name">동물정보</span>
        </div>
        <table class="info-table">
            <tr>
                <th class="info-table-name">이름</th>
                <td class="info-table-value">
                    <div class="table-value-container" id="ani-name">하루</div>
                </td>
                <th class="info-table-name">동물종류</th>
                <td class="info-table-value">
                    <div class="table-value-container" id="kind">개</div>
                </td>
            </tr>
            <tr>
                <th class="info-table-name">품종</th>
                <td class="info-table-value">
                    <div class="table-value-container" id="kind_cd">믹스견</div>
                </td>
                <th class="info-table-name">색상</th>
                <td class="info-table-value">
                    <div class="table-value-container" id="color_cd">흰색</div>
                </td>
            </tr>
            <tr>
                <th class="info-table-name">성별</th>
                <td class="info-table-value">
                    <div class="table-value-container" id="sex_cd">암컷</div>
                </td>
                <th class="info-table-name">중성화 여부</th>
                <td class="info-table-value">
                    <div class="table-value-container" id="neuter_yn">아니오</div>
                </td>
            </tr>
            <tr>
                <th class="info-table-name">체중</th>
                <td class="info-table-value">
                    <div class="table-value-container" id="weight">2.3kg</div>
                </td>
                <th class="info-table-name">나이</th>
                <td class="info-table-value">
                    <div class="table-value-container" id="age">2개월</div>
                </td>
            </tr>
            <tr>
                <th class="info-table-name">특징</th>
                <td class="info-table-value" colspan="3">
                    <div class="table-value-container" id="special_mark">
                        adsfsdfasdfasdfasdfasdfasdfasdfadsfasdfasdfasdfasdfasdfasdfasdfasdfasdfsadfasdfasdfasdfasdfasdf
                    </div>
                </td>
            </tr>
        </table>

    </div>

    <div class="missing-info">
        <div class="info-name-container">
            <img src="resources/img/clipboard.png" alt="" class="info-icon">
            <span class="info-name">실정정보</span>
        </div>
        <table class="info-table">
            <tr>
                <th class="info-table-name">실종일</th>
                <td class="info-table-value" colspan="3">
                    <div class="table-value-container" id="missing_dt">2024-03-15</div>
                </td>
            </tr>
            <tr>
                <th class="info-table-name">실종장소</th>
                <td class="info-table-value" colspan="3">
                    <div class="table-value-container" id="missing_place">의창구 덕산리 131-14</div>
                </td>
            </tr>
            <tr>
                <th class="info-table-name">연락처</th>
                <td class="info-table-value" colspan="3">
                    <div class="table-value-container" id="user_tel">010-0311-1111</div>
                </td>
            </tr>

        </table>
    </div>

    <div class="btn-bottom-container">
        <button class="btn-list" id="btn-bottom-list">목록으로</button>
    </div>
</div>
</html>
