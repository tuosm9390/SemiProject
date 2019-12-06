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
	height: 500px;
	width: 300px;
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

td{
	color: black !important;
	background: white;
}

input[type=text] {
	border: 1px solid lightgray;
	border-radius: 5px;
	width: 200px;
	height: 30px;
}

textarea {
	border: 1px solid lightgray;
	border-radius: 5px;
}
select, option{
	border: 1px solid lightgray;
	border-radius: 5px;
	height: 30px;
}

/* 학생목록 */
.student{
	display: none;
}

/* 학부모 목록 */
.parent{
	display: none;
}
</style>
</head>
<body>
	<header>
		<%@ include file="menubar.jsp"%>
	</header>
	<section align="center">
		<h1 align="left" style="margin-left: 5%;">SMS 발송</h1>
		<div class="div1" style="float: left; margin-left: 5%;">
			<h2 style="float: left;">항목 선택</h2><br><br>
			<br> <br>
			<button id="addlistbtn" style="float: right;">+</button>
			<select style="width: 70%; height: 25px; float: left;" id="select">
				<option selected>-------------선택-------------</option>
				<option>수강료납부</option>
				<option>학생 등하원</option>
				<option>수동 발송</option>
			</select>
		</div>

		<!-- 항목 추가 -->
		<div id="addlist" class="modal">

			<div class="modal-content" align="center">
				<span class="close">&times;</span>
				<h2 style="margin-left:35px;">항목 추가하기</h2>
				<table>
					<tr>
						<td align="right !important">항목 이름 :</td>
						<td align="left"><input type="text" style="width: 200px"></td>
					</tr>
					<tr>
						<td align="right">발송 내용 지정 :</td>
						<td align="left">
						<textarea style="height: 200px; width: 200px; resize: none;"></textarea>
						</td>
					</tr>
				</table>
				<br>
				<button class="cancelbtn"
					style="margin-left: 100px; width: 100px; height: 30px; float: left;">취소</button>
				<button class="okbtn"
					style="margin-right: 100px; float: right; width: 100px; height: 30px;">확인</button>
				<br>
			</div>
		</div>

		<!-- 수신인 목록 -->
		<div class="div1">
			<h2 style="float: left;">수신인 목록</h2><br><br>
			<button id="addpersonbtn" style="float: right;">+</button>
			<br> <br>
			<textarea id="persontext"
				style="resize: none; width: 100%; height: 350px;" readonly></textarea>
			<br> <h3 style="float: right;">인원 : </h3>
		</div>

		<!-- 대상 추가 -->
		<div id="addperson" class="modal">

			<div class="modal-content" align="center">
				<span class="close">&times;</span>
				<h2 style="margin-left:15px;">수신인 추가하기</h2>
				<table>
				<tr>
					<td><h3 style="margin: 0 0;">학년 / 반 선택</h3></td>
				</tr>
				<tr>
					<td>
					<!-- 학년 선택 -->
					<select class="grade">
						<option class="op2" value="0" selected>--선택--</option>
						<option class="op2" value="mid1">중등 1학년</option>
						<option class="op2" value="mid2">중등 2학년</option>
						<option class="op2" value="mid3">중등 3학년</option>
						<option class="op2" value="high1">고등 1학년</option>
						<option class="op2" value="high2">고등 2학년</option>
						<option class="op2" value="high3">고등 3학년</option>
					</select>&emsp;
					<!-- 반 선택 -->
					<select class="class" style="display: none;">
					</select>
					</td>
				</tr>
				<tr>
					<td class="person" style="display: none;"><h3 style="margin: 0 0;">대상 선택</h3></td>
				</tr>
				<tr>
					<td>
					<!-- 대상 선택 -->
						<select class="person" style="display: none;">
							<option value="0" selected>-선택-</option>
							<option value="student">학생</option>
							<option value="parent">학부모</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<!-- 학생 목록 -->
						<div class="student">
						<input type="checkbox" id="student1">
						<label for="student1">학생 1</label>&emsp;
						<input type="checkbox" id="student2">
						<label for="student2">학생 2</label><br>
						<input type="checkbox" id="student3">
						<label for="student3">학생 3</label>&emsp;
						<input type="checkbox" id="student4">
						<label for="student4">학생 4</label>
						</div>
						
						<!-- 학부모 목록 -->
						<div class="parent">
						<input type="checkbox" id="parent1">
						<label for="parent1">학부모 1</label>&emsp;
						<input type="checkbox" id="parent2">
						<label for="parent2">학부모 2</label><br>
						<input type="checkbox" id="parent3">
						<label for="parent3">학부모 3</label>&emsp;
						<input type="checkbox" id="parent4">
						<label for="parent4">학부모 4</label>
						</div>
					</td>
				</tr>
				</table>
				<br>
				<button class="cancelbtn"
					style="margin-left: 100px; width: 100px; height: 30px; float: left;">취소</button>
				<button class="okbtn"
					style="margin-right: 100px; float: right; width: 100px; height: 30px;">확인</button>
				<br>
			</div>
		</div>

		<!-- 발송 내용 -->
		<div class="div1"
			style="float: right; margin-right: 5%;">
			<h2 style="float: left;">발송 내용</h2><br><br>
			<textarea id="smstext" placeholder="내용을 입력해주세요"
				style="resize: none; height: 350px; width: 100%;"></textarea><br>
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
		
		//학년 선택
		$(function(){
			var class1 = ['1반', '2반'];
			var class2 = ['1반', '2반', '3반', '4반'];
			//학년 값 변경 시
			$(".grade").change(function(){
				var sel = $(this).val();
				if(sel == 'mid1'){
					$(".student").hide();	//학생목록 숨김
					$(".parent").hide();	//학부모목록 숨김
					$(".person").hide();	//대상선택 숨김
					$(".class").show();		//반 선택 보임
					$(".op").remove();		//반 선택 옵션 삭제
					//반 선택 옵션 생성
					$(".class").append("<option class='op' value='0' selected>-선택-</option>");
					$.each(class1,function(i, item){
						$(".class").append("<option class='op' value='" + (i + 1) + "'>" + item + "</option>");
					});
				} else if(sel == 'mid2'){
					$(".student").hide();
					$(".parent").hide();
					$(".person").hide();
					$(".class").show();
					$(".op").remove();
					$(".class").append("<option class='op' value='0' selected>-선택-</option>");
					$.each(class2,function(i, item){
						$(".class").append("<option class='op' value='" + (i + 1) + "'>" + item + "</option>");
					});
				//학년 미 선택시 대상 선택 메뉴 숨김
				} else if($(".op2").val() == 0){
					$(".person").hide();
					$(".class").hide();
					$(".student").hide();
					$(".parent").hide();
				} else {
					$(".person").hide();
					$(".op").remove();
					$(".class").hide();
					$(".student").hide();
					$(".parent").hide();
				}
			});
		});
		
		//반 선택
		$(function(){
			var person = ['학생', '학부모'];
			//반 값 변경 시
			$(".class").change(function(){
				var sel = $(this).val();
				var op2 = $(".op2").val();
				if(sel != 0){
					$(".student").hide();
					$(".parent").hide();
					$(".person").show();
					$(".person").val(0).attr("selected", "selected");
					//반 미 선택시 대상 선택 메뉴 숨김
				} else if(op2 == 0){
					$(".student").hide();
					$(".parent").hide();
					$(".person").hide();
				}
			});
		});
		
		//대상 선택
		$(function(){
			$(".person").change(function(){
				var sel = $(this).val();
				switch(sel){
				case 'student' : $(".student").show(); $(".parent").hide(); break;
				case 'parent' : $(".student").hide(); $(".parent").show(); break;
				default : $(".student").hide(); $(".parent").hide(); break;
				}
			});
		});
	</script>
</body>
</html>