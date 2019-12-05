<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

select {
	border: 1px solid lightgray;
	border-radius: 5px;
	height: 30px;
}

select:focus{
	outline: none;
}

.Addbenefit {
	width: 26px;
	margin-bottom: 5px;
	margin-left: 1%;
	font-size: 16px;
	font-family: "Nanum Gothic";
	font-weight: bold;
	border: 2px solid green;
	border-radius: 5px;
	background: none;
	color: black;
}

tr:not(:first-child){
	cursor: pointer;
}

/* 모달 배경 */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* 모달 내부 상자 */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 30%;
	background-color: #fefefe;
	border-radius: 10px;
	/* Could be more or less, depending on screen size */
}
/* 모달 닫기 버튼 */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../../common/menubar.jsp"%>
	</header>
	<section>
		<h2 style="margin-left: 5%;">만족도 조사 목록</h2>
		<button id="addSatisfaction" style="margin-right: 5%;">만족도 조사 등록</button>
		<button id="benefitBtn">혜택 관리</button>
		<form>
			<table class="table" align="center" style="width: 90%;">
				<tr>
					<th>No.</th>
					<th>만족도 조사 내용</th>
					<th>만족도 조사 날짜</th>
				</tr>
				<tr>
					<td>6</td>
					<td>2019 하반기 학원 운영 관련 만족도 평가</td>
					<td>2019.11.30 ~ 2020.01.02</td>
				</tr>
				<tr>
					<td>5</td>
					<td>2019-2학기 중간 만족도 평가</td>
					<td>2019.11.10 ~ 2020.01.20</td>
				</tr>
				<tr>
					<td>4</td>
					<td>2019-9월 모의고사 대비 특강 만족도 조사</td>
					<td>2019.11.10 ~ 2020.01.20</td>
				</tr>
				<tr>
					<td>3</td>
					<td>2019 여름방학 특강 만족도 조사</td>
					<td>2019.07.30 ~ 2019.08.06</td>
				</tr>
				<tr>
					<td>2</td>
					<td>2019-1학기 중간 만족도 평가</td>
					<td>2019.06.10 ~ 2019.07.20</td>
				</tr>
				<tr>
					<td>1</td>
					<td>2019 겨울방학 특강 만족도 조사</td>
					<td>2019.01.10 ~ 2019.02.20</td>
				</tr>
			</table>
		</form>
		
		<!-- 혜택관리 팝업 -->
		<div id="benefit" class="modal">

			<div class="modal-content" align="center">
				<span class="close">&times;</span>
				<h2 style="margin-left:35px;">혜택 관리</h2>
				<select style="height: 26px;">
					<option>학원비 5%</option>
					<option>학원비 10%</option>
				</select>&emsp;
				<input type="button" class="Addbenefit" value="+">
				<br> <br>
				<button class="cancelbtn" style="margin-left: 100px; width: 100px; height: 30px; float: left;">취소</button>
				<button class="okbtn" style="margin-right: 100px; float: right; width: 100px; height: 30px;">확인</button>
				<br>
			</div>
		</div>
	</section>
	<footer> </footer>
	<script>
		$("#addSatisfaction").click(function(){
			location.href="<%=request.getContextPath()%>/viewAcademy/mngClass/mngSatisfy/addSatisfaction.jsp";
		});
		
		$("tr:not(first-child)").click(function() {
			location.href = "<%=request.getContextPath()%>/viewAcademy/mngClass/mngSatisfy/satisfactionDetail.jsp";
		});
		
		$("tr:last-child").click(function(){
			location.href="<%=request.getContextPath()%>/viewAcademy/mngClass/mngSatisfy/satisfactionResult.jsp";
		});
		
		
		var benefit = document.getElementById("benefit");
		var benefitBtn = document.getElementById("benefitBtn");
		
		// 모달 실행
		benefitBtn.onclick = function() {
			benefit.style.display = "block";
		}
		
		var cancellist = document.getElementsByClassName("cancelbtn")[0];
		var closelist = document.getElementsByClassName("close")[0];
		
		closelist.onclick = function() {
			benefit.style.display = "none";
		}
		
		cancellist.onclick = function() {
			benefit.style.display = "none";
		};
	</script>
</body>
</html>