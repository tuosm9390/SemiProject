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
	#classStudent .table *{
		text-align:center;
		text-align: -webkit-center;
	}
	.srchArea{margin-bottom:10px;}
	.srchArea input{float:right;margin:0px 10px 7px 10px;height:19px;border-radius:5px;border:1px solid gray;}
	.srchArea select{border-radius:5px;border:1px solid gray;}
	.srchArea button{float:right;width:60px; height:25px;}
	
</style>
	</head>
	<body>
		<header>
			<%@ include file="/viewAcademy/common/menubar.jsp" %>
		</header>
		<section>
			<div class="container" id="classStudent">
			<!-- Top Navigation -->

			<div class="component">
				<div align="center">
	      			<fieldset style=" margin-bottom:-15px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;width:20%;">
	         			<legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">　강좌 리스트　</h1></legend>
	      			</fieldset>
	      		</div>
				<div class="srchArea">
					<button class="srchBtn">검색</button>
					<input type="search" id="searchStudent" name="searchStudent">
					<select style="float:right">
						<option value="" selected disabled hidden>조건별 검색</option>
						<option name="searchClassCondition" value="title">강의명</option>
						<option name="searchClassCondition" value="place">강의실</option>
					</select>
				</div>
				<table id="classlist" class="table">
					<thead>
						<tr>
							<th>Index</th>
							<th>강의명</th>
							<th>담당강사</th>
							<th>개설 기간</th>
							<th>강의실</th>
						</tr>
					</thead>
					<tbody>
						<tr><td class="user-name">1</td><td class="user-email">수학 기초반1</td><td>빛상찬</td><td class="user-phone">2019.03.02. ~ 2019.06.17</td><td class="user-mobile">1층A강의실</td></tr>
						<tr><td class="user-name">2</td><td class="user-email">수학 기초반2</td><td>빛상준</td><td class="user-phone">2019.03.02. ~ 2019.06.17</td><td class="user-mobile">1층A강의실</td></tr>
						<tr><td class="user-name">3</td><td class="user-email">영어 ABC 클래스-오전</td><td>킹진호</td><td class="user-phone">2019.03.02. ~ 2019.06.17</td><td class="user-mobile">1층A강의실</td></tr>
						<tr><td class="user-name">4</td><td class="user-email">영어 ABC 클래스-오후</td><td>킹진호</td><td class="user-phone">2019.03.02. ~ 2019.06.17</td><td class="user-mobile">1층A강의실</td></tr>
						<tr><td class="user-name">5</td><td class="user-email">여름방학 고2 선행 특강</td><td>킹진호</td><td class="user-phone">2019.03.02. ~ 2019.06.17</td><td class="user-mobile">1층A강의실</td></tr>
						<tr><td class="user-name">6</td><td class="user-email">고3 수능 직전 벼락치기반</td><td>킹진호</td><td class="user-phone">2019.03.02. ~ 2019.06.17</td><td class="user-mobile">1층A강의실</td></tr>
					</tbody>
				</table>
			</div>
		</div>
		</section>			
	
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