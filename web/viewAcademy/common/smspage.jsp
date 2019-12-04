<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.div1 {
	display: inline-block;
	height: 400px;
	width: 200px;
	margin: auto auto;
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

td{
	color: black !important;
	background: white;
}
</style>
</head>
<body>
	<header>
		<%@ include file="menubar.jsp"%>
	</header>
	<section align="center">
		<h1 align="left" style="margin-left: 10%;">SMS 테스트 페이지</h1>
		<div class="div1" style="float: left; margin-left: 15%;" id="div1">
			<label style="float: left;">항목 선택</label>
			<button id="addlistbtn" style="float: right;">+</button>
			<br> <br> <select style="width: 100%; height: 25px;"
				id="select">
				<option>수강료납부</option>
				<option>학생 등하원</option>
				<option>수동 발송</option>
			</select>
		</div>

		<!-- 항목 추가 -->
		<div id="addlist" class="modal">

			<div class="modal-content" align="center">
				<span class="close">&times;</span>
				<h3 style="margin-left:35px;">항목 추가하기</h3>
				<table>
					<tr>
						<td align="right !important">항목 이름 :</td>
						<td align="left"><input type="text" style="width: 200px"></td>
					</tr>
					<tr>
						<td align="right">발송 내용 지정 :</td>
						<td align="left"><input type="text"
							style="height: 100px; width: 200px"></td>
					</tr>
				</table>
				<br> <br>
				<button class="cancelbtn"
					style="margin-left: 100px; width: 100px; height: 30px; float: left;">취소</button>
				<button class="okbtn"
					style="margin-right: 100px; float: right; width: 100px; height: 30px;">확인</button>
				<br>
			</div>
		</div>

		<div class="div1">
			<label style="float: left;">수신인 목록</label>
			<button id="addpersonbtn" style="float: right;">+</button>
			<br> <br>
			<textarea id="persontext"
				style="resize: none; width: 100%; height: 200px;" readonly></textarea>
			<br> <br> <label style="float: right;">인원 : </label>
		</div>

		<!-- 대상 추가 -->
		<div id="addperson" class="modal">

			<div class="modal-content" align="center">
				<span class="close">&times;</span>
				<h3 style="margin-left:15px;">수신인 추가하기</h3>
				<table>
				<tr>
					<td>학년 / 반 선택</td>
				</tr>
				<tr>
					<td>
					<select class="grade">
						<option value="mid1">중등 1학년</option>
						<option value="mid2">중등 2학년</option>
						<option value="mid3">중등 3학년</option>
						<option value="high1">고등 1학년</option>
						<option value="high2">고등 2학년</option>
						<option value="high3">고등 3학년</option>
					</select>&emsp;
					<select class="class">
					
					</select>
					</td>
				</tr>
				<tr>
					<td>대상 선택</td>
				</tr>
				<tr>
					<td>
						<select>
							<option>학생</option>
							<option>학부모</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox" id="student1">
						<label for="student1">학생 1</label>
						<input type="checkbox" id="student2">
						<label for="student2">학생 2</label><br>
						<input type="checkbox" id="student3">
						<label for="student3">학생 3</label>
						<input type="checkbox" id="student4">
						<label for="student4">학생 4</label>
					</td>
				</tr>
				</table>
				<button class="cancelbtn"
					style="margin-left: 100px; width: 100px; height: 30px; float: left;">취소</button>
				<button class="okbtn"
					style="margin-right: 100px; float: right; width: 100px; height: 30px;">확인</button>
				<br>
			</div>
		</div>

		<div class="div1"
			style="float: right; margin-right: 15%; width: 200px;">
			<label style="float: left;">발송 내용</label><br> <br>
			<textarea id="smstext"
				style="resize: none; height: 250px; width: 100%;" readonly></textarea>
			<button style="margin-top: 10px; height: 25px; float: right;" onclick="send();">전송하기</button>
		</div>
	</section>
	<footer> </footer>
	<!-- 스크립트 -->
	<script>
		function send() {
			swal("전송하시겠습니까?", {
				buttons : [ "취소", "확인" ],
			});
		};

		//항목 추가
		function addoption() {
			var optionName = window.prompt("추가할 목록 입력", "이름 입력");
			var result = false;
			$("#select option").each(
					function(i) {
						//중복된 값이 거나 값 입력되지 않았을 때
						if ($("#select option") == optionName
								|| optionName == "" || optionName == null) {
							return false;
						} else {
							result = true;
						}
						;
					});

			if (result) {
				$("#select").append("<option>" + optionName + "</option>");
			}
		};

		// 대상 추가 모달
		var addlist = document.getElementById('addlist');
		var addperson = document.getElementById('addperson');

		// 모달 실행 버튼
		var addlistbtn = document.getElementById("addlistbtn");
		var addpersonbtn = document.getElementById("addpersonbtn");

		// 모달 닫기 버튼
		var closelist = document.getElementsByClassName("close")[0];
		var cancellist = document.getElementsByClassName("cancelbtn")[0];
		var closeperson = document.getElementsByClassName("close")[1];
		var cancelperson = document.getElementsByClassName("cancelbtn")[1];

		// 모달 실행
		addpersonbtn.onclick = function() {
			addperson.style.display = "block";
		}
		addlistbtn.onclick = function() {
			addlist.style.display = "block";
		}

		// x버튼 클릭 시 종료
		closelist.onclick = function() {
			addlist.style.display = "none";
		}
		cancellist.onclick = function() {
			addlist.style.display = "none";
		}
		closeperson.onclick = function() {
			addperson.style.display = "none";
		}
		cancelperson.onclick = function() {
			addperson.style.display = "none";
		}
		
		$(function(){
			var class1 = ['1반', '2반'];
			var class2 = ['1반', '2반', '3반', '4반'];
			$(".grade").change(function(){
				var sel = $(this).val();
				if(sel == 'mid1'){
					$(".op").remove();
					$.each(class1,function(i, item){
						$(".class").append("<option class='op'>" + item + "</option>");
					});
				} else if(sel == 'mid2'){
					$(".op").remove();
					$.each(class2,function(i, item){
						$(".class").append("<option class='op'>" + item + "</option>");
					});
				}
			});
		});
	</script>
</body>
</html>