<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../common/menubar.jsp" %>
		<div class="container">
	<!-- Top Navigation -->
	<header>

	</header>
			<div class="component" id="consilArea">
				<h2>블랙리스트</h2>
				<table id="classlist">
					<thead>
						<tr>
							<th>원생명</th>
							<th>학교</th>
							<th>학년</th>
							<th>휴대폰번호</th>
						</tr>
					</thead>
					<tbody id="consList">
						<tr><td class="user-name">강동원</td><td class="last-cons">KH고등학교</td><td class="cons-list">1학년</td><td>010-7777-8888</td></tr>
						<tr><td class="user-name">주지훈</td><td class="last-cons">정교중학교</td><td class="cons-list">2학년</td><td>010-7777-8887</td></tr>
						<tr><td class="user-name">조진웅</td><td class="last-cons">케에고등학고</td><td class="cons-list">1학년</td><td>010-7777-8886</td></tr>
						<tr><td class="user-name">정유미</td><td class="last-cons">케에고등학고</td><td class="cons-list">3학년</td><td>010-7777-8885</td></tr>
						<tr><td class="user-name">전지현</td><td class="last-cons">케에고등학고</td><td class="cons-list">3학년</td><td>010-7777-8884</td></tr>
					</tbody>
				</table>
			</div>
			<script>
				$(function(){
					$("#consList td").click(function(){
						location.href="<%=request.getContextPath()%>/viewAcademy/mngStudent/mngBlack/blacklistDetail.jsp";
					});
				})
			</script>
		</div>
		<!-- /container -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script>
		<!-- <script src="js/jquery.stickyheader.js"></script> -->
</body>
</html>