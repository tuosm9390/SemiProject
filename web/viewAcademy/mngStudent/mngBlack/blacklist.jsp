<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, hagong.academy.mngStudent.mngBlack.model.vo.*, hagong.academy.mngStudent.mngCouns.model.vo.*"%>
<%
	ArrayList<BlacklistInfo> blacklist = (ArrayList<BlacklistInfo>) request.getAttribute("blacklist"); 
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();		//총 게시글 갯수
	int currentPage = pi.getCurrentPage();	//현재 페이지
	int maxPage = pi.getMaxPage();			//마지막 게시글 페이지 번호 
	int startPage = pi.getStartPage();		//시작 페이지 번호
	int endPage = pi.getEndPage();			//끝 페이지 번호 
	
	//String srchCnt = (String) request.getAttribute("srchCnt");
	//String searchCondition = (String) request.getAttribute("searchCondition");
	String srchCnt = "a";
	String searchCondition = "b";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
<style>
	.component .addBtn{diaplay:inline-block; margin-bottom:5px; float:right;}
	.component .addBtn .addBlist{width:60px;font-size:16px;height:25px;}
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
input, select, textarea {
	border-radius:5px;
	border:1px solid lightgray;
}
/* 모달 내부 상자 */
.modal-content {
	background-color: #fefefe;
	margin: 3% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 50%;
	background-color: #fefefe;
	border-radius:5px;
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
.dArea .dTit{display: block;padding-bottom: 5px;font-weight:bold;font-size: 15px;}
.dArea textarea.inputCons{width: 100%;min-height: 100px;}
.btnArea{padding: 10px 40px 40px 40px;}
.srchArea{margin-bottom:10px;}
.srchArea input{float:left;margin:0px 10px 7px 10px;height:19px;border-radius:5px;border:1px solid gray;}
.srchArea select{float:left;border-radius:5px;border:1px solid gray;}
.srchArea button{float:left;width:60px; height:25px;margin-right:10px;}
.names{display:flex;}
.names input{margin-right:13px;}
.names select{margin-right:13px;}
.dArea.dArea2{display:flex;}
.dArea.dArea2 .dCtn.consDate{margin-right:160px;}
.pagingArea {margin-bottom:30px;}
.pagingArea button{display:inline-block;font-family: "Nanum Gothic";}
</style>
</head>
<body>
	<header>
		<%@ include file="../../common/menubar.jsp" %>
	</header>
	<section>
			<div class="container">
		<!-- Top Navigation -->
			<div class="component" id="consilArea">
				<div align="center">
					<fieldset style="margin-top:-25px; margin-bottom:-15px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;width:20%;">
				    	<legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">　블랙리스트　</h1></legend>
				    </fieldset>
			    </div>
				<div class="srchArea">
					<select>
						<option value="" selected disabled hidden>검색 조건</option>
						<option value="name">학생명</option>
						<option value="phone">전화번호</option>
						<option value="school">학교</option>
						<option value="grade">학년</option>
					</select>
					<input type="search" id="searchStudent" name="searchStudent">
					<button class="srchBtn">검색</button>
				</div>
				<table id="classlist" class="table">
					<thead>
						<tr>
							<th>원생명</th>
							<th>ID</th>
							<th>학교</th>
							<th>학년</th>
							<th>휴대폰번호</th>
						</tr>
					</thead>
					<tbody id="consList">
					<% for(int i = 0; i < blacklist.size(); i++) { %>
						<tr>
							<td class="user-name"><%= blacklist.get(i).getName() %></td>
							<td><%= blacklist.get(i).getUserId() %></td>
							<td class="last-cons"><%= blacklist.get(i).getSchool() %></td>
							<td class="cons-list"><%= blacklist.get(i).getGradeName() %></td>
							<td><%= blacklist.get(i).getPhone() %></td>
							<input type="hidden" value="<%= blacklist.get(i).getUserNo()%>">
						</tr>
					<% } %>
					</tbody>
				</table>
			</div>
			<script>
				$(function(){
					$("#consList tr").click(function(){
						var num = $(this).children("input").val();
						
						location.href="<%=request.getContextPath()%>/detail.black?num=" + num;
						
					});
				})
			</script>
		</div>
	</section>

			<div class="pagingArea" align="center">
			<button onclick="location.href='<%= request.getContextPath()%>/alist.black?currentPage=1'"><<</button>
			<% if(currentPage <= 1) {%>
			<button disabled><</button>
			<%}else{ %>
			<button onclick="location.href='<%=request.getContextPath()%>/alist.black?currentPage=<%=currentPage - 1%>'"><</button>
			<% }%>
			
			<% for(int p = startPage; p <= endPage; p++){ 
				if(p == currentPage){
			%>
				<button disabled><%= p %></button>			
			<% }else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/alist.black?currentPage=<%=p%>'"><%=p %></button>
			<% } 
			}
			%>
			
			<% if(currentPage >= maxPage){ %>
			<button disabled>></button>
			<%} else{ %>
			<button onclick="location.href='<%=request.getContextPath()%>/alist.black?currentPage=<%=currentPage + 1%>'">></button>
			<% } %>
			
			<button onclick="location.href='<%= request.getContextPath()%>/alist.black?currentPage=<%=maxPage%>'">>></button>
		</div> <!-- pagingArea end  -->

		<!-- /container --><!-- 
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script> -->
		<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script> -->
		<!-- <script src="js/jquery.stickyheader.js"></script> -->
				<!-- 모달기능 -->
		<section align="center">
		<!-- 항목 추가 -->
		<div id="addlist" class="modal">
			<div class="modal-content" align="center">
				<span class="close">&times;</span>
				<h2 align="center" style="font-style:italic">◎ 블랙리스트 추가 ◎</h2>
					<form class="accordion__content" method="post" action="<%= request.getContextPath()%>/insert.black">
						<div class="detailArea" align="left">
							<div class="dArea dArea1">
								<div class="dCtn consTitle">
									<label class="dTit">상담제목</label>
									<input type="text" class="inputCons" value="" placeholder="제목입력">
								</div>
								<div class="names">
								<div class="dCtn consDate"> 
									<label class="dTit">상담일자</label>
									<input type="text" class="inputCons" id="from" name="from" value="" readonly placeholder="날짜입력">
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
									<div class="dCtn tName">
										<label class="dTit">상담자 이름</label>
										<input type="text" class="inputCons" value="<%= loginUser.getName() %>" readonly >
									</div>
									<div class="dCtn sName">
										<label class="dTit">상담학생명</label>
										<input type="text" class="inputCons" value="" readonly placeholder="이름입력">
									</div>
								</div>
							</div>
							<div class="dArea dArea2">

							</div>
							<div class="dArea dArea3">
								<div class="dCtn tPhone">
									<label class="dTit">학생 휴대폰 번호</label>
									<input type="text" class="inputCons" value="" placeholder="폰번호입력">
								</div>
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
								style="width: 100px; height: 30px;">취소</button>&nbsp;&nbsp;
							<button class="okbtn" type="submit"
								style="width: 100px; height: 30px;">확인</button>
						</div>
					</form>
				</div>
			</div>
		</section>
			<!-- 스크립트 -->
			<script>
				function conslist(){
					location.href = "<%=request.getContextPath()%>/viewAcademy/mngStudent/mngCouns/studentConsDetail.jsp";					
				};
				function addBlist() {
					$("#addlist").css("display","block");
				};
				
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