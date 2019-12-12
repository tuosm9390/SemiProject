<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% String errorCode = (String) request.getAttribute("errorCode"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<% if(errorCode == "loginFail") { %>
	<script>
		$(function(){
			swal ({
				title: "로그인 실패",
				text: "아이디와 비밀번호를 확인하세요.",
				icon: "warning",
				button: "확인"
			}).then(function(){
				location.href="<%=request.getContextPath()%>/viewAcademy/main.jsp";
			});
		});
	</script>
	
	<% }else if(errorCode == "pwdUpdateFail") { %>
	<script>
		$(function(){
			swal ({
				title: "비밀번호 변경 실패",
				text: "비밀번호 변경에 실패하셨습니다.",
				icon: "warning",
				button: "확인"
			}).then(function(){
				location.href="<%=request.getContextPath()%>/viewAcademy/main.jsp";
			});
		});
	</script>
	
	<% }else if(errorCode == "insertStaffFail") { %>
	<script>
		$(function(){
			swal ({
				title: "직원정보 등록 실패",
				text: "직원정보 등록에 실패하셨습니다.",
				icon: "warning",
				button: "확인"
			}).then(function(){
				location.href="<%=request.getContextPath()%>/viewAcademy/mngStaff/staffList.jsp";
			});
		});
	</script>
	<% } %>
</body>
</html>