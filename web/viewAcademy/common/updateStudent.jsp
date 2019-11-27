<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
tr {
	width: 100%;
	height: 40px;
	text-align: left;
}

input {
	border: 1px solid lightgray;
	border-radius: 5px;
	height: 20px;
}

input[type=tel] {
	width: 50px;
}

input[type=text], select {
	border: 1px solid lightgray;
	border-radius: 5px;
	width: 200px;
	height: 20px;
}

#studentStatus {
	width: 70px;
}

input[type='file'] {
	display: none;
}

section button {
	font-size: 18px;
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
		<%@ include file="menubar.jsp"%>
	</header>
	<section style="display: inline-flex;">
		<div id="img" style="margin-left: 15%;" align="center">
			<img src="<%=request.getContextPath()%>/images/user.png"
				style="height: 200px; margin-bottom: 10px;">
			<button id="addimg" style="height: 2em; margin-bottom: 10px;">사진
				선택</button>
			<input type="file" id="imgfile"> <select id="studentStatus">
				<option selected>재원</option>
				<option>퇴원</option>
				<option>휴원</option>
			</select>
		</div>

		<div>
			<form id="updateForm" action="" method="post">
				<table style="width: 700px; margin-left: 15%; margin-bottom: 3%;">
					<tr>
						<td><li>이름 / 아이디</li></td>
						<td><input type="text" placeholder="이름 입력"> &nbsp; <input
							type="text" placeholder="아이디 입력"></td>
					</tr>
					<tr>
						<td><li>생년월일</li></td>
						<td><input type="date"></td>
					</tr>
					<tr>
						<td><li>전화번호</li></td>
						<td><input type="tel"> - <input type="tel"> -
							<input type="tel"></td>
					</tr>
					<tr>
						<td><li>학교 / 학년</li></td>
						<td><input type="text" placeholder="kh중학교"> &nbsp; <input
							type="number" min="1" max="3" style="width: 40px;"></td>
					</tr>
					<tr>
						<td><li>계열</li></td>
						<td><select>
								<option>인문</option>
								<option>자연</option>
								<option>예체능</option>
						</select></td>
					</tr>
					<tr>
						<td><li>학부모 이름 / 아이디</li></td>
						<td><input type="text" placeholder="박상찬"> &nbsp; <input
							type="text" placeholder="scpark9999"></td>
					</tr>
					<tr>
						<td><li>학부모 전화번호</li></td>
						<td><input type="tel"> - <input type="tel"> -
							<input type="tel"></td>
					</tr>
					<tr>
						<td><li>희망대학 / 학과</li></td>
						<td><input type="text" placeholder="희망 대학 입력"> &nbsp;
							<input type="text" placeholder=""></td>
					</tr>
					<tr>
						<td><li>주소</li></td>
						<td><input type="text" placeholder="학생 거주지 입력"
							style="width: 400px;"></td>
					</tr>
					<tr>
						<td><li>이메일</li></td>
						<td><input type="email" placeholder="helloworld@kakao.com"
							style="width: 400px;"></td>
					</tr>
					<tr>
						<td><li>개인정보 동의여부</li></td>
						<td>Y</td>
					</tr>
				</table>
			</form>
			<button id="okbtn"
				style="float: right; width: 80px; height: 30px; margin-left: 10px;">수정</button>
			<button id="cancelbtn" onclick="location.href='<%=request.getContextPath()%>/viewAcademy/common/studentInfo.jsp'"
				style="float: right; width: 80px; height: 30px;">취소</button>
		</div>
	</section>
	<footer> </footer>
	<script>
		$("#addimg").click(function() {
			$("#imgfile").click();
		});

		$("#okbtn").click(function() {
			$("#updateForm").submit();
		});
	</script>
</body>
</html>