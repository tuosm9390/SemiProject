<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, hagong.academy.mngClass.mngCS.model.vo.*,hagong.academy.mngStudent.mngCouns.model.vo.*"%>
<% 
	ArrayList<CS> cslist = (ArrayList<CS>) request.getAttribute("cslist"); 
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
	.pagingArea {margin-bottom:30px;}
	.pagingArea button{display:inline-block;font-family: "Nanum Gothic";}
</style>
	</head>
	<body>
		<header>
			<%@ include file="/viewAcademy/common/menubar.jsp" %>
		</header>
		<section>
			<div class="container" id="classStudent">
			<!-- Top Navigation -->

			<div class="component" style="padding-top:1%;">
				<div align="center">
	      			<fieldset style="margin-bottom:-15px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;width:20%;">
	         			<legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">　강좌 목록　</h1></legend>
	      			</fieldset>
	      		</div>
				<div class="srchArea">
					<button class="srchBtn">검색</button>
					<input type="search" id="searchStudent" name="searchStudent">
					<select style="float:right">
						<option value="" selected disabled hidden>검색 조건</option>
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
					<% for(int i = 0; i < cslist.size(); i++) { %>
						<tr>
							<td class=""><%= cslist.get(i).getRnum() %><input type="hidden" value="<%= cslist.get(i).getClsNo()%>"></td>
							<td class=""><%= cslist.get(i).getClsName() %></td>
							<td><%= cslist.get(i).getName() %></td>
							<td class=""><%= cslist.get(i).getClsStart() %> ~ <%= cslist.get(i).getClsEnd() %></td>
							<td class=""><%= cslist.get(i).getClassName() %></td>
						</tr>
					<%} %>
					</tbody>
				</table>
			</div>
		</div>
		</section>
		<div class="pagingArea" align="center">
			<button onclick="location.href='<%= request.getContextPath()%>/alist.black?currentPage=1&srchCnt=<%=srchCnt%>&searchCondition=<%=searchCondition%>'"><<</button>
			<% if(currentPage <= 1) {%>
			<button disabled><</button>
			<%}else{ %>
			<button onclick="location.href='<%=request.getContextPath()%>/alist.black?currentPage=<%=currentPage - 1%>&srchCnt=<%=srchCnt%>&searchCondition=<%=searchCondition%>'"><</button>
			<% }%>
			
			<% for(int p = startPage; p <= endPage; p++){ 
				if(p == currentPage){
			%>
				<button disabled><%= p %></button>			
			<% }else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/alist.black?currentPage=<%=p%>&srchCnt=<%=srchCnt%>&searchCondition=<%=searchCondition%>'"><%=p %></button>
			<% } 
			}
			%>
			
			<% if(currentPage >= maxPage){ %>
			<button disabled>></button>
			<%} else{ %>
			<button onclick="location.href='<%=request.getContextPath()%>/alist.black?currentPage=<%=currentPage + 1%>&srchCnt=<%=srchCnt%>&searchCondition=<%=searchCondition%>'">></button>
			<% } %>
			
			<button onclick="location.href='<%= request.getContextPath()%>/alist.black?currentPage=<%=maxPage%>&srchCnt=<%=srchCnt%>&searchCondition=<%=searchCondition%>'">>></button>
		</div> <!-- pagingArea end  -->
					
	
		<!-- /container -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script>
		<!-- <script src="js/jquery.stickyheader.js"></script> -->
		<script>
			$(function(){
				$("#classlist tr").click(function(){
					var clsNo = $(this).children().eq(0).children().eq(0).val();
					console.log(clsNo);
					location.href = "<%= request.getContextPath()%>/adetail.cs?clsNo=" + clsNo;
				});
			})
		</script>
	</body>
</html>