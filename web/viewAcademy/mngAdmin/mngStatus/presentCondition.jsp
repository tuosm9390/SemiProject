<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
<title>Insert title here</title>
	<style>
	.outer{
		border: 3px solid black;
	
		width: 100%;
	}
	
	.chart{
		border : 3px solid gold;
		display : 
		width:50%;
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

	<%@ include file="/viewAcademy/common/menubar.jsp" %>
<body>
	<section>
	<div class="outer">

	<div class="chart">
			<h2>학생수 변동 추이</h2>	
	<div id="chart19"></div>
	</div><!-- left chart end -->
	
	<div class="chart">
		<h1>asdasdasdsadads</h1>
	</div><!-- right chart end-->
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
			'chartSize' : {width:700, height:300},
			'maxValue' : 10,
			'increment' : 1
		};

		Nwagon.chart(options);

	</script>
	</section>
</body>
</html>