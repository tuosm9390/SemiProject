<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
</head>
<style>
	#consilArea table *{
		text-align:center;
		text-align: -webkit-center;
	}
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
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 50%;
	background-color: #fefefe;
	/* Could be more or less, depending on screen size */
}
/* 모달 닫기 버튼 */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
.detailArea {
	display: table-caption;
}
.inputCons {
	resize:none;
}
.btnArea {
	text-align:center;
}
.btnArea button{
	display:inline-block;
	margin:0 2px;
}
.btnArea .updateCons {
	display:none;
}

.updateBtn {
	display:inline-block;
	margin:0 2px;
	width: 70px;
	height: 22px;
	line-height: 22px;
	text-decoration: none;
	border: 1px solid green;
	border-radius: 5px;
	background: none;
	color: black;
	position: relative;
}

.updateBtn:focus {
	outline: none;
}

.updateBtn:hover {
	cursor: pointer;
	background: green;
	border: 1px solid green;
	color: white;
}
.detailArea{display: block;width: 100%;}
.dArea .dCtn{padding-bottom: 20px;}
.dArea .dCtn .inputCons{padding: 4px;}
.dArea .dCtn.consTitle .inputCons{display: block;width: 100%;}
.dArea .dCtn .consCate{padding: 4px;width: 162px;}
.dArea .dTit{display: block;padding-bottom: 5px;font-weight: bold;font-size: 15px;}
.dArea textarea.inputCons{width: 100%;min-height: 100px;}
.btnArea{padding: 10px 40px 40px 40px;}
.srchArea{margin-bottom:10px;}
.srchArea select{float:right;border-radius:5px;border:1px solid gray;}
.srchArea input{float:right;margin:0px 10px 7px 10px;height:19px;border-radius:5px;border:1px solid gray;}
.srchArea button{float:right;width:60px; height:25px;}
.names{display:flex;}
.names .dCtn.tName{margin-right:160px;}
.dArea.dArea2{display:flex;}
.dArea.dArea2 .dCtn.consDate{margin-right:160px;}
</style>
<body>
	<header>
		<%@ include file="../../common/menubar.jsp" %>
	</header>
	<section>
		<div class="container">
	<!-- Top Navigation -->
			<div class="component" id="consilArea">
				<div align="center">
      				<fieldset style="margin-top:-25px; margin-bottom:-15px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;width:25%">
         				<legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">　학생상담 리스트　</h1></legend>
     	 			</fieldset>
      			</div>
				<div class="srchArea">
					<button class="srchBtn">검색</button>
					<input type="search" id="searchStudent" name="searchStudent">
					<select style="float:right">
						<option value="" selected disabled hidden>조건별 검색</option>
						<option name="searchClassCondition" value="name">원생명</option>
						<option name="searchClassCondition" value="phone">전화번호</option>
					</select>
				</div>
				<table id="classlist" class="table">
					<thead>
						<tr>
							<th>원생명</th>
							<th>ID</th>
							<th>상담횟수</th>
							<th>마지막 상담일자</th>
							<th>상담일지</th>
							<th>상담추가</th>
						</tr>
					</thead>
					<tbody id="consList">
						<tr><td class="user-name">강동원(010-7777-8888)</td><td>qwer123</td><td class="cons-count">1회</td><td class="last-cons">2019.03.02.</td><td class="cons-list"><button onclick="conslist();">상담일지</button></td><td><button onclick="addCouns();">상담추가</button></td></tr>
						<tr><td class="user-name">주지훈(010-7777-8888)</td><td>qwer124</td><td class="cons-count">4회</td><td class="last-cons">2019.03.02.</td><td class="cons-list"><button onclick="conslist();">상담일지</button></td><td><button onclick="addCouns();">상담추가</button></td></tr>
						<tr><td class="user-name">조진웅(010-7777-8888)</td><td>qwer125</td><td class="cons-count">11회</td><td class="last-cons">2019.03.02.</td><td class="cons-list"><button onclick="conslist();">상담일지</button></td><td><button onclick="addCouns();">상담추가</button></td></tr>
						<tr><td class="user-name">정유미(010-7777-8888)</td><td>qwer126</td><td class="cons-count">31회</td><td class="last-cons">2019.03.02.</td><td class="cons-list"><button onclick="conslist();">상담일지</button></td><td><button onclick="addCouns();">상담추가</button></td></tr>
						<tr><td class="user-name">전지현(010-7777-8888)</td><td>qwer127</td><td class="cons-count">3회</td><td class="last-cons">2019.03.02.</td><td class="cons-list"><button onclick="conslist();">상담일지</button></td><td><button onclick="addCouns();">상담추가</button></td></tr>
						<tr><td class="user-name">김지원(010-7777-8888)</td><td>qwer128</td><td class="cons-count">0회</td><td class="last-cons">2019.03.02.</td><td class="cons-list"><button onclick="conslist();">상담일지</button></td><td><button onclick="addCouns();">상담추가</button></td></tr>
					</tbody>
				</table>
			</div>

		</div>
		
	</section>

		<!-- 모달기능 -->
		<section align="center">

		<!-- 항목 추가 -->
		<div id="addlist" class="modal">
			<div class="modal-content" align="center">
				<span class="close">&times;</span>
				<div align="center">
			      <fieldset style="margin-top:-25px; margin-bottom:-15px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;">
			         <legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">　상담추가　</h1></legend>
			      </fieldset>
     			 </div>
					<form class="accordion__content" method="post">
						<div class="detailArea" align="left">
							<div class="dArea dArea1">
								<div class="dCtn consTitle">
									<label class="dTit">상담제목</label>
									<input type="text" class="inputCons" value="학원생활 관련 상담(1)">
								</div>
							<div class="names">
								<div class="dCtn tName">
									<label class="dTit">상담자 이름</label>
									<input type="text" class="inputCons" value="서범수" readonly>
								</div>
								<div class="dCtn sName">
									<label class="dTit">상담학생명</label>
									<input type="text" class="inputCons" value="김지원" readonly>
								</div>
							</div>
							</div>
							<div class="dArea dArea2">
								<div class="dCtn consDate"> 
									<label class="dTit">상담일자</label>
									<input type="text" class="inputCons" id="from" name="from" value="" readonly>
								</div>
								<div class="dCtn category">
									<label class="dTit">상담종류</label>
									<select name="consCategory" class="consCate">
										<option value="class">수업</option>
										<option value="life">학원생활</option>
										<option value="atit">태도</option>
										<option value="etc">기타</option>
									</select>
								</div>
							</div>
							<div class="dArea dArea3">
								<div class="dCtn content">
									<label class="dTit">내용</label>
									<textarea class="inputCons" name="consreq">상담내용입니다.</textarea>
								</div>
								<div class="dCtn answer">
									<label class="dTit">상담자의 대응내용</label>
									<textarea class="inputCons" name="consres">상담대응내용입니다.</textarea>
								</div>
							</div>
						</div>
						<div class="btnArea">
							<button class="cancelbtn"
								style="margin-left: 150px; width: 100px; height: 30px; float: left;">취소</button>
							<button class="okbtn"
								style="margin-right: 150px; float: right; width: 100px; height: 30px;">확인</button>
						</div>
					</form>
				</div>
			</div>
		</section>
	<footer> </footer>
	<!-- 스크립트 -->
			<script>
				function conslist(){
					location.href = "<%=request.getContextPath()%>/viewAcademy/mngStudent/mngCouns/studentConsDetail.jsp";					
				};
				function addCouns() {
					$("#addlist").css("display","block");
				};

		</script>
		<!-- /container --><!-- 
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script> -->
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script>
		<!-- <script src="js/jquery.stickyheader.js"></script> -->
		<script>
		// 대상 추가 모달
		var addlist = document.getElementById('addlist');

		// 모달 실행 버튼
		var addlistbtn = document.getElementById("addlistbtn");

		// 모달 닫기 버튼
		var closelist = document.getElementsByClassName("close")[0];
		var cancellist = document.getElementsByClassName("cancelbtn")[0];

		// x버튼 클릭 시 종료
		closelist.onclick = function() {
			addlist.style.display = "none";
		}
		cancellist.onclick = function() {
			addlist.style.display = "none";
		}
		
		//DatePicker
		$.datepicker.setDefaults({
    		dateFormat: 'yy-mm-dd',
    		prevText: '이전 달',
    		nextText: '다음 달',
    		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    		dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    		showMonthAfterYear: true,
    		changeMonth : true,
			changeYear : true,
			constrainInput: false,
    		yearSuffix: '년'
  		});
		$(function() {
			$("#from").datepicker();
		});
		</script>
</body>
</html>