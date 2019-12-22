<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="hagong.academy.mngStudent.mngCouns.model.vo.*, java.util.*"%>
<% 
	ArrayList<MemberCouns> allCounsList = (ArrayList<MemberCouns>) request.getAttribute("allCounsList"); 
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();		//총 게시글 갯수
	int currentPage = pi.getCurrentPage();	//현재 페이지
	int maxPage = pi.getMaxPage();			//마지막 게시글 페이지 번호 
	int startPage = pi.getStartPage();		//시작 페이지 번호
	int endPage = pi.getEndPage();			//끝 페이지 번호 
	String srchCnt = (String) request.getAttribute("srchCnt");
	String searchCondition = (String) request.getAttribute("searchCondition");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
</head>
<style>

input, select, textarea {
	border-radius:5px;
	border:1px solid lightgray;
}
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
	margin: 3% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 50%;
	background-color: #fefefe;
	border-radius: 5px;
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
.dArea .dCtn .consCate{padding: 3px;width: 162px;}
.dArea .dTit{display: block;padding-bottom: 5px;font-weight: bold;font-size: 15px;}
.dArea textarea.inputCons{width: 100%;min-height: 100px;}
.btnArea{padding: 10px 40px 40px 40px;}
.srchArea{margin-bottom:10px;}
.srchArea select{float:right;border-radius:5px;border:1px solid gray;}
.srchArea input{float:right;margin:0px 10px 7px 10px;height:19px;border-radius:5px;border:1px solid gray;}
.srchArea button{float:right;width:60px; height:25px;}
.names{display:flex;}
.names input{margin-right:13px;}
.names select{margin-right:13px;}
.dArea.dArea2{display:flex;}
.dArea.dArea2 .dCtn.consDate{margin-right:160px;}
.pagingArea {margin-bottom:30px;}
.pagingArea button{display:inline-block;}
#consilArea{
    line-height: 1.5em;
    margin: 0 auto;
    padding: 2em 0 0 0;
    width: 90%;
    max-width: 1600px;
    overflow: hidden;
}
.pagingBtn{border:none;}
.pagingBtn.pBtn{border:none;border-bottom: 1px solid;border-radius: 0px;}
.pagingBtn:hover{color:#333; background:white;border:none;}
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
				<form action="<%= request.getContextPath()%>/alist.couns" method="post">
					<div class="srchArea">
						<button type="submit" class="srchBtn">검색</button>
						<input type="search" id="search" name="srchCnt" autocomplete="off">
						<select style="float:right" id="searchCondition" name="searchCondition">
							<option selected disabled hidden>검색 조건</option>
							<option value="name">학생명</option>
							<option value="userId">ID</option>
						</select>
					</div>
				</form>
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
					<% for(int i = 0; i < allCounsList.size(); i++) { %>
						<tr id="tr<%= i %>">
							<td class="user-name"><%= allCounsList.get(i).getUserName() %>
							<input id="u<%= i %>" type="hidden" value="<%=allCounsList.get(i).getUserNo() %>"></td>
							<td><%= allCounsList.get(i).getUserId() %></td>
							<td class="cons-count"><%= allCounsList.get(i).getCount() %>회</td>
						<% if(allCounsList.get(i).getCouDate() != null) {%>
							<td class="last-cons"><%= allCounsList.get(i).getCouDate() %></td>
						<% } else { %>
							<td class="last-cons"> - </td>
						<% } %>
							<td class="cons-list"><button onclick="conslist(<%= i %>);">상담일지</button></td>
							<td><button onclick="addCouns(<%= i %>);">상담추가</button></td>
						</tr>
					<% }%>					
					</tbody>
				</table>
			</div>
		</div>
		<div class="pagingArea" align="center">
			<button class="pagingBtn" onclick="location.href='<%= request.getContextPath()%>/alist.couns?currentPage=1&srchCnt=<%=srchCnt%>&searchCondition=<%=searchCondition%>'">◀◀</button>
			<% if(currentPage <= 1) {%>
			<button class="pagingBtn" disabled>◀</button>
			<%}else{ %>
			<button class="pagingBtn" onclick="location.href='<%=request.getContextPath()%>/alist.couns?currentPage=<%=currentPage - 1%>&srchCnt=<%=srchCnt%>&searchCondition=<%=searchCondition%>'">◀</button>
			<% }%>
			
			<% for(int p = startPage; p <= endPage; p++){ 
				if(p == currentPage){
			%>
				<button class="pagingBtn pBtn" disabled><%= p %></button>			
			<% }else{ %>
				<button class="pagingBtn pBtn" onclick="location.href='<%=request.getContextPath()%>/alist.couns?currentPage=<%=p%>&srchCnt=<%=srchCnt%>&searchCondition=<%=searchCondition%>'"><%=p %></button>
			<% } 
			}
			%>
			
			<% if(currentPage >= maxPage){ %>
			<button class="pagingBtn" disabled>▶</button>
			<%} else{ %>
			<button class="pagingBtn" onclick="location.href='<%=request.getContextPath()%>/alist.couns?currentPage=<%=currentPage + 1%>&srchCnt=<%=srchCnt%>&searchCondition=<%=searchCondition%>'">▶</button>
			<% } %>
			
			<button class="pagingBtn" onclick="location.href='<%= request.getContextPath()%>/alist.couns?currentPage=<%=maxPage%>&srchCnt=<%=srchCnt%>&searchCondition=<%=searchCondition%>'">▶▶</button>
		</div> <!-- pagingArea end  -->
	</section>

		<!-- 모달기능 -->
		<section align="center">

		<!-- 항목 추가 -->
		<div id="addlist" class="modal">
			<div class="modal-content" align="center">
				<span class="close">&times;</span>
				<h2 align="center" style="font-style:italic">◎ 상담내용 추가 ◎</h2>
					<form class="accordion__content" method="post" action="<%= request.getContextPath()%>/insert.couns">
						<div class="detailArea" align="left">
							<div class="dArea dArea1">
								<div class="dCtn consTitle">
									<label class="dTit">상담제목</label>
									<input name="cTitle" type="text" class="inputCons" value="" placeholder="상담제목입력" autocomplete="off">
								</div>
							<div class="names">
								<div class="dCtn consDate"> 
									<label class="dTit">상담일자</label>
									<input type="text" class="inputCons" id="from" name="from" value="" placeholder="상담일자입력" autocomplete="off">
								</div>
								<div class="dCtn category">
									<label class="dTit">상담종류</label>
									<select name="consCategory" class="consCate">
										<option value="SCORE">성적</option>
										<option value="LIFE">학원생활</option>
										<option value="PARENT">학부모</option>
										<option value="APPLY">진학</option>
										<option value="ETC">기타</option>
									</select>
								</div>
								<div class="dCtn tName">
									<label class="dTit">상담자 이름</label>
									<input name="counsName" type="text" class="inputCons" value="<%= loginUser.getName() %>" readonly>
								</div>
								<div class="dCtn sName">
									<label class="dTit">상담학생명</label>
									<input name="name" id="cName" type="text" class="inputCons" value="" readonly>
								</div>

							</div>
							</div>
							<div class="dArea dArea2">
								
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
								<div class="dCtn isBlack">
									<label for="isblack">블랙리스트</label>
									<input type="checkBox" name="isblack" value="Y">
								</div>
							</div>
						</div>
						<div class="btnArea">
							<button class="cancelbtn" type="button" 
								style="width: 100px; height: 30px;">취소</button>&nbsp;&nbsp;
							<button class="okbtn"
								style="width: 100px; height: 30px;">확인</button>
						</div>
						<input type="hidden" value="<%= loginUser.getUserNo() %>" name="counsUserNo">
						<input type="hidden" value="" name="userNo" id="userNo">
					</form>
				</div>
			</div>
		</section>
	<footer> </footer>
	<!-- 스크립트 -->
			<script>
				function conslist(i){
					var userNo = $("#u" + i).val();
					location.href = "<%=request.getContextPath()%>/detail.couns?userNo=" + userNo;					
				};
				function addCouns(i) {
					console.log(i);
					var name = $("#tr" + i).children().eq(0).text();
					var userNo = $("#u" + i).val();
					$("#userNo").val(userNo);
					$("#cName").val(name);
					console.log($("#tr" + i).children().eq(0).text());
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