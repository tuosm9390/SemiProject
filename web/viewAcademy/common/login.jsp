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
		padding-bottom:50px;
		margin-top:150px;
		margin-bottom:50px;
		margin-left:auto;
		margin-right:auto;
		border-radius: 10px/10px;
  		box-shadow:2px 2px 2px 2px #999;
  		/* font-family:"Nanum Gothic Coding"; */
	}
	
	#container-footer {
		margin-bottom:30px;
	}
	
	ul { list-style:none; margin-right:25px;}
	
	#userId:hover { border:2px solid green; }
	#password:hover { border:2px solid green; }
	#loginBtn { width:250px; height:40px; background:white; border:1px solid green; border-radius:5px/5px;}
	#loginBtn:hover { background:green; color:white; }
	#find { color:black; }
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
		<form id="loginArea" action="<%=request.getContextPath() %>/login.me" method="post">
			<ul>
				<li><img src="../images/hagong.png" style="width:120px; heigh:120px; margin-bottom:50px"></li>
				<li><label>아이디 &nbsp;&nbsp;&nbsp;</label>
				<input type="text" id="memberId" name="memberId" placeholder="  고유번호(아이디)를 입력해주세요" 
				style="padding-top:10px;padding-bottom:5px;width:250px"></li><br>
				<li><label>비밀번호&nbsp;&nbsp;</label>
				<input type="password" id="password" name="password" placeholder="  비밀번호를 입력해주세요"
				style="padding-top:10px;padding-bottom:5px;width:250px;margin-bottom:10px"></li>
			</ul>
		
		<div id="container-footer">
			<ul>
				<li>
				<div style="display:inline">
				<input type="checkbox" name="loginMaintain" checked><label for="loginMaintain">로그인 상태 유지</label>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label><a href="../views/findPwd.jsp" style="color:black">비밀번호 찾기</a></label>
				</div>
				</li>
				<br><br>
				<li>
				<input type="submit" id="loginBtn" value="로그인"> <!-- onClick="location.href='../views/newPwd.jsp'"> -->
				</li>
			</ul>
		</div>
		</form>
	</div>
	</div>
</body>
</html>