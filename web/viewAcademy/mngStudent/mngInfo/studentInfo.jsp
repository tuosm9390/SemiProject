<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='../../chart/Nwagon.css' type='text/css'>
<script src='../../chart/Nwagon.js'></script>
<style>
table {
	width: 100%;
}

tr {
	width: 100%;
	height: 40px;
}

section button {
	font-size: 18px;
	margin-bottom: 5px;
	margin-left: 1%;
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
</style>
</head>
<body>
	<header>
		<%@ include file="/viewAcademy/common/menubar.jsp"%>
	</header>
	<section style="margin-left: 15%; margin-right: 15%;">
		<div id="studentInfo">
			<h2 style="width: 150px;">박상준</h2>
			<button id="updatebtn"
				onclick="location.href='<%=request.getContextPath()%>/viewAcademy/mngStudent/updateStudent.jsp'"
				style="float: right;">수정</button>
			<table>
				<tr>
					<th>학교</th>
					<th>학년</th>
					<th>이메일</th>
					<th>연락처</th>
					<th>학부모연락처</th>
					<th>희망학과</th>
				</tr>
				<tr>
					<td>kh중학교</td>
					<td>4</td>
					<td>helloworld@kakao.com</td>
					<td>010-4444-4444</td>
					<td>010-9999-9999</td>
					<td>사망</td>
				</tr>
			</table>
		</div>
		<div id="studentPoint">
			<h2 style="width: 150px;">학생 성적</h2>
			<button id="pointAddBtn" style="float: right;">성적 추가</button>
			<button style="float:right;">검색</button>
			<input type="search" style="float: right; width: 100px; margin-left: 1%;">
			<select style="float: right; width: 60px; height:25px;">
				<option selected></option>
				<option>구분</option>
				<option>년도</option>
				<option>과목</option>
			</select>
			<table id="point">
				<tr>
					<th></th>
					<th>구분</th>
					<th>학기</th>
					<th>년도</th>
					<th>과목 1</th>
					<th>과목 2</th>
					<th>과목 3</th>
				</tr>
				<tr>
					<td>1</td>
					<td>모의고사</td>
					<td>1</td>
					<td>2019</td>
					<td>0</td>
					<td>50</td>
					<td>60</td>
				</tr>
				<tr>
					<td>2</td>
					<td>내신</td>
					<td>2</td>
					<td>2019</td>
					<td>40</td>
					<td>60</td>
					<td>20</td>
				</tr>
				<tr>
					<td>3</td>
					<td>내신</td>
					<td>1</td>
					<td>2018</td>
					<td>40</td>
					<td>0</td>
					<td>30</td>
				</tr>
			</table>
		</div>

		<div id="chart" style="margin-left: 10%;">
			<h2>성적 그래프</h2>
			<div id="chart19"></div>
		</div>
	</section>
	<footer></footer>

	<script>
		var options = {
			'legend' : {
				names : [ '2019년도 1학기', '2019년도 2학기' ],
				hrefs : []
			},
			'dataset' : {
				title : '학생 성적 그래프',
				values : [ [ 50, 70 ], [ 20, 50 ] ],
				colorset : [ '#DC143C', '#2EB400' ],
				fields : [ '모의고사', '내신' ]
			},
			'chartDiv' : 'chart19',
			'chartType' : 'multi_column',
			'chartSize' : {
				width : 700,
				height : 500
			},
			'maxValue' : 100,
			'increment' : 10
		};

		Nwagon.chart(options);
		
		$("#pointAddBtn").click(function(){
			$("#point").append("<tr><td>3</td><td>내신</td><td>1</td><td>2018</td><td>40</td><td>0</td><td>30</td></tr>");
		});
	</script>
</body>
</html>