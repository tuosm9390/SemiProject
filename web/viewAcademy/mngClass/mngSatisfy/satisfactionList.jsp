<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, hagong.academy.mngClass.mngSatisfy.model.vo.*"%>
<%
	ArrayList<SatisfyInfo> list = (ArrayList<SatisfyInfo>) request.getAttribute("list");
%>
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

.table tr:not(:first-child){
	cursor:pointer;
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

#modalBtnTable td{
	display: inline-flex;
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
					<h1 style="font-family: 'Do Hyeon'">　만족도 조사 목록　</h1>
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
					<th>만족도 조사 제목</th>
					<th>만족도 조사 날짜</th>
				</tr>
				<% if(list.size() != 0){
					for(SatisfyInfo si : list) {%>
				<tr>
					<input type="hidden" id="satNo" name="satNo" value="<%= si.getSatNo() %>">
					<td><%=si.getRowNum() %></td>
					<td><%=si.getSatTitle() %></td>
					<td><%=si.getStart() + " ~ " + si.getEnd()%></td>
				</tr>
				<% } }else { }%>
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
						<td width="250px">
						<select id="benefitType">
							<option value="수강비" selected>수강비</option>
						</select></td>
					</tr>
					<tr>
						<td>적용 시점</td>
						<td>
						<select id="applyPoint" class='sort' space="&nbsp;" align="center"
						style="border: 1px solid lightgray; border-radius: 5px; height: 30px">
							<option value="진행중인 강의">진행중인 강의</option>
							<option value="다음 강의">다음 강의</option>
						</select>
						</td>
					</tr>
					<tr>
						<td>할인률</td>
						<td><input type="number" id="benefitRate" min="1" style="width: 50px;"></td>
					</tr>
				</table>
				<table id="modalBtnTable">
					<tr>
						<td colspan="2">
							<button id="deleteBtn2"
								style="margin-left: 20px; width: 100px; height: 30px;">삭제</button>
							<button type="button" id="updateBtn2"
								style="width: 100px; height: 30px;">추가</button>
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
		
		$(".table td").click(function() {
			var satNo = $("#satNo").val();
			location.href = "<%=request.getContextPath()%>/adetail.satis?satNo=" + satNo;
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

		updateBtn2.onclick = function(i) {
			
			
			var benefitType = $("#benefitType").val();
			var benefitRate = $("#benefitRate").val();
			var applyPoint = $("#applyPoint").val();

			$("#benefitSelect").append(
					"<option value=" + benefitType + benefitRate + ">" + benefitType + " / " + benefitRate + "% / " + applyPoint + "</option>");
			
			
		};

		deleteBtn2.onclick = function() {
			var benefitType = $("#benefitType").val();
			
			var deleteBen = window.prompt('삭제할 할인율 입력');
			$("select[id='benefitSelect'] option[value=" + benefitType + deleteBen + "]").remove();
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