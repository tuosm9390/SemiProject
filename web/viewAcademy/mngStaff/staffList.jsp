<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
.listArea {
	width: 90%;
	margin-left: auto;
	margin-right: auto;
}
.btnArea {
	margin-left: 77%;
	margin-bottom: 5px;
}

.enrollStaff {
	font-size: 18px;
	margin-left: 1%;
	font-family: "Nanum Gothic";
	font-weight: bold;
	border: 2px solid green;
	display: inline;
}

.enrollStaff:hover {
	cursor: pointer;
	background: green;
	border: 2px solid green;
	color: white;
	display: inline;
}

.staffList {
	width: 90%;
}

input[type=file] {
	display: none;
}

fieldset {
	width:17%;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../common/menubar.jsp"%>
	</header>
	<section>
		<div align="center">
      		<fieldset style="margin-bottom:-30px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;">
         		<legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">　전체 직원　</h1></legend>
      		</fieldset>
      	</div>
		<div class="btnArea">
			<button class="enrollStaff" id="enrollPage">직원 등록</button>
			<button class="enrollStaff" id="enrollExcel">엑셀로 직원 등록</button>
			<input type="file" id="btnExcel">
		</div>
		<!-- btnArea end -->
		<div class="listArea">
			<table class="staffList table" align="center">
				<tr>
					<th>ID</th>
					<th>이름</th>
					<th>연령</th>
					<th>전화번호</th>
					<th>담당과목</th>
				</tr>
				<%
					for (int i = 0; i < 10; i++) {
				%>
				<tr>
					<td>KJH001204</td>
					<td>김진호</td>
					<td>20</td>
					<td>010-0000-7771</td>
					<td>중등 국어</td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
		<!-- listArea end -->
		<script>
		$(function(){
			$("#enrollPage").click(function(){
				location.href = "../mngStaff/enrollStaff.jsp";
			});
			
			$("#enrollExcel").click(function(){
				$("#btnExcel").click();
			});
			
			$(".listArea td").mouseenter(function(){
				$(this).parent().css({"cursor":"pointer"});
				}).click(function(){
					location.href = "<%=request.getContextPath()%>/viewAcademy/mngStaff/staffDetail.jsp";
				});
			});
		</script>
	</section>
	<footer> </footer>
</body>
</html>