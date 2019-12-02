<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#profile {
	width: 200px;
	height: 200px;
	radius: 50%;
}

td {
	background: white;
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
		<%@ include file="../common/menubar.jsp"%>
	</header>
	<h2 style="margin-left: 10%;">학생 등록</h2>
	<section style="margin-bottom: 10%;">
		<form id="enrollStudentForm">
			<table align="center" style="width: 100%;">
				<tr align="center">
					<td rowspan="6">
						<div align="center">
							<img id="profile"
								src="<%=request.getContextPath()%>/images/user.png">
							<button id="addimg" style="height: 1.5em; margin-top: 3%;">사진
								선택</button>
							<input type="file" id="imgfile">
						</div>
					</td>
				</tr>
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
					<td><input type="text" placeholder="학교 입력"> &nbsp; <input
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
					<td></td>
					<td><li>학부모 이름 / 아이디</li></td>
					<td><input type="text" placeholder="학부모 이름 입력"> &nbsp;
						<input type="text" placeholder="학부모 아이디 입력"></td>
				</tr>
				<tr>
					<td></td>
					<td><li>학부모 전화번호</li></td>
					<td><input type="tel"> - <input type="tel"> -
						<input type="tel"></td>
				</tr>
				<tr>
					<td></td>
					<td><li>희망대학 / 학과</li></td>
					<td><input type="text" placeholder="희망 대학 입력"> &nbsp;
						<input type="text" placeholder="희망 학과 입력"></td>
				</tr>
				<tr>
					<td></td>
					<td><li>주소</li></td>
					<td><input type="text" placeholder="주소 입력"
						style="width: 400px;"></td>
				</tr>
				<tr>
					<td></td>
					<td><li>이메일</li></td>
					<td><input type="email" placeholder="이메일 입력"
						style="width: 400px;"></td>
				</tr>
				<tr>
					<td></td>
					<td><li>개인정보 동의여부</li></td>
					<td>
						<div style="width: 500px; height: 200px; overflow: auto;">개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보
							제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용개인정보 제공 동의 내용</div>
					</td>
				</tr>
			</table>
		</form>
		<button id="okbtn"
			style="float: right; width: 80px; height: 30px; margin-left: 10px;">등록</button>
		<button id="cancelbtn"
			onclick="location.href='<%=request.getContextPath()%>/viewAcademy/mngStudent/studentList.jsp'"
			style="float: right; width: 80px; height: 30px;">취소</button>
	</section>

	<footer> </footer>
	<script>
		$("#addimg").click(function() {
			$("#imgfile").click();
		});

		$("#okbtn").click(function() {
			$("#enrollStudentForm").submit();
		});
	</script>
</body>
</html>