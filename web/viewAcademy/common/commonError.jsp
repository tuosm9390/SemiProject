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
<script>
	$(function(){
		if(errorCode == "loginFail"){
			console.log("되나?");
		}
	});
</script>
</body>
</html>