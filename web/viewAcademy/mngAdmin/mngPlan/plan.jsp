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
/* 모달 배경 */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* 모달 내부 상자 */
	.modal-content {
		background-color: #fefefe;
		margin: 13% auto; /* 15% from the top and centered */
		padding: 20px;
		border: 1px solid #888;
		width: 30%;
		background-color: #fefefe;
		/* Could be more or less, depending on screen size */
	}
/* 모달 닫기 버튼 */
#xBtn {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}
	
#xBtn:hover, #xBtn:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

ul {
	list-style:none;
	font-size: 20px;
}

ul > li {
	display:block;
	padding-bottom: 20px;
}
</style>
</head>
<%@ include file="/viewAcademy/common/menubar.jsp" %>
<body>			
		<div class="container">
			<!-- Top Navigation -->
			<header>

			</header>
			<section>
				<div class="head">
					<h2 align="center">연간계획</h2>
					<div class="btnArea">
					<select style="display:inline; float:left; margin-right:10px">
						<option value="" selected disabled hidden>년도별 검색</option>
						<option value="year">2019</option>
						<option value="year">2018</option>
					</select>
					<button id="addRow" style="display:inline; float:left">행 추가</button>
					<button id="deleteBtn" style="margin:10px; border:1px solid green; background:white; color:black; display:inline; float:right">삭제</button>
					<button id="writeBtn" style="margin:10px; border:1px solid green; background:white; color:black; display:inline; float:right" onclick="writePlan();">입력 및 수정</button>
					</div> <!-- btnArea end -->
				</div> <!-- head end -->
			<div class="body">
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
							<td>이달의 주요 이슈 컬럼 내에 내용이 길어지면 어떻게 될까?</td>
							<td>이달의 주요 이슈</td>
							<td>이달의 주요 이슈</td>
							<td>이달의 주요 이슈</td>
							<td>이달의 주요 이슈</td>
							<td>이달의 주요 이슈</td>
							<td>이달의 주요 이슈</td>
							<td>이달의 주요 이슈</td>
							<td>이달의 주요 이슈</td>
							<td>이달의 주요 이슈</td>
							<td>이달의 주요 이슈</td>
							<td>이달의 주요 이슈</td>
						</tr>
						<tr>
							<td>입시</td>
							<td>이달의 입시계획</td>
							<td>이달의 입시계획</td>
							<td>이달의 입시계획</td>
							<td>이달의 입시계획</td>
							<td>이달의 입시계획</td>
							<td>이달의 입시계획</td>
							<td>이달의 입시계획</td>
							<td>이달의 입시계획</td>
							<td>이달의 입시계획</td>
							<td>이달의 입시계획</td>
							<td>이달의 입시계획</td>
							<td>이달의 입시계획</td>
						</tr>
						<tr>
							<td>중등</td>
							<td>이달의 중등계획</td>
							<td>이달의 중등계획</td>
							<td>이달의 중등계획</td>
							<td>이달의 중등계획</td>
							<td>이달의 중등계획</td>
							<td>이달의 중등계획</td>
							<td>이달의 중등계획</td>
							<td>이달의 중등계획</td>
							<td>이달의 중등계획</td>
							<td>이달의 중등계획</td>
							<td>이달의 중등계획</td>
							<td>이달의 중등계획</td>
						</tr>
						<tr>
							<td>고등</td>
							<td>이달의 고등계획</td>
							<td>이달의 고등계획</td>
							<td>이달의 고등계획</td>
							<td>이달의 고등계획</td>
							<td>이달의 고등계획</td>
							<td>이달의 고등계획</td>
							<td>이달의 고등계획</td>
							<td>이달의 고등계획</td>
							<td>이달의 고등계획</td>
							<td>이달의 고등계획</td>
							<td>이달의 고등계획</td>
							<td>이달의 고등계획</td>
						</tr>
						<tr>
							<td>중.고 경시</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
						</tr>
						<tr>
							<td>행사</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
						</tr>
					</tbody>
				</table>
			</div> <!-- body end -->
		</div> <!-- /container -->

		<!-- 연간계획 삭제 -->
		<div id="deleteArea" class="modal">

			<div class="modal-content" align="center">
				<span id="xBtn">&times;</span>
				<h2 style="margin-left:15px;">연간계획 삭제하기</h2>
				<span>연간계획 삭제를 원하는 달을 선택하세요.</span>
				<div class="monthCheckArea">
					<form>
						<ul>
							<li>
								<input type="checkbox" name="1" id="jan"><label for="1">1월</label>
								<input type="checkbox" name="2" id="feb"><label for="2">2월</label>
								<input type="checkbox" name="3" id="mar"><label for="3">3월</label>
								<input type="checkbox" name="4" id="apr"><label for="4">4월</label>
							</li>
							<li>
								<input type="checkbox" name="5" id="may"><label for="5">5월</label>
								<input type="checkbox" name="6" id="jun"><label for="6">6월</label>
								<input type="checkbox" name="7" id="jul"><label for="7">7월</label>
								<input type="checkbox" name="8" id="aug"><label for="8">8월</label>
							</li>
							<li>
								<input type="checkbox" name="9" id="sep"><label for="9">9월</label>
								<input type="checkbox" name="10" id="oct"><label for="10">10월</label>
								<input type="checkbox" name="11" id="dec"><label for="11">11월</label>
								<input type="checkbox" name="12" id="nov"><label for="12">12월</label>
							</li>
						</ul>
					</form>
				</div> <!-- monthCheckArea end -->
				<button id="cancelbtn"
					style="margin-left: 100px; width: 100px; height: 30px; float: left; display:inline;" !important>취소</button>
				<button id="okbtn"
					style="margin-right: 100px; float: right; width: 100px; height: 30px; display:inline;" !important>확인</button>
				<br>
			</div>
		</div> <!-- deleteArea end -->
		</section>
		<footer>
		</footer>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script>
		<script src="js/jquery.stickyheader.js"></script>
		<script>
			function writePlan(){
				location.href="<%=request.getContextPath()%>/viewAcademy/mngAdmin/mngPlan/writePlan.jsp";
			}
			
			$(function(){
				var deleteBtn = document.getElementById('deleteBtn');
				var deleteArea = document.getElementById('deleteArea');
				var deleteOk = document.getElementById('okbtn');
				var cancleDelete = document.getElementById('cancelbtn');
				var closeBtn = document.getElementById('xBtn');
				
				deleteBtn.onclick = function() {
					deleteArea.style.display = "block";
				}
				
				closeBtn.onclick = function() {
					deleteArea.style.display = "none";
				}
				
				cancleDelete.onclick = function() {
					deleteArea.style.display = "none";
				}
				
				deleteOk.onclick = function() {
					//체크된 월 삭제 기능 실행됨
					
					
					//기능이 다 실행된 후 결과값에 따라 성공 시, 삭제 결과가 반영된 연간계획 페이지 / 실패 시 에러페이지로 이동
					deleteArea.style.display = "none";
				}
			});

			
			
				
			
		</script>
</body>
</html>