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
</style>
</head>
<body>
	<header>
		<%@ include file="../../common/menubar.jsp"%>
	</header>
	<section align="center">
		<h2 align="center">2019 겨울방학 특강 만족도 조사</h2>
		<div align="center">
			<li>대상 : 강남고등학교 2학년<고3 대비 선행 특강반>
			<li>실시 기간 : 2019.01.10 ~ 2019.02.20
		</div>
		<button style="margin-right: 20%;"
			onclick="location.href='<%=request.getContextPath()%>/viewAcademy/mngClass/mngSatisfy/satisfactionList.jsp'">닫기</button>
		<button>삭제</button>
		
		<!-- 문항 목록 작성 -->
	</section>
	<footer></footer>
</body>
</html>