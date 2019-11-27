<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>

.enrollStaff {
	font-size: 18px;
	margin-left: 1%;
	font-family: "Nanum Gothic";
	font-weight: bold;
	border: 2px solid green;
}

.enrollStaff:hover {
   cursor: pointer;
   background: green;
   border: 2px solid green;
   color: white;
}

</style>
<script>
		$(function(){
			$("#enrollPage").click(function(){
				location.href = "../mngStaff/enrollStaff.jsp";
				
			});
		});
</script>
</head>
<body>
	<header>
		<%@ include file="../common/menubar.jsp"%>
	</header>
	<section>
		<div>
			<button class="enrollStaff">엑셀로 직원 등록</button>
			<button class="enrollStaff" id="enrollPage">직원 등록</button>	
		</div>
	</section>
	<footer>
	</footer>
</body>
</html>