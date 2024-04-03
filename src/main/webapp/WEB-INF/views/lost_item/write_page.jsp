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
  <link rel="stylesheet" href="resources/css/lost_item_write_page.css">
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
        <span>분실물</span><span>></span><span>분실물 등록</span>
      </div>
      <div class="main-selection-flex">
        <div class="main-selection-ex">
          <div class="title">
            분실물 등록
          </div>
          <div class="describe">
            잃어버리신 물품을 등록하시면 내정보 알림게시판에서 습득물에 대한 정보를 받아보실 수 있습니다.
          </div>
        </div>
      </div>
    </div>

      <!-- form 시작 -->
      <form action="lost_item_write" method="post" enctype="multipart/form-data">
    <div class="main-contents">
      <ul class="top-btns">
        <li><button type="submit">게시물 등록</button></li>
        <li><button type="button" onclick="location.href='lost_item_search_page';" style="cursor: pointer;">취소하기</button></li>
      </ul>
      <div class="essential">
        <span>*는 필수 입력사항 입니다</span>
      </div>
        <!-- table1 -->
        <div class="table-container">
          <div class="table-title"><img src="resources/img/clipboard.png" alt=""><span>분실자 정보</span></div>
          <div class="table">
            <div class="table-row">
              <div class="row-title"><span>연락처</span></div>
              <div class="row-content"><input type="tel" name="tel1" id="tel" maxlength="3">-<input type="tel" name="tel2"
                  id="tel" maxlength="4">-<input type="tel" name="tel3" id="tel" maxlength="4"></div>
            </div>
            <div class="table-row">
              <div class="row-title"><span>공개여부*</span></div>
              <div class="row-content">
                <div class="radio-container"><input type="radio" name="openclose" id="openclose"
                    value="true"><span>공개</span></div>
                <div class="radio-container"><input type="radio" name="openclose" id="openclose" value="false"
                    checked><span>비공개</span></div>
              </div>
            </div>
          </div>
        </div>
        <!-- table2 -->
        <div class="table-container">
          <div class="table-title"><img src="resources/img/clipboard.png" alt=""><span>분실일시 및 장소</span></div>
          <div class="table">
            <div class="table-row">
              <div class="row-title"><span>분실날짜*</span></div>
              <div class="row-content"><input type="date" name="lostday" id="lostday" ></div>
            </div>
            <div class="table-row">
              <div class="row-title"><span>분실장소*</span></div>
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
          <div class="table-title"><img src="resources/img/clipboard.png" alt=""><span>분실물품 정보</span></div>
          <div class="table">

            <div class="table-row">
              <div class="row-title"><span>품명*</span></div>
              <div class="row-content"><input type="text" name="itemname" id="itemname"></div>
            </div>
            <div class="table-row">
              <div class="row-title"><span>품목*</span></div>
              <div class="row-content">
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
                <select name="itemkind2" id="itemkind2">
                  <option>중분류</option>
                </select>
              </div>
            </div>
            <div class="table-multi-row">
              <div class="table-row">
                <div class="row-title"><span>색상*</span></div>
                <div class="row-content">
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

            <div class="table-row">
              <div class="row-title"><span>특징*</span></div>
              <div class="row-content" id="textarea-content">
                <textarea name="sepcialMark" id="sepcialMark" maxlength="300" placeholder="텍스트를 입력하세요."></textarea>
                <div class="textLengthWrap">
                  <span class="textCount">0자</span>
                  <span class="textTotal">/300자</span>
                </div>
              </div>
            </div>
            <div class="table-row">
              <div class="row-title"><span>사진첨부</span></div>
              <div class="col-content">
                <div class="in-row-content">
                  <input type="file" name="" id="file1" accept="image/*">
                  <label for="file1">사진첨부</label>
                </div>
                <div class="in-row-content">
                  <input type="file" name="" id="file2" accept="image/*">
                  <label for="file2">사진첨부</label>
                </div>
                <div class="in-row-content">
                  <input type="file" name="" id="file3" accept="image/*">
                  <label for="file3">사진첨부</label>
                </div>
                <div class="in-row-content">
                  <input type="file" name="" id="file4" accept="image/*">
                  <label for="file4">사진첨부</label>
                </div>
                <div class="in-row-content">
                  <input type="file" name="" id="file5" accept="image/*">
                  <label for="file5">사진첨부</label>
                </div>
                <div class="image-ex-text">*첨부파일은 한개당 3mb까지 제한되고 확장자는 JPEG,GIF,PNG로 제한됩니다. </div>
              </div>
            </div>
          </div>
        </div>

        <ul class="bottom-btns">
          <li><button type="submit">게시물 등록</button></li>
          <li><button type="button" onclick="location.href='lost_item_search_page';" style="cursor: pointer;">취소하기</button></li>
        </ul>
        <!-- hidden 세션로그인 id -->
        <input type="hidden" name="userId" value="${userId }">
    </div>
      </form>
      <!-- form 끝 -->
  </div>
 <!-- 전화번호에 숫자만 입력 -->
  <script>
    $(document).on("keypress keyup keydown change", "input[type='tel']", function () {
      var replace_text = $(this).val().replace(/[^-0-9]/g, "");
      $(this).val(replace_text);
    });
  </script>
  <!-- 날짜 제한 -->
  <script>
    $(document).ready(function () {//로드완료시
        var now_utc = Date.now() // 지금 날짜를 밀리초로
        // getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
        var timeOff = new Date().getTimezoneOffset() * 60000; // 분단위를 밀리초로 변환
        // new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
        var today = new Date(now_utc - timeOff).toISOString().split("T")[0];
        document.getElementById("lostday").setAttribute("max", today); //선택날짜 최대값 오늘날짜로 제한
        document.getElementById("lostday").setAttribute("value", today);//파일로드시 오늘날짜로 설정
    });
  </script>
  <!-- 파일크기 제한 -->
  <script>
    $(document).on("change", "input[type='file']", function () {
      var fileVal = $(this).val();
      if (fileVal != "") {
        var ext = fileVal.split('.').pop().toLowerCase(); //확장자분리
        //아래 확장자가 있는지 체크
        if ($.inArray(ext, ['jpg', 'jpeg', 'gif', 'png']) == -1) {
          alert('jpg,gif,jpeg,png 파일만 업로드 할수 있습니다.');
          $(this).val("");
          return;
        }
        const inputValue = event.target.value;
        console.log(inputValue);
        console.log(event.target.files);
        var maxSize = 3 * 1024 * 1024; // 3MB
        var fileSize = $(this)[0].files[0].size;
        if (fileSize > maxSize) {
          alert("첨부파일 사이즈는 3MB 이내로 등록 가능합니다.");
          $(this).val("");
          return;
        }
      }

    });
  </script>
  <!-- 글자수 제한 표현 -->
  <script>
    $(document).on("keydown change", "#sepcialMark", function () {
      let content = $(this).val();

      // 글자수 세기
      if (content.length == 0 || content == '') {
        $('.textCount').text('0자');
      } else {
        $('.textCount').text(content.length + '자');
      }

      // 글자수 제한
      if (content.length > 300) {
        // 300자 부터는 타이핑 되지 않도록
        $(this).val($(this).val().substring(0, 300));
        // 300자 넘으면 알림창 뜨도록
        alert('글자수는 300자까지 입력 가능합니다.');
      };
    });
  </script>
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
	function itemkind(e) {
		var kind_PRI000 = ["삼성노트북", "LG노트북", "삼보노트북","기타","HP노트북","애플노트북"];
		var kind_PRJ000 = ["삼성휴대폰", "LG휴대폰", "스카이휴대폰", "아이폰", "기타통신기기", "모토로라휴대폰", "기타휴대폰"];
		var kind_PRH000 = ["여성용 지갑", "남성용 지갑", "기타 지갑"];
		var kind_PRG000 = ["PMP", "MP3", "PDA", "카메라", "전자수첩", "기타용품", "태블릿", "스마트워치", "무선이어폰"];
		var kind_PRD000 = ["기타물품"];
		var kind_PRO000 = ["반지", "목걸이", "귀걸이","시계" ,"기타"];
		var kind_PRZ000 = ["기타", "매장문화재", "선글라스","안경"];
		var kind_PRC000 = ["서류", "기타물품"];
		var kind_PRE000 = ["스포츠용품", "수영복", "수영물품"];
		var kind_PRF000 = ["자동차열쇠", "네비게이션", "자동차번호판", "기타용품", "임시번호판"];
		var kind_PRL000 = ["현금", "수표", "기타", "외화"];
		var kind_PRK000 = ["여성의류", "남성의류", "아기의류", "기타의류", "모자", "신발"];
		var kind_PRQ000 = ["쇼핑백"];
		var kind_PRR000 = ["건반악기","관악기","타악기","현악기","기타악기"];
		var kind_PRP000 = ["신용(체크)카드","일반카드","기타카드"];
		var kind_PRM000 = ["어음","상품권","채권","기타"];
		var kind_PRN000 = ["신분증","면허증","여권","기타","판결문"];
		var kind_PRA000 = ["여성용가방","남성용가방","기타가방"];
		var kind_PRB000 = ["학습서적","소설","컴퓨터서적","만화책","기타서적"];
		var kind_PRX000 = ["유류품"];
		var target = document.getElementById("itemkind2");
		if (e.value == "PRI000")
			var d = kind_PRI000;
		else if (e.value == "PRJ000")
			var d = kind_PRJ000;
		else if (e.value == "PRH000")
			var d = kind_PRH000;
		else if (e.value == "PRG000")
			var d = kind_PRG000;
		else if (e.value == "PRD000")
			var d = kind_PRD000;
		else if (e.value == "PRO000")
			var d = kind_PRO000;
		else if (e.value == "PRZ000")
			var d = kind_PRZ000;
		else if (e.value == "PRC000")
			var d = kind_PRC000;
		else if (e.value == "PRE000")
			var d = kind_PRE000;
		else if (e.value == "PRF000")
			var d = kind_PRF000;
		else if (e.value == "PRL000")
			var d = kind_PRL000;
		else if (e.value == "PRK000")
			var d = kind_PRK000;
		else if (e.value == "PRQ000")
			var d = kind_PRQ000;
		else if (e.value == "PRR000")
			var d = kind_PRR000;
		else if (e.value == "PRP000")
			var d = kind_PRP000;
		else if (e.value == "PRM000")
			var d = kind_PRM000;
		else if (e.value == "PRN000")
			var d = kind_PRN000;
		else if (e.value == "PRA000")
			var d = kind_PRA000;
		else if (e.value == "PRB000")
			var d = kind_PRB000;
		else if (e.value == "PRX000")
			var d = kind_PRX000;
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