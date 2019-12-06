<%--
/**
 * <pre>
 * 1. Author      : Hyerin
 * 2. CreateDate  : 2019. 12. 6. 오전 10:54:19
 * 3. ModifyDate  : 2019. 12. 6. 오전 10:54:19
 * 4. FileName    : 
 * 4. Description : 
 * </pre>
 */
--%>
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
				location.href="<%=request.getContextPath()%>/viewAcademy/common/academyMain.jsp";
			});
		});
	</script>
	
	<% } %>
</body>
</html>