<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, hagong.academy.mngStudent.mngInfo.model.vo.*"%>
<%
	ArrayList<Student> sList = (ArrayList<Student>) request.getAttribute("sList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<legend align="center"><h1>　<%= sList.get(0).getName() %>　</h1></legend>
	</fieldset>
	</div>
		<!-- 학생 정보 -->
		<div id="studentInfo" style="width: 80%; margin: auto auto;">
		<h2 style="width: 150px;"><li>학생 정보</li></h2>
			<button id="updatebtn" type="button" onclick="update()" style="float: right;">수정</button>
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
					<td><%= sList.get(0).getSchool() %></td>
					<td><%= sList.get(0).getGrade() %></td>
					<td><%= sList.get(0).getEmail() %></td>
					<td><%= sList.get(0).getPhone() %></td>
					<td><%= sList.get(0).getRefPhone() %></td>
					<td><%= sList.get(0).getMajor() %></td>
				</tr>
			</table>
		</div>
		<!-- 학생 성적 -->
		<div id="studentPoint" style="width: 90%; margin: auto 10%;">
			<h2 style="width: 150px;"><li>학생 성적</li></h2>
			<button id="addRow" style="float: right; margin-right: 11.2%;">성적 추가</button>
			<button id="searchCondition" style="float: right;">검색</button>
			<!-- DatePicker -->
			<input type='text' id='datepicker' readonly>
			<!-- 조건 선택시 옵션 -->
			<select class="classify"
				style="float: right; width: 100px; margin-left: 1%; display: none;">

			</select>
			<select class="so" style="float: right; width: 85px;">
				<option value="0" selected>전체보기</option>
				<option value="1">구분</option>
				<option value="2">년도</option>
				<option value="3">과목</option>
			</select>
			<!-- 학생 성적 테이블 -->
			<table id="score" class="table" id="point" style="width:97%;">
				<tr>
					<th style='width: 119px;'></th>
					<th style='width: 194px;'>구분</th>
					<th style='width:140px;'>학기</th>
					<th style='width:200px;'>년도</th>
					<th>과목</th>
					<th>점수</th>
					<th style='width: 100px;'></th>
				</tr>
				<%
					if(sList.get(0).getScoType() != null){
						for(Student s : sList) {
				%>
				<tr>
					<td><%=s.getScoreNo() %></td>
					<td><%=s.getScoType()%></td>
					<td><%=s.getTerm() %></td>
					<td><%=s.getYear() %></td>
					<td><%=s.getSubName() %></td>
					<td><%=s.getSubscore() %></td>
					<td></td>
				</tr>
				<% } } else { }%>
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
		function update(){
			location.href='<%=request.getContextPath()%>/aupdatedetail.info?userId=' + "<%= sList.get(0).getUserId()%>";
		};
		
		var $select1 = "<select style='width: 85px;' class='type' name='type'>";
		var $op1 = "<option value='NS'>내신</option><option value='MG'>모의고사</option><option value='ETC'>기타</option>	";
		var $select2 = "<select style='width: 50px;' class='term' name='term'>";
		var $op2 = "<option value='1'>1</option><option value='2'>2</option>";
		var $button = "<button type='button' id='insertScore'>등록</button>";
		var $year = "<input type='text' class='year' name='year' style='width: 60px;'>";
		var $subName = "<select style='width: 70px;' class='subName' name='subName'><option value='국어'>국어</option><option value='수학'>수학</option><option value='영어'>영어</option>";
		var $subScore = "<input type='text' class='subScore' name='subScore' style='width: 60px;'>";
		<%-- $("#pointAddBtn").click(function(){
			location.href="<%= request.getContextPath()%>/ascore.info?userId=" + <%= s.getUserId()%>;
		}); --%>
		//학생 성적 추가 버튼
		$("#addRow").click(function() {
			$("#score").append(
				"<tr><td></td><td style=' height:43px;'>" + $select1 + $op1 + "</td><td style=' height:43px;'>"
				+ $select2 + $op2 + "</td><td>" + $year + "</td><td>" + $subName + "</td><td>" + $subScore + "</td><td style='width: 100px;'>"
				+ $button + "</td></tr>");
			
			//버튼 중복클릭 막기
			$(this).attr("disabled","disabled");
			
			//성적 등록 버튼
			$("#insertScore").click(function(){
				var userId="<%= sList.get(0).getUserId()%>";
				var name="<%= sList.get(0).getName()%>";
				var type=$(".type").val();
				var year=$(".year").val();
				var term=$(".term").val();
				var subName=$(".subName").val();
				var subScore=$(".subScore").val();
				
				console.log(typeof(type));
				location.href="<%=request.getContextPath()%>/ascore.info?userId=" + userId + "&name" + name + "&type=" + type + "&year=" + year + "&term=" + term + "&subName=" + subName + "&subScore=" + subScore;
			});
		});
		//차트
		var options = {
			'legend' : {
				//x축 항목이름
				names : [ '국어', '수학', '영어']
			},
			'dataset' : {
				title : '학생 성적 그래프',
				values : [ [ 50, 70 , 60], [ 20, 50 , 70] , [30, 60, 50] ],
				colorset : [ '#749ee3', '#70db8e' ],
				//y축 항목 이름
				fields : [ '모의고사', '내신', '기타' ]
			},
			'chartDiv' : 'chart19',
			'chartType' : 'multi_column',
			'chartSize' : {
				width : 900,
				height : 500
			},
			'maxValue' : 100,
			'increment' : 10
		};

		Nwagon.chart(options);
		
		//검색 옵션별 함수
		$(function() {
			var class1 = [ 'MG', 'NS', 'ETC' ];
			var class2 = [ '국어', '수학', '영어' ];
			$(".so").change(function() {
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
												"<option class='op' name='op' value='" + item + "'>" + item
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
												"<option class='op' name='op' value='" + item + "'>" + item
														+ "</option>");
									});
								}
							});
		});
		
		//검색 버튼
		$("#searchCondition").click(function(){
			var condition = $(".so").val();
			if(condition == 2){
				var op = $("#datepicker").val();
			} else {
				var op = $(".classify").val();
			};
			
			/* $.ajax({
				url : "searchscore.info",
				type : "get",
				data : {
					condition:condition,
					op:op
				},
				success:function(data){
					console.log(data);
				},
				error:function(data){
					console.log("실패");
				}
			}); */
			
			location.href="<%=request.getContextPath()%>/searchscore.info?condition=" + condition + "&op=" + op;
		});
		
		//DatePicker
		$(function() {
			$("#datepicker").datepicker({
			    dateFormat: "yy",
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