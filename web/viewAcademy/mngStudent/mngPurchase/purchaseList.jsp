<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.wrap {
	margin: auto auto;
	width: 100%;
	padding: 30px;
}

.accordion {
	display: block;
	position: relative;
	width: 100%;
}

.accordion__item {
	display: block;
	width: 100%;
	margin-bottom: 15px;
}

.accordion__item:last-child {
	margin-bottom: 0;
}

.accordion__title {
	width: 100%;
	display: block;
	position: relative;
	height: 40px;
	line-height: 40px;
	padding: 0px 50px 0 20px;
	font-size: .875em;
	font-weight: 500;
	color: #333;
	border-bottom: 1px solid #eee;
	overflow: hidden;
	transition: background-color .2s;
	text-decoration: none;
	display: block;
}

.accordion__title:hover {
	background-color: #fafafa;
}

.accordion__title.active {
	background: #31bc86;
	color: white;
}

.accordion__title.active .x7 {
	transform: rotate(-90deg);
}

.accordion__title.active .btop {
	width: 67%;
	top: 2px;
	transform: translateY(-50%) rotate(-45deg);
	transform-origin: 50% 50%;
}

.accordion__title.active .bmid {
	opacity: 0;
}

.accordion__title.active .bbot {
	width: 67%;
	bottom: 2px;
	transform: translateY(50%) rotate(45deg);
	transform-origin: 50% 50%;
}

.accordion__content {
	display: none;
	position: relative;
	overflow: hidden;
	border: 1px solid #eee;
	border-top: none;
	line-height: 1.65;
	background-color: #fff;
	font-size: .875em;
}

.bmenu {
	position: absolute;
	font-size: 20px;
	width: 26px;
	height: 16px;
	display: block;
	right: 15px;
	top: 1px;
}

.btnmenu {
	position: absoulute;
	font-size: 12px;
	width: 300px;
	height: 15px;
	display: inline;
	right: 15px;
	top: 1px;
}

.outArea {
	width: 90%;
	margin: auto auto;
}

.btnArea {
	width: 90%;
	margin-left:6.5%;
}

.month {
	display: inline;
}

.actionBtn {
	display: inline;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../../common/menubar.jsp"%>
	</header>
	<section>
		<h2 align="left" style="width: 150px; margin-left: 5%;">수납 내역</h2>
		<div class="outArea">
		
			<div align="center" class="monthArea">
				<button class="month">◀</button>
				<select class="month">
					<option>2019</option>
				</select>
				<select class="month">
					<% for(int i = 1; i < 13; i++) { %>
					<option><%= i %></option>
					<% } %>
				</select>
				<button class="month">▶</button>
			</div> <!-- monthArea end -->
			
			<div class="btnArea">
				<div style="float:left;"><button>환불규정 확인</button></div>
				<div style="float:right;"><button>미납자 모아보기</button></div>
			</div> <!-- btnArea end -->
			
			<div class="wrap">
				<ul class="accordion">
					<% for(int j = 0; j < 10; j++) { %>
					<li class="accordion__item">
						<a class="accordion__title" href="javascript:void(0)" align="center">김진호의 국어 교실
							<div class="btnmenu">
								<button class="actionBtn">수납 처리</button>
								<button class="actionBtn">고지서 발급</button>
								<button class="actionBtn">영수증 발급</button>
							</div>
							<div class="bmenu">▼</div>
						</a>
						<div class="accordion__content">
							<div class="tableArea">
								<table class="table" style="width:100%; float:left;">
									<tr>
										<th><input type="checkbox" id="selectAll"><label for="selectAll">전체선택</label></th>
										<th>학생 이름</th>
										<th>학생 ID</th>
										<th>청구 금액</th>
										<th>납부 여부</th>
										<th>상세</th>
									</tr>
									<% for(int k = 0; k < 10; k++) { %>
									<tr>
										<td><input type="checkbox"></td>
										<td>남윤진</td>
										<td>NYJ970708</td>
										<td>300,000원</td>
										<td>미납</td>
										<td><a href="#">상세보기</a></td>
									</tr>
									<% } %>
								</table>
							</div> <!-- tableArea -->
						</div>
					</li>
					<br>
					<% } %>					
				</ul>
			</div> <!-- wrap end -->
		<script>
			$(function() {
				$('.accordion').find('.accordion__title').click(function() {
					// Adds active class
					$(this).toggleClass('active');
					// Expand or collapse this panel
					$(this).next().slideToggle('fast');
					// Removes active class from other titles
					$('.accordion__title').not($(this)).removeClass('active');
				});
				
				$("#selectAll").click(function(){
					$(this).parent().parent().children().children().eq(0).prop("checked", true);
				});
			});
		</script>
		
		</div> <!-- outArea end -->
	</section>
	<footer>
	</footer>
</body>
</html>