<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding:400" rel="stylesheet">
<style>
	.background {
		position: absolute;
    	top: 50%;
    	left: 50%;
    	transform: translate(-50%, -50%)
	}
	#container {
		width:450px;
		height:40%;
		align:center;
		border:1px solid gray;
		padding-top:50px;
		padding-bottom:30px;
		margin-top:150px;
		margin-bottom:50px;
		margin-left:auto;
		margin-right:auto;
		border-radius: 10px/10px;
  		box-shadow:2px 2px 2px 2px #999;
  		font-family:"Nanum Gothic Coding"; */
	}
	
	#container-footer {
		margin-bottom:30px;
	}
	
	ul { list-style:none; margin-right:25px;}
	
	input:hover { border:2px solid green; }
	#okBtn { width:250px; height:40px; background:white; border:1px solid green; border-radius:5px/5px;}
	#okBtn:hover { background:green; color:white; }
</style>
<style type="text/css">
	body {
   		font-family: "Nanum Gothic Coding";
	}
</style>
</head>
<body>
	<div class="background">	
	<div align="center" id="container">
		<h2 style="color:green">비밀번호 찾기</h2>
		<form id="middle">
			<ul>
				<li><input type="password" id="newPwd" name="newPwd" placeholder="  고유번호(아이디)를 입력해주세요" 
				style="padding-top:3%;padding-bottom:3%;width:80%;margin-bottom:3%"></li><br>
				<li><input type="tel" id="phone" name="phone" placeholder="  전화번호를 입력해주세요"
				style="padding-top:3%;padding-bottom:3%;width:80%;margin-top:3%; margin-bottom:3%">
				<button style="margin-left:60%; border:1px solid green; background:white">인증하기</button></li><br>
				<li><input type="text" id="number" name="number" placeholder="  인증번호를 입력해주세요"
				style="padding-top:3%;padding-bottom:3%;width:80%;margin-bottom:3%"></li>
			</ul>
		</form>
		<div id="container-footer">
			<ul>
				<li>
				<input type="button" id="okBtn" value="확인" action="" method="" onClick="location.href='../views/findPwd2.jsp'">
				</li>
			</ul>
		</div>
	</div>
	</div>
</body>
</html>