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
		border:2px solid lightgray;
		width:400px;
		height:200px;
		position:absolute;
		top:25%;
		left:28%;
	}
	.totalStudent {
		border:2px solid lightgray;
		width:400px;
		height:200px;
		position:absolute;
		top:25%;
		left:53%;
	}
	.clockArea {
		border:2px solid lightgray;
		width:600px;
		height:200px;
		position:absolute;
		top:60%;
		left:35%;
	}
</style>
</head>
<%@ include file="../../viewAcademy/common/menubar.jsp"%>
<body align="center">
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