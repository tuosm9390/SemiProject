<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon:400" rel="stylesheet">
<style>
body {
	font-family:'Do Hyeon';
}
.out {
	width:1560px;
	height:720px;
}

.outLine {
	margin: 0 auto;
	width:100%;
	height:100%;
	border: 10px solid green;
}

.btnArea {
	position: absolute;
	margin-left:23%;
}

.goAcademy {
	position: absolute;
	width:23.5%;
	height:60%;
	z-index:1;
	margin-top:3.5%;
	margin-left:24%;
	text-align:center;
}
.goClient {
	position: absolute;
	width:23.5%;
	height:60%;
	z-index:1;
	margin-top:3.5%;
	margin-left:49.6%;
	text-align:center;
}

.goAcademy:hover, .goClient:hover {
	color: orangered;
	cursor: pointer;
}
</style>
</head>
<body>
	<header>
		<!-- 관계자 메뉴 -->
		<%-- <%@ include file="../viewAcademy/common/academyMain.jsp" %> --%>
		<!-- 고객 메뉴 -->
		<%-- <%@ include file="../viewClient/common/clientMain.jsp"%> --%>
	</header>
	<section>
		<div class="out">
			<div class="outLine">
				<div align="center" style="margin-top:2%;"><img src="/hagong/images/indexTitle.png"></div>
				<div class="goAcademy" onclick="goAcademy();">
					<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
					<label style="font-size:40px;">원장님 & 선생님</label> <br>
					<label style="font-size:25px; color:white;">학원관계자</label>
				</div>
				<div class="goClient" onclick="goClient();">
					<br> <br> <br> <br> <br> <br> <br>
					<label style="font-size:40px;">학생 & 학부모님</label> <br>
					<label style="font-size:25px; color:white;">학원재원생</label>
				</div>
				<div class="btnArea"><img src="/hagong/images/indexBtn.png"></div>
			</div> <!-- outLine end -->
		</div> <!-- out end -->
		
		<script>
			function goAcademy(){
				location.href="<%=request.getContextPath()%>/allStaff.cm";
			}
			
			function goClient(){
				location.href="viewClient/common/login.jsp";
			}
			
		</script>
	</section>
	<footer>
	</footer>
</body>
</html>