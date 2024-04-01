<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="resources/css/mypage_post_list_page.css">
</head>
<body>
<div class="main-body">
    <div class="main-selection">
        <div class="page-route">
            <span>내정보>등록 게시물 관리</span>
        </div>
        <div class="selection-name">
            <span>등록 게시물 관리</span>
        </div>
    </div>
    <div class="content-selection">

        <div class="search-container">
            <select name="" id="">
                <option value="전체">전체</option>
                <option value="제목">제목</option>
                <option value="내용">내용</option>
            </select>
            <div class="searchbar-content">
                <input type="search" name="q" id="q" style="min-width: 300px; " placeholder="Search">
                <img src="search.png" alt="">
            </div>
        </div>

        <div class="keyword-container">
            <a href="">등록된키워드(5개)</a>
        </div>

        <div class="content-container">
            <div class="list-control-container">
                <select name="" id="content-select">
                    <option value="전체">전체</option>
                    <option value="물건">물건</option>
                    <option value="동물">동물</option>
                </select>
                <button class="btn-list" id="btn-set-alert">
                    <img src="resources/img/Bell.png" alt="">
                    알림설정
                </button>
                <button class="btn-list" id="btn-off-alert">
                    <img src="resources/img/bell-off.png" alt="">
                    알림제거
                </button>
                <button class="btn-list" id="btn-delete">삭제하기</button>
            </div>
            <table class="info-table">
                <tr>
                    <th class="table-check">
                        <input type="checkbox" name="" id="" class="table-check-box">
                    </th>
                    <th class="table-classification">분류</th>
                    <th class="table-img">사진</th>
                    <th class="table-title">게시 제목</th>
                    <th class="table-happen-dt">사건일자</th>
                    <th class="table-happen-place">사건장소</th>
                    <th class="table-alert-yn">알람설정</th>
                    <th class="table-ctrl"></th>
                </tr>
                <tr>
                    <td class="table-check">
                        <input type="checkbox" name="" id="" class="table-check-box">
                    </td>
                    <td class="table-classification">분류</td>
                    <td class="table-img">
                        <img src="resources/img/image_no.png" alt="" class="item-image">
                    </td>
                    <td class="table-title">게시 제목</td>
                    <td class="table-happen-dt">사건일자</td>
                    <td class="table-happen-place">사건장소</td>
                    <td class="table-alert-yn">알람설정</td>
                    <td class="table-ctrl">
                        <img src="resources/img/trash_icn.png" alt="" class="ctrl-icon">
                        <img src="resources/img/write_icon.png" alt="" class="ctrl-icon">
                    </td>
                </tr>
                <tr>
                    <td class="table-check">
                        <input type="checkbox" name="" id="" class="table-check-box">
                    </td>
                    <td class="table-classification">분류</td>
                    <td class="table-img">
                        <img src="resources/img/image_no.png" alt="" class="item-image">
                    </td>
                    <td class="table-title">게시 제목</td>
                    <td class="table-happen-dt">사건일자</td>
                    <td class="table-happen-place">사건장소</td>
                    <td class="table-alert-yn">알람설정</td>
                    <td class="table-ctrl">
                        <img src="resources/img/trash_icn.png" alt="" class="ctrl-icon">
                        <img src="resources/img/write_icon.png" alt="" class="ctrl-icon">
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
</body>
</html>
