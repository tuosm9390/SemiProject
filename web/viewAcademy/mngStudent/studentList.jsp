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
		<%@ include file="../common/menubar.jsp"%>
	</header>
	<section>
	<div align="center">
	<fieldset style="border-bottom: none; border-left: none; border-right: none; border-top-color: black;
					width: 20%; font-family:'Do Hyeon'">
		<legend align="center"><h1>　전체 학생　</h1></legend>
	</fieldset>
	</div>
	<div style="width: 90%; margin: auto auto;">
		<button id="addexcel">엑셀로 성적 일괄 등록</button>
		<button id="addstudent">학생 등록</button>
		<script>
			function insertStudent() {
				location.href="<%=request.getContextPath()%>/viewAcademy/mngStudent/tempStudentInsert.jsp";
			};
		</script>
		<input type="file" id="exelfile">
		<table class="table">
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
	</div>
	</section>
	<footer>
	</footer>
	<script>
		$("#addstudent").click(function(){
			location.href="<%=request.getContextPath()%>/viewAcademy/mngStudent/enrollStudent.jsp";
		});
		
		$("#addexcel").click(function() {
			$("#exelfile").click();
		});

		$(".table tr:not(:first-child)").click(function() {
			location.href = "<%=request.getContextPath()%>/viewAcademy/mngStudent/mngInfo/studentInfo.jsp";
		});
		
		
	</script>
</body>
</html>