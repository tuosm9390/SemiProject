<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, hagong.academy.mngStudent.mngInfo.model.vo.*, hagong.academy.mngStudent.mngCouns.model.vo.*"%>
<%
	ArrayList<Student> list = (ArrayList<Student>) request.getAttribute("list");

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
<style>
section button {
	float: right;
	padding-top: 0;
	padding-bottom: 0;
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

input[type='file'] {
	display: none;
}

table {
	border-collapse: collapse;
	width: 100%;
}

tr, th {
	height: 40px;
}
tr:not(:first-child){
	cursor: pointer;
}
.srchArea{margin-bottom:10px; margin-right: 5%;}
.srchArea input{float:right;margin:0px 10px 7px 10px;height:19px;border-radius:5px;border:1px solid gray;}
.srchArea select{float:right;border-radius:5px;border:1px solid gray;}
.srchArea button{float:right;height:25px;}
.pagingArea {margin-bottom:30px;}
.pagingArea button{display:inline-block;}
.pagingBtn{border:none;}
.pagingBtn.pBtn{border:none;border-bottom: 1px solid;border-radius: 0px;}
.pagingBtn:hover{color:#333; background:white;border:none;}
</style>
</head>
<body>
	<header>
		<%@ include file="../../common/menubar.jsp"%>
	</header>
	<section>
	<div align="center">
		<fieldset style="margin-bottom: -25px; border-bottom: none; border-left: none; border-right: none; border-top-color: black;
						width: 18%; font-family:'Do Hyeon'">
			<legend align="center"><h1>　전체 학생　</h1></legend>
		</fieldset>
		<div class="srchArea">
		<button id="addstudent">학생 등록</button>
			<form action="<%= request.getContextPath()%>/alist.info" method="post">
				<button class="srchBtn">검색</button>
				<input type="search" id="searchStudent" name="searchStudent">
				<select id="searchCondition" name="searchCondition">
					<option value="" selected disabled hidden>검색 조건</option>
					<option value="name">학생명</option>
					<option value="phone">전화번호</option>
					<option value="school">학교</option>
					<option value="grade">학년</option>
					<option value="userId">ID</option>
				</select>
			</form>
		</div>
	</div>
	<div style="width: 90%; margin: auto auto;">
		<table class="table">
			<tr>
				<th>ID</th>
				<th>학생 이름</th>
				<th>나이</th>
				<th>전화번호</th>
				<th>학교</th>
				<th>학부모 전화번호</th>
				<th>희망학과</th>
			</tr>
			<%
				for (Student s : list) {
			%>
			<tr>
				<td><%=s.getUserId()%><input type="hidden" value="<%= s.getRnum()%>"></td>
				<td><%=s.getName() %></td>
				<td><%=s.getAge() %></td>
				<td><%=s.getPhone() %></td>
				<td><%=s.getSchool() %></td>
				<td><%=s.getRefPhone() %></td>
				<td><%=s.getMajor() %></td>
			</tr>
			<% } %>
		</table>
	</div>
	</section>
	<div class="pagingArea" align="center">
			<button class="pagingBtn" onclick="location.href='<%= request.getContextPath()%>/alist.info?currentPage=1&srchCnt=<%=srchCnt%>&searchCondition=<%=searchCondition%>'">◀◀</button>
			<% if(currentPage <= 1) {%>
			<button class="pagingBtn" disabled>◀</button>
			<%}else{ %>
			<button class="pagingBtn" onclick="location.href='<%=request.getContextPath()%>/alist.info?currentPage=<%=currentPage - 1%>&srchCnt=<%=srchCnt%>&searchCondition=<%=searchCondition%>'">◀</button>
			<% }%>
			
			<% for(int p = startPage; p <= endPage; p++){ 
				if(p == currentPage){
			%>
				<button class="pagingBtn pBtn" disabled><%= p %></button>			
			<% }else{ %>
				<button class="pagingBtn pBtn" onclick="location.href='<%=request.getContextPath()%>/alist.info?currentPage=<%=p%>&srchCnt=<%=srchCnt%>&searchCondition=<%=searchCondition%>'"><%=p %></button>
			<% } 
			}
			%>
			
			<% if(currentPage >= maxPage){ %>
			<button class="pagingBtn" disabled>▶</button>
			<%} else{ %>
			<button class="pagingBtn" onclick="location.href='<%=request.getContextPath()%>/alist.info?currentPage=<%=currentPage + 1%>&srchCnt=<%=srchCnt%>&searchCondition=<%=searchCondition%>'">▶</button>
			<% } %>
			
			<button class="pagingBtn" onclick="location.href='<%= request.getContextPath()%>/alist.info?currentPage=<%=maxPage%>&srchCnt=<%=srchCnt%>&searchCondition=<%=searchCondition%>'">▶▶</button>
		</div> <!-- pagingArea end  -->
	<script>
		console.log("<%= loginUser.getLevel()%>");
		
		$("#addstudent").click(function(){
			location.href="<%=request.getContextPath()%>/viewAcademy/mngStudent/mngInfo/enrollStudent.jsp";
		});
		
		$("#addexcel").click(function() {
			$("#exelfile").click();
		});

		$(".table td").click(function() {
			var userId = $(this).parent().children().eq(0).text();
			location.href="<%=request.getContextPath()%>/adetail.info?userId=" + userId;
		});
	</script>
</body>
</html>