<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
<title>HAGONG</title>
	<style>
	.outer{
		width:100%;
		
		height:100%;
	}
	.chart{
		display: inline-block;
		
		width:49%;
		height:600px;
	}
	#chart19{
	margin-left: 25%;
	}
	#chart17{
	margin-left: 10%;
	margin-top: 20px;
	}
	.avgtable{
		width:60% !important;
		margin-left: 30%;
	}
	.text1{
	
		width:30%;
		
	}
	.text2{
		
		width:30%;
	
	}
	.text3{
		
		width:30%;
		
	}
	section{
		margin-left: 8%;
		margin-top:10%;
		
	}
		*{margin:0;padding:0;}
		div{padding:0px; overflow: hidden; height: auto;}
		.hgroup{padding:20px;background-color:#e9e9e9;}
		.hgroup h1{font-family:Tahoma;}
		.hgroup p{margin:10px 0;font-size:10px}
		
	</style>
	<link rel='stylesheet' href='Nwagon.css' type='text/css'>
	<script src='Nwagon.js'></script>

</head>

<body>
	<header><%@ include file="/viewAcademy/common/menubar.jsp" %></header>
	<section>
<div class="outer">
	<div class="chart">
	<h3 class="text1"><li>학생수 변동 추이</li></h3>
		<div id="chart19"></div>
		<h3 class="text2"><li>학생 유입 경로 순위</li></h3>
		<div class="avg">
				<table class="table avgtable">
					<tr>
						<th>순위</th>
						<th>경로</th>
						<th>비중</th>
					</tr>
					<tr>	
						<td>1</td>
						<td>친구</td>
						<td>42</td>
					</tr>
					<tr>	
						<td>2</td>
						<td>전단지</td>
						<td>37</td>
					</tr>
					<tr>	
						<td>3</td>
						<td>인터넷</td>
						<td>12</td>
					</tr>
					<tr>	
						<td>4</td>
						<td>기타</td>
						<td>6</td>
					</tr>
				</table>
			</div>	
	</div>
	<div class="chart">
	<h3 class="text3"><li>인기 과목 추세</li></h3>
		<div id="chart17"></div>
		
	</div>
	

</div><!-- outer end -->
	<script>
		var options = {
			'legend':{
				names: ['날짜1', '날짜2', '날짜3'],
				hrefs: []
					},
			'dataset':{
				title:'학생수 변동 추이', 
				values: [[5,7,2], [2,5,7], [7,2,3]],
				colorset: ['#DC143C','#FF8C00', '#2EB400'],
				fields:['전체학생', '입학', '퇴원']
				},
			'chartDiv' : 'chart19',
			'chartType' : 'multi_column',
			'chartSize' : {width:500, height:300},
			'maxValue' : 10,
			'increment' : 1
		};

		Nwagon.chart(options);

	</script>
	<script>
		var options = {
			'legend':{
				names: ['중1국어', '중2국어', '중3국어','중1국어', '중2국어', '중3국어'],
				hrefs: []
					},
			'dataset':{
				title:'Playing time per day', 
				values: [[5,7,2,6], [2,5,7,4], [7,2,3,6],[5,7,2,6], [2,5,7,4], [7,2,3,6]],
				colorset: ['#DC143C','#FF8C00', '#2EB400', '#666666'],
				fields:['Working Time', 'Late count', 'Blah','Vacation']
				},
			'chartDiv' : 'chart17',
			'chartType' : 'stacked_column',
			'chartSize' : {width:500, height:480},
			'maxValue' : 30,
			'increment' : 3
		};

		Nwagon.chart(options);

	</script>
	</section>
</body>
</html>