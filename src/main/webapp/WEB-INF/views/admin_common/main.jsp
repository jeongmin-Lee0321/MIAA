<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link rel="stylesheet" href="resources/css/admin_header.css" />
<title>Insert title here</title>
  <style>
.main-container {
	display: flex;
	flex-wrap: wrap;
	gap: 4%;
	padding-left: 4%;
	padding-right: 4%;
	width: 1440px;
	margin: 20px auto;
}

.content-list {
	margin: 10px 0;
	max-width: 44%;
	flex-basis: 44%;
	border: 2px solid #ffffff;
	border-radius: 5px;
	box-shadow: 0px 2px 2px 0px rgba(0, 0, 0, 0.14), 0px 2px 6px 0px
		rgba(0, 0, 0, 0.14), 0px 2px 2px 0px rgba(0, 0, 0, 0.14);
	display: flex;
	flex-direction: column;
}

.content-caption {
	border-bottom: 0.0625rem solid #EAECF0;;
	padding: 10px 5px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}
.content{
	margin : auto 0;
}
select {
	padding: 0.2rem 0.5rem;
	border-radius: 10px;
	font-size: 0.8rem;
	font-family: "Noto Sans KR", sans-serif;
	border-width: 0.0625rem;
}
</style>

</head>
<body>
	<div class="main-container">
		<div class="content-list">
			<div class="content-caption">
				<div class="list-title">날짜별 실종동물 등록수</div>
				<div class="list-selection">
					<select name="" id="">
						<option value="">시간</option>
					</select>
				</div>
			</div>
			<div class="content">
				<canvas id="myChart1"> </canvas>
			</div>
		</div>
		<div class="content-list">
			<div class="content-caption">
				<div class="list-title">날짜별 유기/분실동물 등록수</div>
				<div class="list-selection">
					<select name="" id="">
						<option value="">시간</option>
					</select>
				</div>
			</div>
			<div class="content">
				<canvas id="myChart2"> </canvas>
			</div>
		</div>
		<div class="content-list">
			<div class="content-caption">
				<div class="list-title">지역별 분실물 등록수</div>
			</div>
		</div>
		<div class="content-list">
			<div class="content-caption">
				<div class="list-title">지역별 보호동물 등록수</div>
			</div>
		</div>
	</div>
	  <script>
  const ctx = document.getElementById('myChart1');
  const ctx2 = document.getElementById('myChart2');

  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
      datasets: [{
        label: '# of Votes',
        data: [12, 19, 3, 5, 2, 3],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
	const myChart2= new Chart(ctx2,
			{
				type : 'polarArea',
				data : {
					labels : ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
					datasets : [ {
						label : '#청바지매출액',
						data : [12, 19, 3, 5, 2, 3],
						backgroundColor:[
							'rgba(255,99,130,1.0)',
							'rgba(55,99,16,0.2)',
							'rgba(10,99,13,0.2)',
							'rgba(255,99,130,1.0)',
							'#0000ff'
						],
						borderColor:[
							'rgba(255,99,130,1.0)',
							'rgba(55,99,16,0.2)',
							'rgba(10,99,13,0.2)',
							'rgba(255,99,130,1.0)',
							'#0000ff'
						],
						borderWidth : 3
					} ]
				},
				options : {
					scales:{
						y:{
							 beginAtZero:true
						}
					}
				}
			}
	);
</script>
</body>
</html>