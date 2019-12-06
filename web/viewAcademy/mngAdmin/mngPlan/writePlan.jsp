<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8" />
<title>연간계획 입력</title>
<style>
	body {
		font-family: "Nanum Gothic";
	}
	#head {
		position:absolute;
		top:20%;
		width:86%;
	}
	.text {
		background:none;
		border:none;
	}
	.body {
		width:86%;
		height:520px;
		position:absolute; top:35%;
		display:inline;
		overflow:auto;
		
	}
	#planTableArea {
		overflow:auto;
	}
	#cancle:hover, #update:hover {
		background:green;
		color:white;
	}
</style>
</head>
<%@ include file="/viewAcademy/common/menubar.jsp" %>
<body>			
		<div class="container">
			<!-- Top Navigation -->
			<header>

			</header>
				<div id="head">
					<h2>연간계획 작성</h2>
					<button id="cancle" style="float:right; margin:10px; border:1px solid green; background:white; color:black; display:inline" onclick="location.href='plan.jsp'">취소</button>
					<button id="update" style="float:right; margin:10px; border:1px solid green; background:white; color:black; display:inline">입력 완료</button>
				</div>
				<div class="body">
				<form>
				<table id="planTableArea" class="table">
					<thead>
						<tr>
							<th></th>
							<th>1월</th>
							<th>2월</th>
							<th>3월</th>
							<th>4월</th>
							<th>5월</th>
							<th>6월</th>
							<th>7월</th>
							<th>8월</th>
							<th>9월</th>
							<th>10월</th>
							<th>11월</th>
							<th>12월</th>
					</thead>
					<tbody>
						<tr>
							<td>주요 이슈</td>
							<% for(int i=0; i<12; i++) { %>
								<td><input type="text" class="text"></td>
							<% } %>
						</tr>
						<tr>
							<td>입시</td>
							<% for(int i=0; i<12; i++) { %>
								<td><input type="text" class="text"></td>
							<% } %>
						</tr>
						<tr>
							<td>중등</td>
							<% for(int i=0; i<12; i++) { %>
								<td><input type="text" class="text"></td>
							<% } %>
						</tr>
						<tr>
							<td>고등</td>
							<% for(int i=0; i<12; i++) { %>
								<td><input type="text" class="text"></td>
							<% } %>
						</tr>
						<tr>
							<td>중.고 경시</td>
							<% for(int i=0; i<12; i++) { %>
								<td><input type="text" class="text"></td>
							<% } %>
						</tr>
						<tr>
							<td>행사</td>
							<% for(int i=0; i<12; i++) { %>
								<td><input type="text" class="text"></td>
							<% } %>
						</tr>
					</tbody>
				</table>
				</form>
			</div> <!-- body end -->
		</div> <!-- /container -->

		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script>
		<script src="js/jquery.stickyheader.js"></script>
	</body>
</html>