<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = (String) request.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.background {
		position: absolute;
    	top: 55%;
    	left: 50%;
    	transform: translate(-50%, -50%)
	}
	#container {
		width:450px;
		height:40%;
		align:center;
		border:1px solid gray;
		padding-top:50px;
		padding-bottom:50px;
		margin-top:50px;
		margin-bottom:50px;
		margin-left:auto;
		margin-right:auto;
		border-radius: 10px/10px;
  		box-shadow:2px 2px 2px 2px #999;
	}
	
	#container-footer {
		margin-bottom:30px;
	}
	
	ul { list-style:none; margin-right:25px;}
	
	#userId:hover { border:2px solid green; }
	#password:hover { border:2px solid green; }
	#reLoginBtn { width:250px; height:40px; background:white; border:1px solid green; border-radius:5px/5px;}
	#reLoginBtn:hover { background:green; color:white; }
</style>
<style type="text/css">
	body {
   		font-family: "Nanum Gothic Coding";
	}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="background">	
	<div align="center" id="container">
		<form id="middle">
			<ul>
				<li><img src="<%=request.getContextPath()%>/images/hagong.png" style="width:120px; heigh:120px; margin-bottom:50px"></li>
				<li style="margin-bottom:50px"><%= userId %><label>님 로그아웃 되었습니다.</label></li>
			</ul>
		</form>
		<div id="container-footer">
			<ul>
				<li><input type="button" id="reLoginBtn" value="재로그인 하기" action="" method="" onClick="location.href='<%=request.getContextPath()%>/viewAcademy/common/login.jsp'"></li>
			</ul>
		</div>
	</div>
	</div>
</body>
</html>