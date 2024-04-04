<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="resources/css/main_contents.css"/>
    <script src="/resources/js/jquery-3.7.1.min.js"></script>
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script
            src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript">
        function selectedSido(val) {
            var optionTag = document.getElementById("sigunguSelectBox");
            optionTag.innerHTML = '<option value="">-전체-</option>';

            switch (val) {
                case "6110000" : {
                    optionTag.innerHTML += '<option value="6119999">가정보호</option>' +
                        '<option value="3220000">강남구</option>' +
                        '<option value="3240000">강동구</option>' +
                        '<option value="3080000">강북구</option>' +
                        '<option value="3150000">강서구</option>' +
                        '<option value="3200000">관악구</option>' +
                        '<option value="3040000">광진구</option>' +
                        '<option value="3160000">구로구</option>' +
                        '<option value="3170000">금천구</option>' +
                        '<option value="3100000">노원구</option>' +
                        '<option value="3090000">도봉구</option>' +
                        '<option value="3050000">동대문구</option>' +
                        '<option value="3190000">동작구</option>' +
                        '<option value="3130000">마포구</option>' +
                        '<option value="3120000">서대문구</option>' +
                        '<option value="6119998">서울특별시</option>' +
                        '<option value="3210000">서초구</option>' +
                        '<option value="3030000">성동구</option>' +
                        '<option value="3070000">성북구</option>' +
                        '<option value="3230000">송파구</option>' +
                        '<option value="3140000">양천구</option>' +
                        '<option value="3180000">영등포구</option>' +
                        '<option value="3020000">용산구</option>' +
                        '<option value="3110000">은평구</option>' +
                        '<option value="3000000">종로구</option>' +
                        '<option value="3010000">중구</option>' +
                        '<option value="3060000">중랑구</option>';
                    break;

                }
                case "6260000" : {
                    optionTag.innerHTML += '<option value="3360000">강서구</option>' +
                        '<option value="3350000">금정구</option>' +
                        '<option value="3400000">기장군</option>' +
                        '<option value="3310000">남구</option>' +
                        '<option value="3270000">동구</option>' +
                        '<option value="3300000">동래구</option>' +
                        '<option value="3290000">부산진구</option>' +
                        '<option value="3320000">북구</option>' +
                        '<option value="3390000">사상구</option>' +
                        '<option value="3340000">사하구</option>' +
                        '<option value="3260000">서구</option>' +
                        '<option value="3380000">수영구</option>' +
                        '<option value="3370000">연제구</option>' +
                        '<option value="3280000">영도구</option>' +
                        '<option value="3250000">중구</option>' +
                        '<option value="3330000">해운대구</option>';
                    break;

                }

                case "6270000" : {
                    optionTag.innerHTML += '<option value="5141000">군위군</option>' +
                        '<option value="3440000">남구</option>' +
                        '<option value="3470000">달서구</option>' +
                        '<option value="3480000">달성군</option>' +
                        '<option value="3420000">동구</option>' +
                        '<option value="3450000">북구</option>' +
                        '<option value="3430000">서구</option>' +
                        '<option value="3460000">수성구</option>' +
                        '<option value="3410000">중구</option>';
                    break;

                }

                case "6280000" : {
                    optionTag.innerHTML += '<option value="3570000">강화군</option>' +
                        '<option value="3550000">계양구</option>' +
                        '<option value="3530000">남동구</option>' +
                        '<option value="3500000">동구</option>' +
                        '<option value="3510500">미추홀구</option>' +
                        '<option value="3540000">부평구</option>' +
                        '<option value="3560000">서구</option>' +
                        '<option value="3520000">연수구</option>' +
                        '<option value="3580000">옹진군</option>' +
                        '<option value="3490000">중구</option>';
                    break;

                }

                case "6290000" : {
                    optionTag.innerHTML = '<option value="6299998">광산구</option>' +
                        '<option value="6299998">광주광역시</option>' +
                        '<option value="3610000">남구</option>' +
                        '<option value="3590000">동구</option>' +
                        '<option value="3620000">북구</option>' +
                        '<option value="3600000">서구</option>';
                    break;

                }

                case "5690000" : {
                    break;

                }

                case "6300000" : {
                    optionTag.innerHTML += '<option value="3680000">대덕구</option>' +
                        '<option value="3640000">동구</option>' +
                        '<option value="3660000">서구</option>' +
                        '<option value="3670000">유성구</option>' +
                        '<option value="3650000">중구</option>';
                }

                case "6310000" : {
                    optionTag.innerHTML += '<option value="3700000">남구</option>' +
                        '<option value="3710000">동구</option>' +
                        '<option value="3720000">북구</option>' +
                        '<option value="3730000">울주군</option>' +
                        '<option value="3690000">중구</option>';
                    break;

                }

                case "6410000" : {
                    optionTag.innerHTML += '<option value="4160000">가평군</option>' +
                        '<option value="3940000">고양시</option>' +
                        '<option value="3970000">과천시</option>' +
                        '<option value="3900000">광명시</option>' +
                        '<option value="5540000">광주시</option>' +
                        '<option value="3980000">구리시</option>' +
                        '<option value="4020000">군포시</option>' +
                        '<option value="5630000">기흥구</option>' +
                        '<option value="4090000">김포시</option>' +
                        '<option value="3990000">남양주시</option>' +
                        '<option value="3920000">동두천시</option>' +
                        '<option value="3860000">부천시</option>' +
                        '<option value="3780000">성남시</option>' +
                        '<option value="3740000">수원시</option>' +
                        '<option value="4010000">시흥시</option>' +
                        '<option value="3930000">안산시</option>' +
                        '<option value="4080000">안성시</option>' +
                        '<option value="3830000">안양시</option>' +
                        '<option value="5590000">양주시</option>' +
                        '<option value="4170000">양평군</option>' +
                        '<option value="5700000">여주시</option>' +
                        '<option value="4140000">연천군</option>' +
                        '<option value="4000000">오산시</option>' +
                        '<option value="4050000">용인시</option>' +
                        '<option value="4030000">의왕시</option>' +
                        '<option value="3820000">의정부시</option>' +
                        '<option value="4070000">이천시</option>' +
                        '<option value="4060000">파주시</option>' +
                        '<option value="3910000">평택시</option>' +
                        '<option value="5600000">포천시</option>' +
                        '<option value="4040000">하남시</option>' +
                        '<option value="5530000">화성시</option>';
                    break;

                }

                case "6530000" : {
                    optionTag.innerHTML += '<option value="4201000">강릉시</option>' +
                        '<option value="4341000">고성군</option>' +
                        '<option value="4211000">동해시</option>' +
                        '<option value="4241000">삼척시</option>' +
                        '<option value="4231000">속초시</option>' +
                        '<option value="4321000">양구군</option>' +
                        '<option value="4351000">양양군</option>' +
                        '<option value="4271000">영월군</option>' +
                        '<option value="4191000">원주시</option>' +
                        '<option value="4331000">인제군</option>' +
                        '<option value="4291000">정선군</option>' +
                        '<option value="4301000">철원군</option>' +
                        '<option value="4181000">춘천시</option>' +
                        '<option value="4221000">태백시</option>' +
                        '<option value="4281000">평창군</option>' +
                        '<option value="4251000">홍천군</option>' +
                        '<option value="4311000">화천군</option>' +
                        '<option value="4261000">횡성군</option>';
                    break;

                }

                case "6430000" : {
                    optionTag.innerHTML += '<option value="4460000">괴산군</option>' +
                        '<option value="4480000">단양군</option>' +
                        '<option value="4420000">보은군</option>' +
                        '<option value="4440000">영동군</option>' +
                        '<option value="4430000">옥천군</option>' +
                        '<option value="4470000">음성군</option>' +
                        '<option value="4400000">제천시</option>' +
                        '<option value="5570000">증평군</option>' +
                        '<option value="4450000">진천군</option>' +
                        '<option value="5710000">청주시</option>' +
                        '<option value="4390000">충주시</option>';
                    break;

                }

                case "6440000" : {
                    optionTag.innerHTML += '<option value="5580000">계룡시</option>' +
                        '<option value="4500000">공주시</option>' +
                        '<option value="4550000">금산군</option>' +
                        '<option value="4540000">논산시</option>' +
                        '<option value="5680000">당진시</option>' +
                        '<option value="4510000">보령시</option>' +
                        '<option value="4570000">부여군</option>' +
                        '<option value="4530000">서산시</option>' +
                        '<option value="4580000">서천군</option>' +
                        '<option value="4520000">아산시</option>' +
                        '<option value="4560000">연기군</option>' +
                        '<option value="4610000">예산군</option>' +
                        '<option value="4490000">천안시</option>' +
                        '<option value="4590000">청양군</option>' +
                        '<option value="4620000">태안군</option>' +
                        '<option value="4600000">홍성군</option>';
                    break;

                }

                case "6540000" : {
                    optionTag.innerHTML += '<option value="4781000">고창군</option>' +
                        '<option value="4671000">군산시</option>' +
                        '<option value="4711000">김제시</option>' +
                        '<option value="4701000">남원시</option>' +
                        '<option value="4741000">무주군</option>' +
                        '<option value="4791000">부안군</option>' +
                        '<option value="4771000">순창군</option>' +
                        '<option value="4721000">완주군</option>' +
                        '<option value="4681000">익산시</option>' +
                        '<option value="4761000">임실군</option>' +
                        '<option value="4751000">장수군</option>' +
                        '<option value="4641000">전주시</option>' +
                        '<option value="4691000">정읍시</option>' +
                        '<option value="4731000">진안군</option>';
                    break;

                }

                case "6460000" : {
                    optionTag.innerHTML += '<option value="4920000">강진군</option>' +
                        '<option value="4880000">고흥군</option>' +
                        '<option value="4860000">곡성군</option>' +
                        '<option value="4840000">광양시</option>' +
                        '<option value="4870000">구례군</option>' +
                        '<option value="4830000">나주시</option>' +
                        '<option value="4850000">담양군</option>' +
                        '<option value="4800000">목포시</option>' +
                        '<option value="4950000">무안군</option>' +
                        '<option value="4890000">보성군</option>' +
                        '<option value="4820000">순천시</option>' +
                        '<option value="5010000">신안군</option>' +
                        '<option value="4810000">여수시</option>' +
                        '<option value="4970000">영광군</option>' +
                        '<option value="4940000">영암군</option>' +
                        '<option value="4990000">완도군</option>' +
                        '<option value="4980000">장성군</option>' +
                        '<option value="4910000">장흥군</option>' +
                        '<option value="5000000">진도군</option>' +
                        '<option value="4960000">함평군</option>' +
                        '<option value="4930000">해남군</option>' +
                        '<option value="4900000">화순군</option>';
                    break;

                }

                case "6470000" : {
                    optionTag.innerHTML += '<option value="5130000">경산시</option>' +
                        '<option value="6479998">경상북도</option>' +
                        '<option value="5050000">경주시</option>' +
                        '<option value="5200000">고령군</option>' +
                        '<option value="5080000">구미시</option>' +
                        '<option value="5060000">김천시</option>' +
                        '<option value="5120000">문경시</option>' +
                        '<option value="5240000">봉화군</option>' +
                        '<option value="5110000">상주시</option>' +
                        '<option value="5210000">성주군</option>' +
                        '<option value="5070000">안동시</option>' +
                        '<option value="5180000">영덕군</option>' +
                        '<option value="5170000">영양군</option>' +
                        '<option value="5090000">영주시</option>' +
                        '<option value="5100000">영천시</option>' +
                        '<option value="5230000">예천군</option>' +
                        '<option value="5260000">울릉군</option>' +
                        '<option value="5250000">울진군</option>' +
                        '<option value="5150000">의성군</option>' +
                        '<option value="5190000">청도군</option>' +
                        '<option value="5160000">청송군</option>' +
                        '<option value="5220000">칠곡군</option>' +
                        '<option value="5020000">포항시</option>';
                    break;

                }

                case "6480000" : {
                    optionTag.innerHTML += '<option value="5370000">거제시</option>' +
                        '<option value="5470000">거창군</option>' +
                        '<option value="5420000">고성군</option>' +
                        '<option value="5350000">김해시</option>' +
                        '<option value="5430000">남해군</option>' +
                        '<option value="5360000">밀양시</option>' +
                        '<option value="5340000">사천시</option>' +
                        '<option value="5450000">산청군</option>' +
                        '<option value="5380000">양산시</option>' +
                        '<option value="5390000">의령군</option>' +
                        '<option value="5310000">진주시</option>' +
                        '<option value="5410000">창녕군</option>' +
                        '<option value="5320000">창원시</option>' +
                        '<option value="5280000">창원시</option>' +
                        '<option value="5670000">창원시</option>' +
                        '<option value="5330000">통영시</option>' +
                        '<option value="5440000">하동군</option>' +
                        '<option value="5400000">함안군</option>' +
                        '<option value="5460000">함양군</option>' +
                        '<option value="5480000">합천군</option>' +
                        '<option value="6489999"></option>';
                    break;

                }

                case "6500000" : {
                    optionTag.innerHTML += '<option value="6520000">서귀포시</option>' +
                        '<option value="6510000">제주시</option>' +
                        '<option value="6500000">제주특별자치도</option>';
                    break;
                }
            }

        }

        function selectedSidogun(val) {
            var optionTag = document.getElementById("shelterSelectBox");
            optionTag.innerHTML = '<option value="0000000">-전체-</option>';

            alert(val);
            switch (val) {
                case "3220000" : {
                    optionTag.innerHTML += '<option value="311322200900001">한국동물구조관리협회</option>' +
                        '<option value="311322202000001">우리동물병원생명사회</option>' +
                        '<option value="311322202100003">사랑이있는동물병원</option>' +
                        '<option value="311322202100004">영국동물병원</option>' +
                        '<option value="311322202400001">송파원동물병원</option>';
                    break;
                }
                case "3240000" : {
                    optionTag.innerHTML += '<option value="311324201600004">GD동물병원</option>' +
                        '<option value="311324201600002">둔촌동물병원</option>' +
                        '<option value="311324201600001">강동구청 반려동물팀</option>' +
                        '<option value="311324201700002">강동리본센터</option>' +
                        '<option value="311324201200001">한국동물구조관리협회</option>' +
                        '<option value="311324202200001">가람동물병원</option>';
                    break;
                }
            }
        }
    </script>

    <title>Insert title here</title>
</head>
<body>
<div class="main-contents">
    <!-- 검색창과 검색결과 -->
    <div class="searchbar-container">
        <form action="/rescue_ani_search_page" method="post">
            <!-- 서치바 셀렉 그룹시작 -->
            <div class="searchbar-select-group">
                <div class="searchbar-title">
                    <span>기간</span>
                </div>
                <div class="searchbar-content">
                    <input type="date" name="search_str_date" > <span>~</span> <input
                        type="date" name="search_end_date"> <span>(접수일기준)</span>
                </div>
            </div>

            <!-- 멀티그룹묶음 -->
            <div class="searchbar-mutil-group">
                <div class="searchbar-select-group">
                    <div class="searchbar-title">
                        <span>시도</span>
                    </div>
                    <div class="searchbar-content">
                        <select name="sidoSelectBox" id="sidoSelectBox" onchange="selectedSido(this.value);" onselect="{$dto.getsidoSelectBox() }">
                            <option value="">-전체-</option>
                            <option value="6110000">서울특별시</option>
                            <option value="6260000">부산광역시</option>
                            <option value="6270000">대구광역시</option>
                            <option value="6280000">인천광역시</option>
                            <option value="6290000">광주광역시</option>
                            <option value="5690000">세종특별자치시</option>
                            <option value="6300000">대전광역시</option>
                            <option value="6310000">울산광역시</option>
                            <option value="6410000">경기도</option>
                            <option value="6530000">강원특별자치도</option>
                            <option value="6430000">충청북도</option>
                            <option value="6440000">충청남도</option>
                            <option value="6540000">전북특별자치도</option>
                            <option value="6460000">전라남도</option>
                            <option value="6470000">경상북도</option>
                            <option value="6480000">경상남도</option>
                            <option value="6500000">제주특별자치도</option>
                        </select>
                    </div>
                </div>
                <div class="searchbar-select-group">
                    <div class="searchbar-title">
                        <span>시군구</span>
                    </div>
                    <div class="searchbar-content">
                        <select name="sigunguSelectBox" id="sigunguSelectBox" onchange="selectedSidogun(this.value);">
                        </select>
                    </div>
                </div>
<%--                <div class="searchbar-select-group">--%>
<%--                    <div class="searchbar-title">--%>
<%--                        <span>보호센터</span>--%>
<%--                    </div>--%>
<%--                    <div class="searchbar-content">--%>
<%--                        <select name="shelterSelectBox" id="shelterSelectBox">--%>
<%--                            <option value="">-전체-</option>--%>
<%--                        </select>--%>
<%--                    </div>--%>
<%--                </div>--%>
            </div>

            <div class="searchbar-mutil-group">
                <div class="searchbar-select-group">
                    <div class="searchbar-title">
                        <span>축종 및 품종</span>
                    </div>
                    <div class="searchbar-content">
                        <select name="upKindSelectBox">
                            <option value="">-전체-</option>
                            <option value="417000">개</option>
                            <option value="422400">고양이</option>
                            <option value="429900">기타</option>
                        </select>
                        <span>-</span>
                        <select name="kindSelectedBox">
                            <option value="">-전체-</option>
                        </select>
                    </div>
                </div>
                <div class="searchbar-select-group">
                    <div class="searchbar-title">
                        <span>성별</span>
                    </div>
                    <div class="searchbar-content">
                        <select name="sexSelectedBox" id="sexSelectedBox">
                            <option value="">-전체-</option>
                            <option value="1">수컷</option>
                            <option value="2">암컷</option>
                            <option value="3">미상</option>
                        </select>
                    </div>
                </div>
            </div>

            <!-- form 조회용 버튼 -->
            <div class="search-btn-block">
                <button type="submit" id="btn_search">
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
            <c:forEach items="${itemList }" var="item">
                <div class="list-card" onclick="location.href='rescue_ani_detail_page?noticeNo=${item.getNoticeNo() }'" style="cursor: pointer">
                    <div class="card-photo">
                        <img src="${item.getFilename() }" alt="">
                    </div>
                    <div class="content-items">
                        <div class="item-title">
                            <span>${item.getKindCd() }</span>
                        </div>
                        <ul class="item-details">
                            <li><span class="detail-title">구조날짜:</span><span>${item.getHappenDt() }</span></li>
                            <li><span class="detail-title">공고번호:</span><span>${item.getNoticeNo() }</span></li>
                            <li><span class="detail-title">성별:</span><span>${item.getSexCd() }</span></li>
                            <li><span class="detail-title">발견장소:</span><span>${item.getHappenPlace() }</span></li>
                        </ul>
                    </div>
                </div>
            </c:forEach>

        </div>
        <!-- 검색결과 리스트 프레임 끝 -->
        <!-- 페이징 프레임시작 -->
        <div class="page-container">
            <div class="currentOftotal">
                <span>Page</span><span class="current-page">${pageVO.page}</span><span>of</span><span
                    class="total-page">${pageVO.totPage}</span>
            </div>
            <ul class="pagelist-container">
                <li class="btn-prev"><a class="test" href="rescue_ani_search_page?page=${pageVO.page - 1}"><img
                        src="resources/img/chevron-left.png" alt=""></a></li>
                <c:forEach begin="${pageVO.pageStart}" end="${pageVO.pageEnd}" var="i">
                    <c:choose>
                        <c:when test="${i eq pageVO.page}">
                            <li><a href="#" style="color: red">${i}</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="rescue_ani_search_page?page=${i}">${i}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
<%--                <li><a href="#">1</a></li>--%>
<%--                <li><a href="#">2</a></li>--%>
<%--                <li><a href="#">3</a></li>--%>
<%--                <li><a href="#">4</a></li>--%>
<%--                <li><a href="#">5</a></li>--%>
<%--                <li><a href="#">6</a></li>--%>
<%--                <li><a href="#">7</a></li>--%>
<%--                <li><a href="#">8</a></li>--%>
<%--                <li><a href="#">9</a></li>--%>
<%--                <li><a href="#">10</a></li>--%>
                <li class="btn-next"><a href="rescue_ani_search_page?page=${pageVO.page + 1}"><img
                        src="resources/img/chevron-left.png" alt=""></a></li>
            </ul>

            <ul class="switchBtn-container">
                <li class="btn-prev-group"><a href="rescue_ani_search_page?page=${pageVO.page - 1}">Previous</a></li>
                <li class="btn-next-group"><a href="rescue_ani_search_page?page=${pageVO.page + 1}">Next</a></li>
            </ul>
        </div>
        <!-- 페이징 프레임 끝 -->
    </div>
    <!-- result-container끝 -->
</div>
</body>
</html>