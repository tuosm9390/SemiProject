<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">
	<head>
		<meta charset="UTF-8" />
		<title>연간계획</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<meta name="description" content="Sticky Table Headers Revisited: Creating functional and flexible sticky table headers" />
		<meta name="keywords" content="Sticky Table Headers Revisited" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<style>
		#head > button {
			float:right;
		}
		#head > select {
			float:left;
		}
		.component {
			overflow:auto;
		}
	</style>
	</head>
	<%@ include file="/viewAcademy/common/menubar.jsp" %>
	<body>			
		<div class="container">
			<!-- Top Navigation -->
			<header>

			</header>
			<div class="component">
				<div id="head">
					<h2 align="center">연간계획</h2>
					<select>
						<option value="" selected disabled hidden>년도별 검색</option>
						<option value="year">2019</option>
						<option value="year">2018</option>
					</select>
					<button class="deleteBtn" style="margin:10px; border:1px solid green; background:white; color:black; display:inline">삭제</button>
					<button id="write" style="margin:10px; border:1px solid green; background:white; color:black; display:inline" onclick="writePlan();">입력 및 수정</button>
					<a href="#" class="input-user-name" data-user-id ="1">방문자명 입력</a>
				</div>
				<table id="planTableArea">
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
						<tr><td class="user-name">주요 이슈</td><td class="user-email"></td><td class="user-phone"></td><td class="user-mobile"></td></tr>
						<tr><td class="user-name">입시</td><td class="user-email"></td><td class="user-phone"></td><td class="user-mobile"></td></tr>
						<tr><td class="user-name">중등</td><td class="user-email"></td><td class="user-phone"></td><td class="user-mobile"></td></tr>
						<tr><td class="user-name">고등</td><td class="user-email"></td><td class="user-phone"></td><td class="user-mobile"></td></tr>
						<tr><td class="user-name">중.고 경시</td><td class="user-email"></td><td class="user-phone"></td><td class="user-mobile"></td></tr>
						<tr><td class="user-name">행사</td><td class="user-email"></td><td class="user-phone"></td><td class="user-mobile"></td></tr>
						<tr><td class="user-name"></td><td class="user-email"></td><td class="user-phone"></td><td class="user-mobile"></td></tr>
						<tr><td class="user-name"></td><td class="user-email"></td><td class="user-phone"></td><td class="user-mobile"></td></tr>
						<tr><td class="user-name"></td><td class="user-email"></td><td class="user-phone"></td><td class="user-mobile"></td></tr>
						<tr><td class="user-name"></td><td class="user-email"></td><td class="user-phone"></td><td class="user-mobile"></td></tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- /container -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script>
		<script src="js/jquery.stickyheader.js"></script>
		<script>
			function writePlan(){
				location.href="<%=request.getContextPath()%>/viewAcademy/mngAdmin/mngPlan/writePlan.jsp";
			}
			
			function deletePlan(){
				swal("삭제하시겠습니까?", {
					buttons : [ "취소", "확인" ],
				});
			};
				
			
		</script>
</body>
</html>