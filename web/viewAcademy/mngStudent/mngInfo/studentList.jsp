<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, hagong.academy.mngStudent.mngInfo.model.vo.*"%>
<%
	ArrayList<Student> list = (ArrayList<Student>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
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
		<%@ include file="../../common/menubar.jsp"%>
	</header>
	<section>
	<div align="center">
	<fieldset style="margin-bottom: -25px; border-bottom: none; border-left: none; border-right: none; border-top-color: black;
					width: 18%; font-family:'Do Hyeon'">
		<legend align="center"><h1>　전체 학생　</h1></legend>
	</fieldset>
	</div>
	<div style="width: 90%; margin: auto auto;">
		<button id="addexcel">엑셀로 성적 일괄 등록</button>
		<button id="addstudent">학생 등록</button>
		<input type="file" id="exelfile">
		<table class="table">
			<tr>
				<th>ID</th>
				<th>학생 이름</th>
				<th>나이</th>
				<th>전화번호</th>
				<th>학교</th>
				<th>학부모 전화번호</th>
				<th>희망학과</th>
			</tr>
			<%
				for (Student s : list) {
			%>
			<tr>
				<td><%=s.getUserId()%></td>
				<td><%=s.getName() %></td>
				<td><%=s.getAge() %></td>
				<td><%=s.getPhone() %></td>
				<td><%=s.getSchool() %></td>
				<td><%=s.getRefPhone() %></td>
				<td><%=s.getMajor() %></td>
			</tr>
			<% } %>
		</table>
	</div>
	</section>
	<footer>
	</footer>
	<script>
		$("#addstudent").click(function(){
			location.href="<%=request.getContextPath()%>/viewAcademy/mngStudent/mngInfo/enrollStudent.jsp";
		});
		
		$("#addexcel").click(function() {
			$("#exelfile").click();
		});

		$(".table td").click(function() {
			<%-- location.href = "<%=request.getContextPath()%>/viewAcademy/mngStudent/mngInfo/studentDetail.jsp"; --%>
			var userId = $(this).parent().children().eq(0).text();
			
			location.href="<%=request.getContextPath()%>/adetail.info?userId=" + userId;
		});
		
		
	</script>
</body>
</html>