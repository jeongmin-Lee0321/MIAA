<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="resources/css/mypage_matching_alarm_list_detail_page.css">
</head>
<div class="main-body">
    <div class="main-selection">
        <div class="page-route">
            <span>내정보>매칭 알림 목록>알림목록상세</span>
        </div>
        <div class="selection-name">
            <span>알람목록상세</span>
        </div>
        <div class="selection-explain">
            <span>더 이상 해당 알람을 받고 싶지 않으시면 등록게시물 관리 또는 현재 페이지에서 제거 가능 합니다.</span>
        </div>
    </div>

    <div class="content-selection">

        <div class="content-container">

            <div class="list-control-container">
                <span id="item-name-text">분실물명 :</span>
                <span id="item-name-value">에어팟</span>
                <button class="btn-list" id="btn-off-alert">
                    <img src="resources/img/bell-off.png" alt="">
                    알림제거
                </button>
                <button class="btn-list" id="btn-delete">선택 목록 삭제</button>
            </div>
            <div class="registrationed_alarm_keywords_list">
                <a href="$$$" class="item_tag">물건</a>
                <a href="$$$" class="item_tag">에어팟</a>
                <a href="$$$" class="item_tag">2024-03-06시경</a>
                <a href="$$$" class="item_tag">전자기기 > 무선이어폰</a>
                <a href="$$$" class="item_tag">월게,이마트,트레이더스</a>
                <a href="$$$" class="show_all_result">매칭된 게시물 총(49개)</a>
            </div>


            <table class="info-table">
                <tr>
                    <th class="table-check">
                        <input type="checkbox" name="" id="" class="table-check-box">
                    </th>
                    <th class="table-img">사진</th>
                    <th class="table-title">게시 제목</th>
                    <th class="table-happen-dt">사건일자</th>
                    <th class="table-happen-place">보관장소/관리번호</th>
                    <th class="table-ctrl"></th>
                </tr>
                <tr>
                    <td class="table-check">
                        <input type="checkbox" name="" id="" class="table-check-box">
                    </td>
                    <td class="table-img">
                        <img src="resources/img/image_no.png" alt="" class="item-image">
                    </td>
                    <td class="table-title">게시 제목</td>
                    <td class="table-happen-dt">사건일자</td>
                    <td class="table-happen-place">
                        <span class="happen-place-value">서울은평경찰서</span>
                        <span class="admin-value">F12391273091724081270</span>
                    </td>
                    <td class="table-ctrl">
                        <img src="resources/img/trash_icon.png" alt="" class="ctrl-icon">
                    </td>
                </tr>
                <tr>
                    <td class="table-check">
                        <input type="checkbox" name="" id="" class="table-check-box">
                    </td>
                    <td class="table-img">
                        <img src="resources/img/image_no.png" alt="" class="item-image">
                    </td>
                    <td class="table-title">게시 제목</td>
                    <td class="table-happen-dt">사건일자</td>
                    <td class="table-happen-place">
                        <span class="happen-place-value">서울은평경찰서</span>
                        <span class="admin-value">F12391273091724081270</span>
                    </td>
                    <td class="table-ctrl">
                        <img src="resources/img/trash_icon.png" alt="" class="ctrl-icon">
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
                    <a class="test" href="#"><img src="resources/img/chevron-left.png" alt=""></a>
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
</html>
