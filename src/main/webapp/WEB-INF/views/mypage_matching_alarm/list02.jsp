<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<table>
			<tr>
				<td>
					<select>
						<option>전체</option>
						<option>물건</option>
						<option>동물</option>
					</select>
				</td>
			</tr>		
		</table>
	</div>
	
	
	<!-- 검색결과 리스트 프레임 끝 -->
          <!-- 페이징 프레임시작 -->
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
          <!-- 페이징 프레임 끝 -->
	
	
	
	
	
	
	
	
	
	
</body>
</html>