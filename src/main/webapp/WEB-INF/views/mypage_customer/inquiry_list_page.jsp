<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>Title</title>
<link rel="stylesheet"
	href="resources/css/mypage_customer_inquiry_list_page.css" />
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
			
			<div class="table-caption-wrapper">
				<div class="talbe-caption-container">
					<div class="table-caption">
						<span class="caption-total">${pageVo.totRow}개</span><span>의 문의내역이 있습니다</span>
					</div>
				</div>
				<div class="list-control-container">
					<button class="btn-list" id="btn-write" onclick="location.href='mypage_customer_inquiry_write_page';" style="cursor: pointer;">문의글 등록</button>
					<button class="btn-list" id="btn-delete" onclick="deleteValue();" style="cursor: pointer;">삭제하기</button>
				</div>
				
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
						<td><input type="checkbox" name="RowCheck" value="${list.userInquiry.board_num }"
							class="table-check-box"></td>							
						<td>${list.userInquiry.rnum }</td>
						<td class="table-title"><a href="mypage_customer_inquiry_detail_page?board_num=${list.userInquiry.board_num}">${list.userInquiry.board_title}</a></td>
						<td>${list.userInquiry.board_reply_status}</td>
						<td>${list.userInquiry.board_registration_date}</td>
						<td>${list.board_reply}</td>						
						<td><input type="image" src="resources/img/write_icon.png" name="" onclick="location.href='mypage_customer_inquiry_modify_page?board_num=${list.userInquiry.board_num}';" style="cursor: pointer;" /></td>
					</tr>
					</c:forEach>
					
				</table>
			</div>
		</div>

		<!-- page -->

		<div class="result-container">
			<div class="page-container">
				<div class="currentOftotal">
					<span>Page</span><span class="current-page">${pageVo.page}</span><span>of</span><span
						class="total-page">${pageVo.totPage}</span>
				</div>
				<ul class="pagelist-container">
					<li class="btn-prev"><a href="javascript:void(0);"
						onclick="goToPage(${pageVo.page}-1)"><img
							src="resources/img/chevron-left.png" alt=""></a></li>
					<c:forEach begin="${pageVo.pageStart}" end="${pageVo.pageEnd}"
						var="i">
						<c:choose>
							<c:when test="${i eq pageVo.page}">
								<li><span class="currpage">${i}</span></li>
							</c:when>
							<c:otherwise>
							<li><a href="javascript:void(0);" onclick="goToPage(${i})">${i}</a></li>
 							</c:otherwise>
						</c:choose>
					</c:forEach>
					<li class="btn-next"><a href="javascript:void(0);"
						onclick="goToPage(${pageVo.page}+1)"><img
							src="resources/img/chevron-left.png" alt=""></a></li>
				</ul>

				<ul class="switchBtn-container">
					<li class="btn-prev-group"><a href="javascript:void(0);"
						onclick="goToPage(${pageVo.page}-10)">Previous</a></li>
					<li class="btn-next-group"><a href="javascript:void(0);"
						onclick="goToPage(${pageVo.page}+10)">Next</a></li>
				</ul>
			</div>
		</div>

	</div>
	<script>
		function goToPage(pageNumber) {
			var currpage = pageNumber;
			if (pageNumber<=0){
				currpage = 1;
			}else if(currpage>${pageVo.totPage}){//현재페이지가 총페이지보다 클경우 현재페이지 = 총페이지 
				currpage = ${pageVo.totPage};
			}
			else if(currpage>${pageVo.pageEnd}){//페이지 표시갯수인 10이 넘을때는 해당 페이지리스트의 1번으로 가게함
				currpage= pageNumber-(pageNumber-1)%10;
			}
			else if(currpage<${pageVo.pageStart}){//-10page 버튼누를시 -10 말고 이전 페이지리스트의 10번으로 가게함
				currpage= pageNumber-((pageNumber-1)%10)+9;
			}
			var newPath = window.location.pathname + '?currPage=' + currpage;
			window.location.href = newPath; // 새 경로로 페이지 이동
		}
	</script>
</body>
</html>