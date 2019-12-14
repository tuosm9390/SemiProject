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
.srchArea input{float:right;margin:0px 10px 7px 10px;height:19px;border-radius:5px;border:1px solid gray;}
.srchArea select{float:right;border-radius:5px;border:1px solid gray;}
.srchArea button{float:right;width:60px; height:25px;}
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
					<button class="srchBtn">검색</button>
					<input type="search" id="searchStudent" name="searchStudent">
					<select>
						<option value="" selected disabled hidden>검색 조건</option>
						<option value="name">학생명</option>
						<option value="phone">전화번호</option>
						<option value="school">학교</option>
						<option value="grade">학년</option>
					</select>
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

</body>
</html>