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

input[type=button]{
	width: 30px;
	margin-bottom: 5px;
	margin-left: 1%;
	font-size: 18px;
	font-family: "Nanum Gothic";
	font-weight: bold;
	border: 2px solid green;
	border-radius: 5px;
	background: none;
	color: black;
}

input[type=text], select {
	border: 1px solid lightgray;
	border-radius: 5px;
	height: 30px;
}

textarea{
	border: 1px solid lightgray;
	border-radius: 5px;
}
section button:hover {
	cursor: pointer;
	background: green;
	border: 2px solid green;
	color: white;
}

th, td {
	background: white;
	text-align: left !important;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../common/menubar.jsp"%>
	</header>
	<section>
		<h2 style="margin-left: 5%;">만족도 조사 수정</h2>
		<br>
		<form>
			<table align="center" style="width: 90%;">
				<tr>
					<td><li>만족도 조사 제목</td>
					<td><input type="text" value="2019 하반기 학원 운영 관련 만족도 평가" size="50"></td>
				</tr>
				<tr>
					<td><li>만족도 조사 대상</td>
					<td><input type="text" value="전체 원생 및 학부모 대상" size="50">
						<select>
							<option>대상 인원 입력</option>
					</select></td>
				</tr>
				<tr>
					<td><li>만족도 조사 날짜</td>
					<td><input type="date"> ~ <input type="date"></td>	
				</tr>
				<tr>
					<td><li>문항 및 결과</td>
				</tr>
				<tr>
					<td colspan="2">
						<ol>
							<li>&emsp;
							<input type="text" value="수업 커리큘럼에 대한 만족도" size="100"> <input type="button" value="-">
							<input type="button" value="+">
							<br>
							<br> &emsp;
							<input type="text" value="진도와 내용이 적당했다" size="50">
							<select>
									<option>선택자 수</option>
							</select>
							<input type="button" value="-">
							<input type="button" value="+">
							<br> &emsp;
							<input type="text" value="비교적 내용이 부족하다고 느껴졌다." size="50">
							<select>
									<option>선택자 수</option>
							</select>
							<input type="button" value="-">
							<input type="button" value="+">
							<br> &emsp;
							<input type="text" value="진도 진행이 적절하지 않았다고 생각한다." size="50">
							<select>
									<option>선택자 수</option>
							</select>
							<input type="button" value="-">
							<input type="button" value="+">
							</li>
							<br>
							<li>&emsp;
								<input type="text" value="수업 및 강사에 대한 개선 의견" size="100">
								<input type="button" value="-">
								<input type="button" value="+"><br><br>
								&emsp;
								<textarea placeholder="내용을 입력해주세요" cols="80" rows="6" style="resize: none;"></textarea>
							</li>
						</ol>
					</td>
				</tr>
			</table>
		</form>
		<button style="margin-right: 5%; margin-bottom: 50px;" onclick="">수정하기</button>
		<button onclick="location.href='<%=request.getContextPath()%>/viewAcademy/mngClass/mngSatisfy/satisfactionList.jsp'">취소</button>
	</section>
	<footer> </footer>
</body>
</html>