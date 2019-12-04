<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관계자 메인</title>
<style>
	.totalArea div{
		display: inline-block;
	}
	.totalStaff {
		width:200px;
		height:200px;
		background:pink;
	}
	.totalStudent {
		width:200px;
		height:200px;
		background:skyblue;
	}
</style>
</head>
<%@ include file="../../viewAcademy/common/menubar.jsp"%>
<body align="center">
	<h1>관계자 메인</h1>
	<div class="outer">
		<div class="totalArea">
			<div class="totalStaff">
				<h1>총 직원 수 : 30</h1>
			</div>
			<div class="totalStudent">
				<h1>총 학생 수 : 231</h1>
			</div>
		</div> <!-- totalArea end -->
		<div class="clockArea">
			<h1>21:49:59 PM</h1>
		</div> <!-- clockArea end -->
	</div> <!-- outer end -->
</body>
</html>