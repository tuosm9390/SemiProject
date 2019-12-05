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
	<section>
		<!-- 학생 정보 -->
		<div id="studentInfo" style="width: 80%; margin: auto auto;">
		<h1 style="width: 150px;">박상준</h1><br>
		<h2 style="width: 150px;">학생 정보</h2>
			<button id="updatebtn"
				onclick="location.href='<%=request.getContextPath()%>/viewAcademy/mngStudent/updateStudent.jsp'"
				style="float: right;">수정</button>
			<table class="table">
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
		<!-- 학생 성적 -->
		<div id="studentPoint" style="width: 80%; margin: auto auto;">
			<h2 style="width: 150px;">학생 성적</h2>
			<button id="pointAddBtn" style="float: right;">성적 추가</button>
			<button style="float: right;">검색</button>
			<!-- 조건 선택시 옵션 -->
			<select class="classify"
				style="float: right; width: 100px; margin-left: 1%; display: none;">

			</select>
			<select class="so" style="float: right; width: 60px; height: 25px;">
				<option value="0" selected>-선택-</option>
				<option value="1">구분</option>
				<option value="2">년도</option>
				<option value="3">과목</option>
			</select>
			<!-- 학생 성적 테이블 -->
			<table class="table" id="point">
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
	
		<!-- 성적 그래프 -->
		<div id="chart" style="width: 80%; margin: auto auto;" align="center">
			<h2 align="left">성적 그래프</h2>
			<div id="chart19"></div>
		</div>
	</section>
	<footer></footer>

	<script>
		//차트
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

		//학생 성적 추가 버튼
		$("#pointAddBtn")
				.click(
						function() {
							$("#point")
									.append(
											"<tr><td>3</td><td>내신</td><td>1</td><td>2018</td><td>40</td><td>0</td><td>30</td></tr>");
						});

		//검색 옵션별 함수
		$(function() {
			var class1 = [ '모의고사', '내신' ];
			var class2 = [ '과목1', '과목2', '과목3' ];
			$(".so")
					.change(
							function() {
								var sel = $(this).val();
								//구분 미선택
								if (sel == 0) {
									$(".classify").hide();
									$(".op").remove();
								//구분 선택
								} else if (sel == 1) {
									$(".classify").show();
									$(".op").remove();
									$.each(class1, function(i, item) {
										$(".classify").append(
												"<option class='op'>" + item
														+ "</option>");
									});
									//년도 선택
								} else if (sel == 2) {
									$(".classify").hide();
									$(".op").remove();
									$(".classify")
											.after(
													"<input type='month' class='op' style='float: right; margin-left: 1%;'>");
									//과목 선택
								} else if (sel == 3) {
									$(".classify").show();
									$(".op").remove();
									$.each(class2, function(i, item) {
										$(".classify").append(
												"<option class='op'>" + item
														+ "</option>");
									});
								}
							});
		});
	</script>
</body>
</html>