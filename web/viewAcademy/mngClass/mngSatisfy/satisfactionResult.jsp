<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='../../mngAdmin/mngStatus/Nwagon.css'
	type='text/css'>
<script src='../../mngAdmin/mngStatus/Nwagon.js'></script>
<style>
section button {
	float: right;
	margin-bottom: 5px;
	margin-left: 1%;
	font-size: 18px;
	font-family: "Nanum Gothic";
	font-weight: bold;
	border: 2px solid green;
}

section button:hover {
	cursor: pointer;
	background: green;
	border: 2px solid green;
	color: white;
}

.resultArea {
	position: relative;
	background: rgba(211, 211, 211, .4);
	margin-left: 15%;
	width: 70%;
	overflow: auto;
	border-radius: 20px;
}

.resultTable tr{
	height: 280px;
}

.resultTable tr>td:first-child {
	vertical-align: top;
	text-align: left;
	font-size: large;
	padding-top: 7%;
	padding-left: 2%;
	width: 400px;
}

.resultTable tr:not(:last-child){
	border-bottom: 1px solid black;
}

ul.accessibility{
	height: 0px;
}

li{
	list-style: decimal;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../../common/menubar.jsp"%>
	</header>
	<section>
		<h1 align="center">2019 겨울방학 특강 만족도 조사</h1>
		<div align="center">
			<li>대상 : 강남고등학교 2학년<고3 대비 선행 특강반></li>
			<li>실시 기간 : 2019.01.10 ~ 2019.02.20</li>
		</div>
		<button style="margin-right: 20%;"
			onclick="location.href='<%=request.getContextPath()%>/viewAcademy/mngClass/mngSatisfy/satisfactionList.jsp'">닫기</button>
		<button>삭제</button>

		<!-- 문항 목록 작성 -->
		<div align="center" class="resultArea">
			<table align="center" class="resultTable">
				<tr>
					<td>
						<li><label style="font-weight: bold;">수업 커리큘럼에 대한 만족도</label></li>
					</td>
					<td>
						<div id="cursatis1"></div>
					</td>
				</tr>
				<tr>
					<td>
						<li>수업 진도에 대한 만족도</li>
					</td>
					<td>
						<div id="cursatis2"></div>
					</td>
				</tr>
				<tr>
					<td>
						<li>강사에 대한 만족도</li>
					</td>
					<td>
						<div id="cursatis3"></div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<li>수업 및 강사에 대한 개선 의견</li><br>
						<ul>
							<li>수업 시간이 너무 길어서 졸려요!</li><br>
							<li>윤진쌤 숙제 넘 많이 내줘요 ㅠㅠ 방학인데!</li>
						</ul>
					</td>
				</tr>
			</table>
		</div>
	</section>
	<footer></footer>

	<script>
		var options = {
			'dataset' : {
				title : '수업 커리큘럼에 대한 만족도',
				values : [ 25, 3, 10, 7 ],
				colorset : [ '#2EB400', '#2BC8C9', "#666666", '#f09a93' ],
				fields : [ '매우 만족', '만족', '불만족', '매우 불만족' ],
			},
			'donut_width' : 35,
			'core_circle_radius' : 50,
			'chartDiv' : 'cursatis1',
			'chartType' : 'donut',
			'chartSize' : {
				width : 400,
				height : 200
			}
		};
		Nwagon.chart(options);

		var options = {
			'dataset' : {
				title : '수업 진도에 대한 만족도',
				values : [ 22, 1, 1, 1 ],
				colorset : [ '#2EB400', '#2BC8C9', "#666666", '#f09a93' ],
				fields : [ '매우 만족', '만족', '불만족', '매우 불만족' ],
			},
			'donut_width' : 35,
			'core_circle_radius' : 50,
			'chartDiv' : 'cursatis2',
			'chartType' : 'donut',
			'chartSize' : {
				width : 400,
				height : 200
			}
		};
		Nwagon.chart(options);

		var options = {
			'dataset' : {
				title : '강사에 대한 만족도',
				values : [ 13, 15, 6, 3 ],
				colorset : [ '#2EB400', '#2BC8C9', "#666666", '#f09a93' ],
				fields : [ '매우 만족', '만족', '불만족', '매우 불만족' ],
			},
			'donut_width' : 35,
			'core_circle_radius' : 50,
			'chartDiv' : 'cursatis3',
			'chartType' : 'donut',
			'chartSize' : {
				width : 400,
				height : 200
			}
		};
		Nwagon.chart(options);
	</script>
</body>
</html>