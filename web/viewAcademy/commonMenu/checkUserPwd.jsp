<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
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
	input {border: 1px solid lightgray; border-radius: 5px;}
	
	#memberId:hover { border:2px solid green; }
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
	<%@ include file="../common/menubar.jsp" %>
	   
	<%-- <%  int viewLevel = 0;
		int modiLevel = 0;
		for(int i = 0; i < menuLevelList.size(); i++) {
			if(menuLevelList.get(i).getMmid().equals("MODIFYINFO1")) {
				viewLevel = menuLevelList.get(i).getMlevel();
			}  else if(menuLevelList.get(i).getMmid().equals("MODIFYINFO2")) {
				modiLevel = menuLevelList.get(i).getMlevel();
			}
		}
	%> --%>
	<%-- <% if(loginUser != null && loginUser.getLevel() <= modiLevel) { %> --%>
	<div class="background">	
	<div align="center" id="container">
		<form id="loginArea" method="post">
			<ul>
				<li><img src="<%=request.getContextPath()%>/images/hagong.png" style="width:120px; heigh:120px; margin-bottom:50px"></li>
				<li><label>비밀번호 확인&nbsp;&nbsp;</label>
				<input type="hidden" id="userNo" name="userNo" value="<%= loginUser.getUserNo() %>">
				<input type="password" id="userPwd" name="userPwd" placeholder=" 비밀번호 입력"
				style="padding-top:10px;padding-bottom:5px;width:250px;margin-bottom:10px"></li>
			</ul>
		
		<div id="container-footer">
			<ul>
				<li>
				<input type="button" id="loginBtn" value="확　인" onclick="return checkPwd();">
				</li>
			</ul>
		</div>
		</form>
	</div>
	</div>
	<script>
		function checkPwd(){
			var userPwd = $("#userPwd").val();
			var userNo = $("#userNo").val();
			$.ajax({
				url:"<%=request.getContextPath()%>/acheck.ps",
				data:{userPwd:userPwd, userNo:userNo},
				type:"post",
				success:function(data){
					if(data == "success") {
						alert("비밀번호가 확인되었습니다.");
						location.href = "<%=request.getContextPath()%>/adetail.ps?type=modify&no=<%=loginUser.getUserNo()%>";
					} else {
						alert("비밀번호가 일치하지 않습니다.");
						$("#userPwd").val("");
					}
				},
				error:function(error, status){
					alert("SYSTEM ERROR!")
				}
			});
		}
	</script>
	<% } else { 
		request.setAttribute("errorCode", "NotFoundError");
		request.getRequestDispatcher("/viewAcademy/common/commonError.jsp").forward(request, response);
	   } %>
</body>
</html>