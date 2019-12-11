<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="hagong.academy.common.member.model.vo.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding:400" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua:400" rel="stylesheet">
<title>HAGONG</title>
<style>
body {
	background: url("/hagong/images/mainImage.jpg") no-repeat top;
	background-size: 86%;
	font-family: "Jua";
}

.totalArea div {
	display: inline-block;
	font-size: 20px;
}

.totalStaff {
	width: 300px;
	height: 100px;
	position: absolute;
	top: 25%;
	left: 30%;
}

.totalStudent {
	width: 300px;
	height: 100px;
	position: absolute;
	top: 25%;
	left: 53%;
	display: inline;
}

.clockArea {
	width: 600px;
	height: 200px;
	position: absolute;
	top: 60%;
	left: 32%;
}

#clock {
	height: 400px;
	line-height: 250px;
	color: #666;
	font-size: 400px;
	font-style: bold;
	text-align: center;
	position: absolute;
	top: 40%;
	left: 15.5%;
}
</style>
</head>
<body align="center" onload="printClock()">
<%@ include file="../viewAcademy/common/menubar.jsp" %>
	<div class="outer">
		<div class="totalArea">
			<div class="totalStaff">
				<table>
					<tr>
						<td><img
							src="<%=request.getContextPath()%>/images/teacher.png"
							style="height: 70px; display: inline;"></td>
						<td><h2>총 직원 수 : </h2></td>
					</tr>
				</table>
			</div>
			<div class="totalStudent">
				<table>
					<tr>
						<td><img
							src="<%=request.getContextPath()%>/images/student.png"
							style="height: 70px; display: inline;"></td>
						<td><h2>총 학생 수 : 231</h2></td>
					</tr>
				</table>
			</div>
		</div>
		<!-- totalArea end -->
		<!-- 		<div class="clockArea">
			<h1 style="font-size:70px">21:49:59 PM</h1>
		</div> clockArea end -->
		<div
			style="margin-top: 50px; width: 60%; height: 250px; line-height: 250px; color: black; font-size: 170px; 
			text-align: center;" id="clock"></div>
	</div>
	<!-- outer end -->

	<script>
		function printClock() {

			var clock = document.getElementById("clock"); // 출력할 장소 선택
			var currentDate = new Date(); // 현재시간
			var calendar = currentDate.getFullYear() + "-"
					+ (currentDate.getMonth() + 1) + "-"
					+ currentDate.getDate() // 현재 날짜
			var amPm = 'AM'; // 초기값 AM
			var currentHours = addZeros(currentDate.getHours(), 2);
			var currentMinute = addZeros(currentDate.getMinutes(), 2);
			var currentSeconds = addZeros(currentDate.getSeconds(), 2);

			if (currentHours > 12) { // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
				amPm = 'PM';
				currentHours = addZeros(currentHours - 12, 2);
			} else if(currentHours = 12){
				amPm = 'PM';
				currentHours = addZeros(currentHours, 2);
			}

			if (currentSeconds >= 50) {// 50초 이상일 때 색을 변환해 준다.
				currentSeconds = '<span style="color:#de1951;">'
						+ currentSeconds + '</span>'
			}
			clock.innerHTML = " <span style='font-size:50px;'>" + amPm
					+ "</span>" + " " + currentHours + ":" + currentMinute
					+ ":" + currentSeconds; //날짜를 출력해 줌

			setTimeout("printClock()", 1000); // 1초마다 printClock() 함수 호출
		}

		function addZeros(num, digit) { // 자릿수 맞춰주기
			var zero = '';
			num = num.toString();
			if (num.length < digit) {
				for (i = 0; i < digit - num.length; i++) {
					zero += '0';
				}
			}
			return zero + num;
		}
	</script>
</body>
</html>