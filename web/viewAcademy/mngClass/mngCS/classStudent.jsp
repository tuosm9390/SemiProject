<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">
	<head>
		<meta charset="UTF-8" />
		<title>HAGONG</title>
<!-- 		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" /> -->
		<!--[if IE]>
  		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	<style>
		#classStudent table *{
			text-align:center;
			text-align: -webkit-center;
		}
	</style>
	</head>
	<%@ include file="/viewAcademy/common/menubar.jsp" %>
	<body>			
		<div class="container" id="classStudent">
			<!-- Top Navigation -->
			<header>

			</header>
			<div class="component">
				<h2>개설강좌 리스트</h2>
				<table id="classlist">
					<thead>
						<tr>
							<th>Index</th>
							<th>강의명</th>
							<th>개설 기간</th>
							<th>강의실</th>
						</tr>
					</thead>
					<tbody>
						<tr><td class="user-name">1</td><td class="user-email">수학 기초반1</td><td class="user-phone">2019.03.02. ~ 2019.06.17</td><td class="user-mobile">1층A강의실</td></tr>
						<tr><td class="user-name">2</td><td class="user-email">수학 기초반2</td><td class="user-phone">2019.03.02. ~ 2019.06.17</td><td class="user-mobile">1층A강의실</td></tr>
						<tr><td class="user-name">3</td><td class="user-email">영어 ABC 클래스-오전</td><td class="user-phone">2019.03.02. ~ 2019.06.17</td><td class="user-mobile">1층A강의실</td></tr>
						<tr><td class="user-name">4</td><td class="user-email">영어 ABC 클래스-오후</td><td class="user-phone">2019.03.02. ~ 2019.06.17</td><td class="user-mobile">1층A강의실</td></tr>
						<tr><td class="user-name">5</td><td class="user-email">여름방학 고2 선행 특강</td><td class="user-phone">2019.03.02. ~ 2019.06.17</td><td class="user-mobile">1층A강의실</td></tr>
						<tr><td class="user-name">6</td><td class="user-email">고3 수능 직전 벼락치기반</td><td class="user-phone">2019.03.02. ~ 2019.06.17</td><td class="user-mobile">1층A강의실</td></tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- /container -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script>
		<!-- <script src="js/jquery.stickyheader.js"></script> -->
		<script>
			$(function(){
				$("#classlist td").click(function(){
					location.href = "<%= request.getContextPath()%>/viewAcademy/mngClass/mngCS/detailClassList.jsp";
				});
			})
		</script>
	</body>
</html>