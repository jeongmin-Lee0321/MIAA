<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>Title</title>
<link rel="stylesheet"
	href="resources/css/mypage_matching_alarm_list_page.css" />
</head>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var chkObj = document.getElementsByName("RowCheck");
			var rowCnt = chkObj.length;
			
			$("input[name='allCheck']").click(function(){
				var chk_listArr = $("input[name='RowCheck']");
				for (var i=0; i<chk_listArr.length; i++){
					chk_listArr[i].checked = this.checked;
				}
			});
			$("input[name='RowCheck']").click(function(){
				if($("input[name='RowCheck']:checked").length == rowCnt){
					$("input[name='allCheck']")[0].checked = true;
				}
				else{
					$("input[name='allCheck']")[0].checked = false;
				}
			});
		});
		function deleteValue(){
			var url = "delete";    // Controller로 보내고자 하는 URL
			var valueArr = new Array();
		    var list = $("input[name='RowCheck']");
		    for(var i = 0; i < list.length; i++){
		        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
		            valueArr.push(list[i].value);
		        }
		    }
		    if (valueArr.length == 0){
		    	alert("선택된 글이 없습니다.");
		    }
		    else{
				var chk = confirm("정말 삭제하시겠습니까?");
				
				if(chk)
					{
				$.ajax({
				    url : url,                    // 전송 URL
				    type : 'POST',                // POST 방식
				    traditional : true,
				    data : {
				    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
				    },
	                success: function(jdata){
	                    if(jdata = 1) {
	                    	
	                        alert("삭제 성공");
	                        location.replace("mypage_customer_inquiry_list_page") //페이지 새로고침
	                    }
	                    else{
	                        alert("삭제 실패");
	                    }
	                }
				});
					}
				else{
					alert("삭제 취소");
				}
			}
		}
	</script>
<body>
	<div class="main-body">

		<!-- main -->

		<div class="content-wrapper">
			<div class="content-container">
				<div class="list-control-container">
					<button class="btn-list" id="btn-write" onclick="location.href='mypage_customer_inquiry_write_page';" style="cursor: pointer;">문의글 등록</button>
					<button class="btn-list" id="btn-delete" onclick="deleteValue();" style="cursor: pointer;">삭제하기</button>
				</div>
				<table class="info-table">
					<tr>
						<th><input type="checkbox" name="allCheck" id="allCheck"
							class="table-check-box"></th>
						<th>글번호</th>
						<th class="table-title">제목</th>
						<th>처리상태</th>
						<th>문의 날짜</th>
						<th>답변 날짜</th>
						<th></th>
					</tr>
					<c:forEach items="${list }" var="list">
					<tr>
						<td><input type="checkbox" name="RowCheck" value="${list.board_num}"
							class="table-check-box"></td>							
						<td>${list.rownum}</td>
						<td class="table-title"><a href="mypage_customer_inquiry_detail_page?board_num=${list.board_num}">${list.board_title}</a></td>
						<td>${list.board_reply_status}</td>
						<td>${list.board_registration_date}</td>
						<td>-</td>						
						<td><input type="image" src="resources/img/write_icon.png" name="" onclick="location.href='mypage_customer_inquiry_modify_page?board_num=${list.board_num}';" style="cursor: pointer;" /></td>
					</tr>
					</c:forEach>
					
				</table>
			</div>
		</div>

		<!-- page -->

		<div class="result-container">
		
		<!-- 페이징 프레임시작 -->
		
        <div class="page-container">
            <div class="currentOftotal">
                <span>Page</span><span class="current-page">${pageVO.page}</span><span>of</span><span
                    class="total-page">${pageVO.totPage}</span>
            </div>
            <ul class="pagelist-container">
                <li class="btn-prev"><a class="test" href="mypage_customer_inquiry_list_page?page=${pageVO.page - 1}"><img
                        src="resources/img/chevron-left.png" alt=""></a></li>
                <c:forEach begin="${pageVO.pageStart}" end="${pageVO.pageEnd}" var="i">
                    <c:choose>
                        <c:when test="${i eq pageVO.page}">
                            <li><a href="#" style="color: red">${i}</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="mypage_customer_inquiry_list_page?page=${i}">${i}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <li class="btn-next"><a href="mypage_customer_inquiry_list_page?page=${pageVO.page + 1}"><img
                        src="resources/img/chevron-left.png" alt=""></a></li>
            </ul>

            <ul class="switchBtn-container">
                <li class="btn-prev-group"><a href="mypage_customer_inquiry_list_page?page=${pageVO.page - 1}">Previous</a></li>
                <li class="btn-next-group"><a href="mypage_customer_inquiry_list_page?page=${pageVO.page + 1}">Next</a></li>
            </ul>
        </div>
        
        <!-- 페이징 프레임 끝 -->
        
		</div>

	</div>
</body>
</html>