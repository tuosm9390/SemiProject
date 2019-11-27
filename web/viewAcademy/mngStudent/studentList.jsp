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

input[type='file'] {
	display: none;
}

table {
	border-collapse: collapse;
	width: 100%;
}

tr, th {
	height: 40px;
}

tr:not(:first-child){
	cursor: pointer;
}
</style>
</head>
<body>
	<header>
		<%@ include file="menubar.jsp"%>
	</header>
	<section>
		<h2 align="left" style="width: 150px;">전체 학생</h2>
		<button id="addexcel">엑셀로 성적 일괄 등록</button>
		<button id="addstudent">학생 등록</button>
		<input type="file" id="exelfile">
		<table>
			<tr>
				<th>학생 ID</th>
				<th>학생 이름</th>
				<th>나이</th>
				<th>전화번호</th>
				<th>학교</th>
				<th>학부모 전화번호</th>
				<th>희망학과</th>
			</tr>
			<tr>
				<td>S001</td>
				<td>박상준</td>
				<td>17</td>
				<td>010-1234-1231</td>
				<td>kh고등학교</td>
				<td>010-3131-3131</td>
				<td>사망</td>
			</tr>
			<tr>
				<td>S001</td>
				<td>박상준</td>
				<td>17</td>
				<td>010-1234-1231</td>
				<td>kh고등학교</td>
				<td>010-3131-3131</td>
				<td>사망</td>
			</tr>
			<tr>
				<td>S001</td>
				<td>박상준</td>
				<td>17</td>
				<td>010-1234-1231</td>
				<td>kh고등학교</td>
				<td>010-3131-3131</td>
				<td>사망</td>
			</tr>
			<tr>
				<td>S001</td>
				<td>박상준</td>
				<td>17</td>
				<td>010-1234-1231</td>
				<td>kh고등학교</td>
				<td>010-3131-3131</td>
				<td>사망</td>
			</tr>
		</table>
	</section>
	<footer> </footer>
	<script>
		$("#addexcel").click(function() {
			$("#exelfile").click();
		});

		$("tr:not(first-child)").click(function() {
			location.href = "<%=request.getContextPath()%>/viewAcademy/common/studentInfo.jsp";
		});
	</script>
</body>
</html>