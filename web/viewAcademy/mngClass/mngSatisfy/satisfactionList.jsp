<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section button {
	float: right;
	margin-bottom: 5px;
	margin-left: 1%;
	font-size: 18px;
	font-family: "Nanum Gothic";
	font-weight: bold;
	border: 2px solid green;
}

section button:hover {
	cursor: pointer;
	background: green;
	border: 2px solid green;
	color: white;
}

select {
	border: 1px solid lightgray;
	border-radius: 5px;
	height: 30px;
}

select:focus {
	outline: none;
}

tr
:not
 
(
:first-child
 
){
cursor
:
 
pointer
;


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
	width: 30%;
	background-color: #fefefe;
	border-radius: 10px;
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

#modalTable td {
	padding: 10px;
	border: 1px solid lightgray;
	text-align: center;
}

#modalTable td {
	text-weight: bold;
}

#modalBtnTable {
	margin-top: 20px;
}
<%int test = 1;%>
</style>
</head>
<body>
	<header>
		<%@ include file="../../common/menubar.jsp"%>
	</header>
	<section>
		<div align="center">
			<fieldset
				style="border-left: none; border-right: none; border-bottom: none; border-top-color: black; width: 25%;">
				<legend align="center">
					<h1 style="font-family: 'Do Hyeon'">만족도 조사 목록</h1>
				</legend>
			</fieldset>
		</div>
		<!-- 권한별 버튼 -->
		<%
			if (test == 1) {
		%>
		<button id="addSatisfaction" style="margin-right: 5%;">만족도 조사
			등록</button>
		<button id="benefitBtn">혜택 관리</button>
		<%
			}
		%>
		<form>
			<table class="table" align="center" style="width: 90%;">
				<tr>
					<th>No.</th>
					<th>만족도 조사 내용</th>
					<th>만족도 조사 날짜</th>
				</tr>
				<tr>
					<td>6</td>
					<td>2019 하반기 학원 운영 관련 만족도 평가</td>
					<td>2019.11.30 ~ 2020.01.02</td>
				</tr>
				<tr>
					<td>5</td>
					<td>2019-2학기 중간 만족도 평가</td>
					<td>2019.11.10 ~ 2020.01.20</td>
				</tr>
				<tr>
					<td>4</td>
					<td>2019-9월 모의고사 대비 특강 만족도 조사</td>
					<td>2019.11.10 ~ 2020.01.20</td>
				</tr>
				<tr>
					<td>3</td>
					<td>2019 여름방학 특강 만족도 조사</td>
					<td>2019.07.30 ~ 2019.08.06</td>
				</tr>
				<tr>
					<td>2</td>
					<td>2019-1학기 중간 만족도 평가</td>
					<td>2019.06.10 ~ 2019.07.20</td>
				</tr>
				<tr>
					<td>1</td>
					<td>2019 겨울방학 특강 만족도 조사</td>
					<td>2019.01.10 ~ 2019.02.20</td>
				</tr>
			</table>
		</form>

		<!-- 혜택관리 팝업 -->
		<div id="benefit" class="modal">
			<div class="modal-content" align="center">
				<span class="close">&times;</span>
				<h2 style="margin-left: 35px;">혜택 관리</h2>
				<table id="modalTable">
					<tr>
						<td align="center" colspan="2">
						<select class='sort' id="benefitSelect" align="center" space="&nbsp;"
							style="border: 1px solid lightgray; border-radius: 5px; height: 30px">
								<option selected>선택</option>
						</select></td>
					</tr>
					<tr>
						<td width="100px">혜택구분</td>
						<td width="250px"><input type="text" id="benefitType"></td>
					</tr>
					<tr>
						<td>할인률</td>
						<td><input type="number" id="benefitRate" min="1"></td>
					</tr>
				</table>
				<table id="modalBtnTable">
					<tr>
						<td colspan="2">
							<button id="deleteBtn2"
								style="display: inline; margin-left: 20px; width: 100px; height: 30px;">삭제</button>
							<button type="button" id="updateBtn2"
								style="display: inline; width: 100px; height: 30px;">추가</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</section>
	<footer> </footer>
	<script>
		$("#addSatisfaction").click(function(){
			location.href="<%=request.getContextPath()%>/viewAcademy/mngClass/mngSatisfy/addSatisfaction.jsp";
		});
		
		$(".table tr:not(:first-child)").click(function() {
			location.href = "<%=request.getContextPath()%>/viewAcademy/mngClass/mngSatisfy/satisfactionDetail.jsp";
		});
		
		$(".table tr:last-child").click(function(){
			location.href="<%=request.getContextPath()%>/viewAcademy/mngClass/mngSatisfy/satisfactionResult.jsp";
		});

		var benefit = document.getElementById("benefit");
		var benefitBtn = document.getElementById("benefitBtn");

		// 모달 실행
		benefitBtn.onclick = function() {
			benefit.style.display = "block";
		};

		var closelist = document.getElementsByClassName("close")[0];

		closelist.onclick = function() {
			benefit.style.display = "none";
		};

		updateBtn2.onclick = function() {
			var benefitType = $("#benefitType").val();
			var benefitRate = $("#benefitRate").val();

			$("#benefitSelect").append(
					"<option value=" + benefitType + ">" + benefitType + " / " + benefitRate + "%</option>");
		};

		deleteBtn2.onclick = function() {
			var deleteBen = window.prompt('삭제할 강의실명 입력');
			$("select[id='benefitSelect'] option[value='" + deleteBen + "']").remove();
		};

		//select option 가운데정렬
		(function() {
			if (!/interative|complete/.test(document.readyState))
				return setTimeout(arguments.callee, 300);
			var all = document.getElementsByTagName('select');
			for (var i = 0, c = all.length; i < c; i++) {
				all[i].className.indexOf('sort') != -1 &&
				sort(all[i]);
			}
			function sort(select) {
				var p = 'innerText'
				, m = 'getAttribute'
				, options = select.options
				, space = select[m]('space') || '-'
				, max = 0
				, lens = []
				;
				for (var i = 0, c = options.length; i < c; i++) {
					lens[i] = options[i][p].length;
					if (lens[i] > max)
						max = lens[i];
				}
				if (select[m]('align') == 'center') {
					for (i = 0; i < c; i++)
						options[i][p] = tap(space, (max - lens[i]) / 2)
								+ options[i][p];
				} else {
					for (i = 0; i < c; i++)
						options[i][p] = tap(space, max - lens[i])
								+ options[i][p];
				}
			}
			function tap(space, len) {
				var str = '';
				while (len-->0)
					str += space;
				return str;
			}
		})();
	</script>
</body>
</html>