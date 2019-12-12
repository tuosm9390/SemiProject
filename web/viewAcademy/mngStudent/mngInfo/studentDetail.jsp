<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="hagong.academy.mngStudent.mngInfo.model.vo.*"%>
<%
	Student s = (Student) request.getAttribute("s");
%>
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

input[type=text], select {
	border: 1px solid lightgray;
	border-radius: 5px;
	width: 200px;
	height: 30px;
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

#datepicker{
	float: right;
	margin-left: 1%;
	width: 80px;
	display: none;
}

.ui-datepicker .ui-datepicker-title select {
    margin: inherit !important;
}

h2{
	margin-bottom: 0;
}

#score tr th:last-child, #score tr td:last-child{
	background: white !important;
}
	
#score tr th:last-child:hover, #score tr td:last-child:hover{
	background: white !important;
}
</style>
</head>
<body>
	<header>
		<%@ include file="/viewAcademy/common/menubar.jsp"%>
	</header>
	<section>
	<!-- 제목 -->
	<div align="center">
	<fieldset style="border-bottom: none; border-left: none; border-right: none; border-top-color: black;
					width: 16%; height: 80px; font-family:'Do Hyeon'">
		<legend align="center"><h1>　<%= s.getName() %>　</h1></legend>
	</fieldset>
	</div>
		<!-- 학생 정보 -->
		<div id="studentInfo" style="width: 80%; margin: auto auto;">
		<h2 style="width: 150px;"><li>학생 정보</li></h2>
			<button id="updatebtn"
				onclick="location.href='<%=request.getContextPath()%>/viewAcademy/mngStudent/mngInfo/updateStudent.jsp'"
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
		<div id="studentPoint" style="width: 90%; margin: auto 10%;">
			<h2 style="width: 150px;"><li>학생 성적</li></h2>
			<button id="pointAddBtn" style="float: right; margin-right: 11.2%;">성적 추가</button>
			<button style="float: right;">검색</button>
			<!-- DatePicker -->
			<input type='text' id='datepicker' readonly>
			<!-- 조건 선택시 옵션 -->
			<select class="classify"
				style="float: right; width: 100px; margin-left: 1%; display: none;">

			</select>
			<select class="so" style="float: right; width: 60px;">
				<option value="0" selected>-선택-</option>
				<option value="1">구분</option>
				<option value="2">년도</option>
				<option value="3">과목</option>
			</select>
			<!-- 학생 성적 테이블 -->
			<table id="score" class="table" id="point" style="width:96%;">
				<tr>
					<th></th>
					<th>구분</th>
					<th>학기</th>
					<th>년도</th>
					<th>과목 1</th>
					<th>과목 2</th>
					<th>과목 3</th>
					<th></th>
				</tr>
				<tr>
					<td>1</td>
					<td>모의고사</td>
					<td>1</td>
					<td>2019</td>
					<td>0</td>
					<td>50</td>
					<td>60</td>
					<td></td>
				</tr>
				<tr>
					<td>2</td>
					<td>내신</td>
					<td>2</td>
					<td>2019</td>
					<td>40</td>
					<td>60</td>
					<td>20</td>
					<td></td>
				</tr>
				<tr>
					<td>3</td>
					<td>내신</td>
					<td>1</td>
					<td>2018</td>
					<td>40</td>
					<td>0</td>
					<td>30</td>
					<td></td>
				</tr>
			</table>
		</div>
	
		<!-- 성적 그래프 -->
		<div id="chart" style="width: 90%; margin: auto 10%;">
			<h2 align="left"><li>성적 그래프</li></h2>
			<div id="chart19" align="center"></div>
		</div>
	</section>
	<footer></footer>

	<script>
		//차트
		var options = {
			'legend' : {
				//x축 항목이름
				names : [ '과목1', '과목2', '과목3']
			},
			'dataset' : {
				title : '학생 성적 그래프',
				values : [ [ 50, 70 ], [ 20, 50 ] , [30, 60] ],
				colorset : [ '#749ee3', '#70db8e' ],
				//y축 항목 이름
				fields : [ '모의고사', '내신' ]
			},
			'chartDiv' : 'chart19',
			'chartType' : 'multi_column',
			'chartSize' : {
				width : 800,
				height : 500
			},
			'maxValue' : 100,
			'increment' : 10
		};

		Nwagon.chart(options);
		
		var $select1 = "<select style='width: 85px;'>";
		var $op1 = "<option>내신</option><option>모의고사</option>";
		var $select2 = "<select style='width: 50px;'>";
		var $op2 = "<option>1</option><option>2</option>";
		var $button = "<button type='button'>등록</button>";
		//학생 성적 추가 버튼
		$("#pointAddBtn").click(function() {
			$("#score").append(
				"<tr><td>3</td><td style='width:194px; height:43px;'>" + $select1 + $op1 + "</td><td style='width:140px; height:43px;'>" + $select2 + $op2 + "</td><td>2019</td><td contenteditable='true'></td><td contenteditable='true'></td><td contenteditable='true'></td><td style='width: 100px;'>" + $button + "</td></tr>");
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
									$("#datepicker").hide();
								//구분 선택
								} else if (sel == 1) {
									$(".classify").show();
									$(".op").remove();
									$("#datepicker").hide();
									$.each(class1, function(i, item) {
										$(".classify").append(
												"<option class='op'>" + item
														+ "</option>");
									});
									//년도 선택
								} else if (sel == 2) {
									$(".classify").hide();
									$(".op").remove();
									$("#datepicker").show();
									//과목 선택
								} else if (sel == 3) {
									$(".classify").show();
									$(".op").remove();
									$("#datepicker").hide();
									$.each(class2, function(i, item) {
										$(".classify").append(
												"<option class='op'>" + item
														+ "</option>");
									});
								}
							});
		});
		
		//DatePicker
		$(function() {
			$("#datepicker").datepicker({
			    dateFormat: "yy년",
			    startView: "years",
			    minViewMode: "years",
			    showOtherMonths: true,
			    showMonthAfterYear: true,
			    changeMonth : true,
				changeYear : true,
				constrainInput: false,
				showButtonPanel: true,
				dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
				monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], // 월의 한글 형식.
				currentText: '오늘 날짜',
				yearRange: "c-5:c"
			});
		});
	</script>
</body>
</html>