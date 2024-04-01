<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="resources/css/ani_detail_page.css">
</head>
<body>
<div class="main-body">
    <div class="main-selection">
        <div class="page-route">
            <span>분실물>상세검색>분실물 상세페이지</span>
        </div>
        <div class="selection-name">
            <span>분실물 상세페이지</span>
        </div>
        <div class="selection-explain">
            <span>소중한 물건이 분실되었습니다. 아래와 같은 물건을 발견하셨다면 기재된 연락처로 연락해주시기 바랍니다.</span>
        </div>
        <div class="btn-top-container">
            <button class="btn-list" id="btn-top-rescue-list">목록으로</button>
        </div>
    </div>

    <div class="image-selection">
        <div class="image-container">
            <img src="resources/img/chevron-left.png" alt="" id="chevron-left">
            <img src="resources/img/media.png" alt="" id="ani-image">
            <img src="resources/img/chevron-right.png" alt="" id="chevron-right">
        </div>

    </div>

    <div class="found-item-info">
        <div class="info-name-container">
            <img src="resources/img/clipboard.png" alt="" class="info-icon">
            <span class="info-name">물품정보</span>
            <button class="btn-map">지도로 위치 찾기</button>
        </div>
        <table class="info-table">
            <tr>
                <th class="info-table-name">분실물명</th>
                <td class="info-table-value" colspan="3">
                    <div class="table-value-container" id="ist_prdt_nm">
                        주민등록증
                    </div>
                </td>
            </tr>
            <tr>
                <th class="info-table-name">분실일자</th>
                <td class="info-table-value" colspan="3">
                    <div class="table-value-container" id="ist_hor">
                        2024-02-29
                    </div>
                </td>
            </tr>
            <tr>
                <th class="info-table-name">분실장소</th>
                <td class="info-table-value">
                    <div class="table-value-container" id="ist_place">
                        노상
                    </div>
                </td>
                <th class="info-table-name">물품분류</th>
                <td class="info-table-value">
                    <div class="table-value-container" id="prdt_cl_nm">증명서>신분증</div>
                </td>
            </tr>
            <tr>
                <th class="info-table-name">연락처</th>
                <td class="info-table-value" colspan="3">
                    <div class="table-value-container" id="user_tel">
                        010-xxxx-xxxx
                    </div>
                </td>
            </tr>
            <tr>
                <th class="info-table-name" rowspan="3">특징</th>
                <td class="info-table-value" colspan="3" rowspan="3">
                    <div class="table-value-container" id="ist_uniq">
                        주민등록증
                    </div>
                </td>
            </tr>
            <tr></tr>
            <tr></tr>
        </table>
    </div>

    <div class="btn-bottom-container">
        <button class="btn-list" id="btn-bottom-list">목록으로</button>
    </div>
</div>
</body>
</html>