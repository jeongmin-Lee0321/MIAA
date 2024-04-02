<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kor">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="resources/css/missing_ani_write_page.css">
  <title>Document</title>
  <style>
    body {
      margin: 0px;
      padding: 0px;
      font-family: "Noto Sans KR", sans-serif;
      font-optical-sizing: auto;
      font-weight: 500;
      font-style: normal;
    }
  </style>
</head>

<body>
  <div class="main-container">
    <div class="main-selection">
      <div class="index">
        <span>실종동물</span><span>></span><span>실종동물 등록</span>
      </div>
      <div class="main-selection-flex">
        <div class="main-selection-ex">
          <div class="title">
            실종동물 등록
          </div>
          <div class="describe">
            실종된 동물을 등록하시면 내정보 알림게시판에서 보호동물에 대한 정보를 받아보실 수 있습니다.
          </div>
        </div>
      </div>
    </div>

    <div class="main-contents">
      <ul class="top-btns">
        <li><button type="submit">게시물 등록</button></li>
        <li><button type="button">취소하기</button></li>
      </ul>
      <div class="essential">
        <span>*는 필수 입력사항 입니다</span>
      </div>
      <!-- form 시작 -->
      <form action="missing_ani_write">
        <!-- table1 -->
        <div class="table-container">
          <div class="table-title"><img src="resources/img/clipboard.png" alt=""><span>보호자 정보</span></div>
          <div class="table">
            <div class="table-row">
              <div class="row-title"><span>연락처</span></div>
              <div class="row-content"><input type="tel" name="tel" id="tel">-<input type="tel" name="tel"
                  id="tel">-<input type="tel" name="tel" id="tel"></div>
            </div>
            <div class="table-row">
              <div class="row-title"><span>공개여부*</span></div>
              <div class="row-content">
                <div class="radio-container"><input type="radio" name="openclose" id="openclose"
                    value="open"><span>공개</span></div>
                <div class="radio-container"><input type="radio" name="openclose" id="openclose" value="close"
                    checked><span>비공개</span></div>
              </div>
            </div>
          </div>
        </div>
        <!-- table2 -->
        <div class="table-container">
          <div class="table-title"><img src="resources/img/clipboard.png" alt=""><span>실종일시 및 장소</span></div>
          <div class="table">
            <div class="table-row">
              <div class="row-title"><span>실종날짜*</span></div>
              <div class="row-content"><input type="date" name="lostday" id="lostday"></div>
            </div>
            <div class="table-row">
              <div class="row-title"><span>실종장소*</span></div>
              <div class="col-content">
                <div class="zip-container">
                  <input type="text" id="zip-code" placeholder="우편번호" readonly>
                  <button type="button" onclick="sample6_execDaumPostcode()"><span>우편번호검색</span></button>
                </div>
                <div class="addr-container">
                  <input type="text" id="sample6_address" name="address" placeholder="도로명주소" readonly>
                  <input type="text" id="sample6_extraAddress" name="address2" placeholder="상세주소" readonly>
                </div>
              </div>
            </div>
            <div class="table-row">
              <div class="row-title"><span>관할지*</span></div>
              <div class="row-content">
                <select name="" id="">
                  <option value="">부산광역시</option>
                </select>
                <select name="" id="">
                  <option value="">동구</option>
                </select>
              </div>
            </div>
          </div>
        </div>
        <!-- table3 -->
        <div class="table-container">
          <div class="table-title"><img src="resources/img/clipboard.png" alt=""><span>실종동물 정보</span></div>
          <div class="table">

            <div class="table-row">
              <div class="row-title"><span>이름*</span></div>
              <div class="row-content"><input type="text" name="animalname" id="animalname"></div>
            </div>
            <div class="table-row">
              <div class="row-title"><span>품종*</span></div>
              <div class="row-content">
                <select onchange="animalkind(this)" id=animalkind1 name="animalkind1">
                  <option>축종 선택</option>
                  <option value="a">강아지</option>
                  <option value="b">고양이</option>
                  <option value="c">기타</option>
                </select>
                <select name="animalkind2" id="animalkind2">
                  <option>품종 선택</option>
                </select>
                <input type="text" placeholder="축종기타 선택시 입력" readonly style="width: 222px;">
              </div>
            </div>
            <div class="table-row">
              <div class="row-title"><span>성별*</span></div>
              <div class="row-content">
                <div class="radio-container"><input type="radio" name="sexCd" id="sexCd" value="F"
                    checked><span>암컷</span></div>
                <div class="radio-container"><input type="radio" name="sexCd" id="sexCd" value="M"><span>수컷</span></div>
              </div>
            </div>

            <div class="table-multi-row">
              <div class="table-row">
                <div class="row-title"><span>색상*</span></div>
                <div class="row-content">
                  <select name="colorCd" id="colorCd">
                    <option>색상을 선택하세요</option>
                    <option value="흰색">흰색</option>
                    <option value="검은색">검은색</option>
                    <option value="갈색">갈색</option>
                  </select>
                </div>
              </div>
              <div class="table-row">
                <div class="row-title"><span>나이*</span></div>
                <div class="row-content">
                  <input type="text" name="age" id="age">
                </div>
              </div>
            </div>

            <div class="table-row">
              <div class="row-title"><span>특징*</span></div>
              <div class="row-content" id="textarea-content">
                <!-- 텍스트제한 표시 추가 필요 -->
                <textarea name="sepcialMark" id="sepcialMark" maxlength="300" placeholder="텍스트를 입력하세요."></textarea>
              </div>
            </div>
            <!-- 파일형식 제한 필요 -->
            <div class="table-row">
              <div class="row-title"><span>사진첨부</span></div>
              <div class="col-content">
                <div class="in-row-content">
                  <input type="file" name="" id="file1" accept="image/*">
                  <label for="file1">사진첨부</label>
                </div>
                <div class="in-row-content">
                  <input type="file" name="" id="file1" accept="image/*">
                  <label for="file1">사진첨부</label>
                </div>
                <div class="in-row-content">
                  <input type="file" name="" id="file1" accept="image/*">
                  <label for="file1">사진첨부</label>
                </div>
                <div class="in-row-content">
                  <input type="file" name="" id="file1" accept="image/*">
                  <label for="file1">사진첨부</label>
                </div>
                <div class="in-row-content">
                  <input type="file" name="" id="file1" accept="image/*">
                  <label for="file1">사진첨부</label>
                </div>
                <div class="image-ex-text">*첨부파일은 한개당 3mb까지 제한되고 확장자는 JPEG,GIF,PNG로 제한됩니다. </div>
              </div>
            </div>
          </div>
        </div>

        <ul class="bottom-btns">
          <li><button type="submit">게시물 등록</button></li>
          <li><button type="button">취소하기</button></li>
        </ul>
        <!-- hidden 세션로그인 id -->
        <input type="hidden" name="userId" value="${userId }">
      </form>
      <!-- form 끝 -->
    </div>
  </div>
  <script>
    //주소록 찾기
    function sample6_execDaumPostcode() {
      new daum.Postcode(
        {
          oncomplete: function (data) {
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
            }
            if (data.userSelectedType === 'R') {
              if (data.bname !== ''
                && /[동|로|가]$/g.test(data.bname)) {
                extraAddr += data.bname;
              }
              if (data.buildingName !== ''
                && data.apartment === 'Y') {
                extraAddr += (extraAddr !== '' ? ', '
                  + data.buildingName
                  : data.buildingName);
              }
              if (extraAddr !== '') {
                extraAddr = ' (' + extraAddr + ')';
              }
              document.getElementById("sample6_extraAddress").value = extraAddr;

            } else {
              document.getElementById("sample6_extraAddress").value = '';
            }

            document.getElementById("sample6_address").value = addr;
          }
        }).open();
    }
  </script>
  <script>
    //분류표 선택 
    function animalkind(e) {
      var kind_a = ["요크셔테리어", "불독", "진도개"];
      var kind_b = ["집고양이", "거리고양이", "점박고양이"];
      var kind_c = ["새", "물고기", "곤충"];
      var target = document.getElementById("animalkind2");

      if (e.value == "a")
        var d = kind_a;
      else if (e.value == "b")
        var d = kind_b;
      else if (e.value == "c")
        var d = kind_c;
      target.options.length = 0;

      for (x in d) {
        var opt = document.createElement("option");
        opt.value = d[x];
        opt.innerHTML = d[x];
        target.appendChild(opt);
      }
    }
  </script>
</body>

</html>