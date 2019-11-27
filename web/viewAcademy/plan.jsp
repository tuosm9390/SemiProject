<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">
	<head>
		<meta charset="UTF-8" />
		<title>Sticky Table Headers Revisited | Demo 1</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<meta name="description" content="Sticky Table Headers Revisited: Creating functional and flexible sticky table headers" />
		<meta name="keywords" content="Sticky Table Headers Revisited" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<!--[if IE]>
  		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	</head>
	<%@ include file="../viewAcademy/common/menubar.jsp" %>
	<body>			
		<div class="container">
			<!-- Top Navigation -->
			<header>

			</header>
			<div class="component">
				<h2>개설강좌 리스트</h2>
				<table>
					<thead>
						<tr>
							<th>Index</th>
							<th>강의명</th>
							<th>개설 기간</th>
							<th>강의실</th>
						</tr>
					</thead>
					<tbody>
						<tr><td class="user-name">1</td><td class="user-email">수학 기초반1</td><td class="user-phone">(398)-332-5385</td><td class="user-mobile">(888)-677-3719</td></tr>
						<tr><td class="user-name">2</td><td class="user-email">수학 기초반2</td><td class="user-phone">(293)-873-2247</td><td class="user-mobile">(216)-889-4933</td></tr>
						<tr><td class="user-name">3</td><td class="user-email">영어 ABC 클래스-오전</td><td class="user-phone">(957)-213-3499</td><td class="user-mobile">(207)-516-4474</td></tr>
						<tr><td class="user-name">4</td><td class="user-email">영어 ABC 클래스-오후</td><td class="user-phone">(897)-762-9782</td><td class="user-mobile">(565)-627-3002</td></tr>
						<tr><td class="user-name">5</td><td class="user-email">여름방학 고2 선행 특강</td><td class="user-phone">(231)-391-6269</td><td class="user-mobile">(790)-838-2130</td></tr>
						<tr><td class="user-name">6</td><td class="user-email">고3 수능 직전 벼락치기반</td><td class="user-phone">(204)-488-5204</td><td class="user-mobile">(508)-463-6811</td></tr>
						<tr><td class="user-name">7</td><td class="user-email">nevaeh.diaz99@example.com</td><td class="user-phone">(436)-578-2946</td><td class="user-mobile">(906)-412-3302</td></tr>
						<tr><td class="user-name">8</td><td class="user-email">kathy.miller62@example.com</td><td class="user-phone">(724)-705-3555</td><td class="user-mobile">(764)-841-2531</td></tr>
						<tr><td class="user-name">9</td><td class="user-email">susan.king88@example.com</td><td class="user-phone">(774)-205-7754</td><td class="user-mobile">(639)-267-9728</td></tr>
						<tr><td class="user-name">10</td><td class="user-email">jeffery.ramirez83@example.com</td><td class="user-phone">(723)-243-7706</td><td class="user-mobile">(172)-597-3422</td></tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- /container -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script>
		<script src="js/jquery.stickyheader.js"></script>
	</body>
</html>