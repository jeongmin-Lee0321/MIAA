<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/main_selection.css" />
<link rel="stylesheet" href="resources/css/joinform.css" />
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
<main>
   <div class="main-selection">
      <div class="selection-name">
         <span>가입하기</span>
      </div>
      <div class="selection-explain">
         <span> 이미 사용 중인 계정이 있다면 <a href="loginform"
            style="color: #0066FF; text-decoration: underline;">로그인</a> 하세요
         </span>
      </div>
   </div>
   <div class="join_insert"
      style="width: 100%; height: 100%;  margin: auto; margin-top: 20px; text-align: center;">
      <form action="join" name ="regform" id ="regform" onsubmit="return sendit()">
         <div class="inputbox-container">
            <div class="input-box">
               <input type="text" id="id" name="id" placeholder="아이디" pattern="^[A-Za-z][A-Za-z0-9]{3,19}$"
               required
               oninvalid="this.setCustomValidity('아이디는 4자이상 20자 이하의 대소문자로 시작하는 조합입니다')"
               oninput="this.setCustomValidity('')" /> <label
                  for="id">아이디</label>
            </div>
            
            <div class="button-container">
               <input type="button" id="idchk" onclick="idchk();" value="아이디 중복확인" style="cursor: pointer;">
            </div>
         </div>
         
            <div class="hththt">
            	아이디는 4자이상 20자 이하의 대소문자로 시작하는 조합입니다.
            	예)Miaa
            </div>
            
         
         <div class="inputbox-container">
            <div class="input-box">
               <input type="password" id="pw" name="pw" placeholder="비밀번호" required="required" /> <label
                  for="pw">비밀번호</label>
            </div>

         </div>
         <div class="inputbox-container">            
            <div class="input-box">                                                                                                  
               <input type="password" id="pw2" name="pw2" placeholder="비밀번호 확인" required="required" />
               <label for="pw">비밀번호 확인</label>
               
            </div>
            
            <div class="button-container">
               <input type="button" id="pwchk" name="pwchk" value="비밀번호 확인" style="cursor: pointer;" onclick="qpwchk()">
            </div>
         </div>
         
          <div class="hththt">
            	비밀번호는 최소 10자에서 20자까지, 영문자, 숫자 및 특수 문자를 포함해야 합니다.
         </div>
         
         <div class="inputbox-container">
            <div class="input-box">
               <input type="email" id="email" name="email" placeholder="이메일" required="required"/> <label
                  for="email">이메일</label>
            </div>
            <div class="button-container">
               <input type="button" id="emailchk" onclick="emailchk();"
                  value="이메일 중복확인" style="cursor: pointer;">
            </div>
         </div>

         <div class="inputbox-container">
            <div class="input-box">
               <input type="text" id="sample6_postcode" name="postcode"
                  placeholder="우편번호" required="required"/> <label for="postcode">우편번호</label>
            </div>
            <div class="button-container">
               <input type="button" id="postchk"
                  onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="cursor: pointer;">
            </div>
         </div>

         <div class="inputbox-container">
            <div class="input-box">
               <input type="text" id="sample6_address" name="address"
                  placeholder="주소" required="required"/> <label for="postcode">주소</label>
            </div>
         </div>

         <div class="inputbox-container">
            <div class="input-box">
               <input type="text" id="sample6_detailAddress" name="detailAddress"
                  placeholder="상세주소" required="required"/> <label for="postcode">상세주소</label> <input
                  type="hidden" id="sample6_extraAddress" placeholder="참고항목">
            </div>

         </div>

         <div class="joinBtn-container">
            <input type="submit" id="join" value="회원가입" style="cursor: pointer;" onclick="qpassword()">
         </div>
         
         <script>
    		function qpassword() {
        	var password1 = document.getElementById('pw').value;
        	var password2Pattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^*+=-])[A-Za-z\d!@#$%^*+=-]{9,21}$/;
        
        	if (!password2Pattern.test(password1)) {
            alert('비밀번호는 최소 10자에서 20자까지, 영문자, 숫자 및 특수 문자를 포함해야 합니다.');
            return false;
        		
        	}
        	
    	}
		</script>
         
         
         <script>
            function sample6_execDaumPostcode() {
               new daum.Postcode(
                     {
                        oncomplete : function(data) {
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
                              document
                                    .getElementById("sample6_extraAddress").value = extraAddr;

                           } else {
                              document
                                    .getElementById("sample6_extraAddress").value = '';
                           }
                           document.getElementById('sample6_postcode').value = data.zonecode;
                           document.getElementById("sample6_address").value = addr;
                           document.getElementById(
                                 "sample6_detailAddress").focus();
                        }
                     }).open();
            }
         </script>
         <script>
            $(document).ready(function() {
               $("#idchk").click(idchk);

            });
            function idchk() {
               $.ajax({
                  url : "idcheck",
                  type : "post",
                  dataType : "json",
                  data : {
                     "id" : $("#id").val()
                  },
                  success : function(num) {
                     if (num == 1) {
                        alert("중복된 아이디입니다.");
                     } else if (num == -1) {
                        alert("아이디를 입력하세요.")
                     } else {
                        alert("사용가능한 아이디입니다.")
                     }
                  }
               });
            }
         </script>
         <script>
            $(document).ready(function() {
               $("#emailchk").click(emailchk);
            });
            function emailchk() {
               $.ajax({
                  url : "emailchk",
                  type : "post",
                  dataType : "json",
                  data : {
                     "email" : $("#email").val()
                  },
                  success : function(num2) {
                     if (num2 == 1) {
                        alert("중복된 이메일입니다.");
                     } else if (num2 == 0) {
                        alert("사용가능한 이메일입니다.")
                     } else {
                        alert("이메일을 입력하세요.")
                     }
                  }
               });
            }
         </script>
         <script>
            $(document).ready(function() {
               $("#pwchk").click(function() {
                  if ($("#pw").val() == "" || $("#pw2").val() == "") {
                     alert("비밀번호를 입력하세요.");
                  } else if ($("#pw").val() == $("#pw2").val()) {
                     alert("비밀번호가 일치합니다.");
                  } else {
                     alert("비밀번호가 일치하지 않습니다.");
                  }
                 
               })
            })
         </script>
      </form>
      </main>
</body>
</html>