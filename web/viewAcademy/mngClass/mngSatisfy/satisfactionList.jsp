<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, hagong.academy.mngClass.mngSatisfy.model.vo.*, hagong.academy.mngStudent.mngCouns.model.vo.*"%>
<%
	ArrayList<SatisfyInfo> list = (ArrayList<SatisfyInfo>) request.getAttribute("list");
	ArrayList<SatisfyInfo> blist = (ArrayList<SatisfyInfo>) request.getAttribute("blist");
	
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();		//총 게시글 갯수
	int currentPage = pi.getCurrentPage();	//현재 페이지
	int maxPage = pi.getMaxPage();			//마지막 게시글 페이지 번호 
	int startPage = pi.getStartPage();		//시작 페이지 번호
	int endPage = pi.getEndPage();			//끝 페이지 번호 
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
.srchArea{margin-bottom:10px; margin-right: 5%;}
.srchArea input{float:right;margin:0px 10px 7px 10px;height:19px;border-radius:5px;border:1px solid gray;}
.srchArea select{float:right;border-radius:5px;border:1px solid gray;}
.srchArea button{float:right; height:25px;}
.pagingArea {margin-bottom:30px;}
.pagingArea button{display:inline-block;font-family: "Nanum Gothic";}
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
		<form action="<%= request.getContextPath()%>/alist.info" method="post">
			<div class="srchArea">
				<%
					if (test == 1) {
				%>
				<button id="addSatisfaction">만족도 조사 등록</button>
				<button id="benefitBtn">혜택 관리</button>
				<%
					}
				%>
				<button class="srchBtn">검색</button>
				<input type="search" id="searchSatis" name="searchSatis">
				<select id="searchCondition" name="searchCondition" style="height: 23px;">
					<option value="" selected disabled hidden>검색 조건</option>
					<option value="className">수강명</option>
					<option value="status">진행상황</option>
				</select>
			</div>
		</form>
		<form>
			<table class="table" align="center" style="width: 90%;">
				<tr>
					<th>No.</th>
					<th>만족도 조사 제목</th>
					<th>만족도 조사 날짜</th>
					<th>진행상황</th>
					<% if(list.size() != 0){ %>
					<input type="hidden" id="today" name="today" value="<%=blist.get(0).getToday()%>">
					<% } %>
				</tr>
				<% for(SatisfyInfo si : list) {%>
				<tr>
					<td><input type="hidden" id="satNo" name="satNo" value="<%= si.getSatNo() %>"><%=si.getRowNum() %></td>
					<td><%=si.getSatTitle() %></td>
					<td><input type="hidden" id="start" name="start" value="<%=si.getStart()%>">
					<%=si.getStart() + " ~ " + si.getEnd()%><input type="hidden" id="end" name="end" value="<%=si.getEnd()%>">
					</td>
					<td>
					<% if(si.getStatus().equals("detail")) { %>
					진행 예정
					<% } else if(si.getStatus().equals("select")) {%>
					진행중
					<% } else { %>
					종료
					<% } %>
					</td>
				</tr>
				<% } %>
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
						<select id="benefitSelect" align="center"
							style="border: 1px solid lightgray; border-radius: 5px; height: 30px">
								<option selected disabled hidden>선택</option>
								<% for(int i = 0; i < blist.size(); i++) { %>
								<option value="<%=blist.get(i).getBenNo()%>">
								<%=blist.get(i).getBenCondition() + "" + blist.get(i).getBenType() + " " +
									(int) (Math.floor(blist.get(i).getBenRate() * 100)) + "%"%></option>
								<% } %>
						</select></td>
					</tr>
					<tr>
						<td width="100px">혜택구분</td>
						<td width="250px">
						<select id="benefitType">
							<option value="TUITION" selected>수강비</option>
						</select></td>
					</tr>
					<tr>
						<td>적용 시점</td>
						<td>
						<select id="applyPoint" class='sort' space="&nbsp;" align="center"
						style="border: 1px solid lightgray; border-radius: 5px; height: 30px">
							<option value="NEXTCLS" selected>다음 강의</option>
						</select>
						</td>
					</tr>
					<tr>
						<td>할인율</td>
						<td><input type="number" id="benefitRate" min="1" max="100" style="width: 50px;" required></td>
					</tr>
				</table>
				<table id="modalBtnTable">
					<tr>
						<td colspan="2">
							<button id="deleteBtn"
								style="margin-left: 20px; width: 100px; height: 30px;">삭제</button>
							<button type="button" id="updateBtn"
								style="width: 100px; height: 30px;">추가</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</section>
	<div class="pagingArea" align="center">
			<button onclick="location.href='<%= request.getContextPath()%>/alist.satis?currentPage=1<%-- &srchCnt=<%=srchCnt%>&searchCondition=<%=searchCondition%>' --%>"><<</button>
			<% if(currentPage <= 1) {%>
			<button disabled><</button>
			<%}else{ %>
			<button onclick="location.href='<%=request.getContextPath()%>/alist.satis?currentPage=<%=currentPage - 1%><%-- &srchCnt=<%=srchCnt%>&searchCondition=<%=searchCondition%>' --%>"><</button>
			<% }%>
			
			<% for(int p = startPage; p <= endPage; p++){ 
				if(p == currentPage){
			%>
				<button disabled><%= p %></button>			
			<% }else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/alist.satis?currentPage=<%=p%><%-- &srchCnt=<%=srchCnt%>&searchCondition=<%=searchCondition%>' --%>"><%=p %></button>
			<% } 
			}
			%>
			
			<% if(currentPage >= maxPage){ %>
			<button disabled>></button>
			<%} else{ %>
			<button onclick="location.href='<%=request.getContextPath()%>/alist.satis?currentPage=<%=currentPage + 1%><%-- &srchCnt=<%=srchCnt%>&searchCondition=<%=searchCondition%>' --%>">></button>
			<% } %>
			
			<button onclick="location.href='<%= request.getContextPath()%>/alist.satis?currentPage=<%=maxPage%><%-- &srchCnt=<%=srchCnt%>&searchCondition=<%=searchCondition%>' --%>">>></button>
	</div> <!-- pagingArea end  -->
	<footer> </footer>
	<script>
		//만족도 등록
		$("#addSatisfaction").click(function(){
			location.href="<%=request.getContextPath()%>/ainsert.satis?type=insertForm";
		});
		
		//만족도 상세보기
		$(".table td").click(function() {
			var satNo = $(this).parent().children().find("#satNo").val();
			var start = $(this).parent().children().find("#start").val();
			var end = $(this).parent().children().find("#end").val();
			var today = $("#today").val();
			var type = "";
			
			if(today < start) {
				type = "detail";
			} else if(today < end) {
				type = "select";
			}
			if(today > end) {
				type = "result";
			}
			
			console.log(start);
			console.log(end);
			console.log(today);
			console.log(type);
			
			location.href = '<%=request.getContextPath()%>/adetail.satis?satNo=' + satNo + '&type=' + type;
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

		//혜택 추가
		updateBtn.onclick = function(i) {
			var benefitType = $("#benefitType").val();
			var benefitRate = $("#benefitRate").val();
			var applyPoint = $("#applyPoint").val();
			
			if(benefitRate > 100) {
				alert("할인율은 1 ~ 100사이로 입력해주세요");
				return false;
			} else {
				console.log(benefitType);
				console.log(benefitRate);
				console.log(applyPoint);
				
				$.ajax({
					url : "ainsert.ben",
					type : "post",
					data : {
						benefitType : benefitType,
						benefitRate : benefitRate,
						applyPoint : applyPoint
					},
					success:function(data){
						console.log(data);
						$("#benefitRate").val('');
						$("#benefitSelect").find("option").remove();
						$("#benefitSelect").append("<option>선택</option>");
						for(var key in data){
							var $select = $("#benefitSelect");
							var $option = $("<option>");
							$option.attr("value", data[key].benNo);
							$option.text(data[key].benCondition + "" + data[key].benType + " " + (Math.floor(data[key].benRate * 100)) + "%");
							$select.append($option);
						}
					},
					error:function(data){
						console.log("실패");
					}
				});
			}
		};

		//혜택 삭제
		deleteBtn.onclick = function() {
			var benNo = $("#benefitSelect").val();
			
			$.ajax({
				url : "adelete.ben",
				type : "post",
				data : {benNo : benNo},
				success:function(data){
					console.log(data);

					$("#benefitSelect").find("option").remove();
					$("#benefitSelect").append("<option>선택</option>");
					for(var key in data){
						var $select = $("#benefitSelect");
						var $option = $("<option>");
						$option.attr("value", data[key].benNo);
						$option.text(data[key].benCondition + "" + data[key].benType + " " + (Math.floor(data[key].benRate * 100)) + "%");
						$select.append($option);
					}
				},
				error:function(data){
					console.log("실패");
				}
			});
		};
	</script>
</body>
</html>