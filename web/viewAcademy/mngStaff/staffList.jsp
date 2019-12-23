<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, hagong.academy.mngStaff.model.vo.*"%>
<% ArrayList<Staff> staffList = (ArrayList<Staff>) request.getAttribute("staffList"); 
   String how = (String) request.getAttribute("selectedFilter");
   PageInfo pageinfo = (PageInfo) request.getAttribute("pageInfo");
   int listCnt = pageinfo.getListCnt();
   int curPage = pageinfo.getCurPage();
   int maxPage = pageinfo.getMaxPage();
   int startPage = pageinfo.getStartPage();
   int endPage = pageinfo.getEndPage();
%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
.listArea {
	width: 90%;
	margin-left: auto;
	margin-right: auto;
	height:490px;
}
.btnArea {
	margin-left: 5%;
	margin-bottom: 5px;
}

.enrollStaff {
	font-size: 18px;
	margin-left: 1%;
	font-family: "Nanum Gothic";
	font-weight: bold;
	border: 2px solid green;
	display: inline;
}

.enrollStaff:hover {
	cursor: pointer;
	background: green;
	border: 2px solid green;
	color: white;
	display: inline;
}

.staffList {
	width: 90%;
}

.btn {
	display: inline;
}

input[type=file] {
	display: none;
}

fieldset {
	width:17%;
}

.pagingArea button {
	border:none !important;
	display: inline;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../common/menubar.jsp"%>
	</header>
	<section>
	<%  int viewListLevel = 0;
		int viewDetailLevel = 0;
		int modiLevel = 0;
		for(int i = 0; i < menuLevelList.size(); i++) {
			if(menuLevelList.get(i).getMmid().equals("STAFF1")) {
				viewListLevel = menuLevelList.get(i).getMlevel();
			} else if(menuLevelList.get(i).getMmid().equals("STAFF2")) {
				viewDetailLevel = menuLevelList.get(i).getMlevel();
			} else if(menuLevelList.get(i).getMmid().equals("STAFF3")) {
				modiLevel = menuLevelList.get(i).getMlevel();
			}
		}
	%>
	
	<% if(loginUser != null && loginUser.getLevel() <= viewListLevel) { %>
		<div align="center">
      		<fieldset style="margin-bottom:-30px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;">
         		<legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">　전체 직원　</h1></legend>
      		</fieldset>
      	</div>
		<div class="btnArea">
			<select id="staffFilter" class="btn" style="border-radius:5px;">
				<option value="uName" selected>이름순</option>
				<option value="uId">ID순</option>
				<option value="subject">담당과목순</option>
				<option value="inDay">최근입사순</option>
			</select>
			<button class="btn enrollStaff" id="enrollPage" style="margin-left:80%;">직원 등록</button>
		</div>
		<!-- btnArea end -->
		<div class="listArea">
			<table class="staffList table" align="center">
				<tr>
					<th>ID</th>
					<th>이름</th>
					<th>연령</th>
					<th>전화번호</th>
					<th>담당과목</th>
				</tr>
				<%
					for (Staff staff : staffList) {
				%>
				<tr>
					<input id="num" type="hidden" value="<%= staff.getUserNo() %>">
					<td><%= staff.getUserId() %></td>
					<td><%= staff.getName() %></td>
					<td><%= staff.getAge() %></td>
					<td><%= staff.getPhone() %></td>
					<td><%= staff.getDept() %></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
		<!-- listArea end -->
		
		<div class="pagingArea" align="center">
			<button onclick="location.href='<%= request.getContextPath() %>/alist.staff?how=<%= how %>&page=<%= startPage %>'">◀◀</button>
			
			<% if(curPage <= 1) { %>
				<button disabled>◀</button>
			<% } else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/alist.staff?how=<%= how %>&page=<%= curPage - 1 %>'">◀</button>
			<% } %>
			
			<% for(int p = startPage; p <= endPage; p++) {
				if(p == curPage) { %>
				<button disabled style="text-decoration:underline"><%= p %></button>
			<%  } else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/alist.staff?how=<%= how %>&page=<%= p %>'"><%= p %></button>
			<%  }
			   } %>
			   
			<% if(curPage >= maxPage) { %>
				<button disabled>▶</button>
			<% } else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/alist.staff?how=<%= how %>&page=<%= curPage + 1 %>'">▶</button>
			<% } %>
			
			<button onclick="location.href='<%= request.getContextPath() %>/alist.staff?how=<%= how %>&page=<%= maxPage %>'">▶▶</button>
		</div> <!-- pagingArea end -->
		
		<script>
		$(function(){
			$("#staffFilter option").each(function(){
				if($(this).val() == "<%= how %>") {
					$("#staffFilter option[value='uName']").prop("selected", false);
					$(this).prop("selected", true);
				}
			});
			
			$("#enrollPage").click(function(){
				location.href = "<%= request.getContextPath() %>/viewAcademy/mngStaff/enrollStaff.jsp";
			});
			
			$("#enrollExcel").click(function(){
				$("#btnExcel").click();
			});
			
			$(".listArea td").mouseenter(function(){
				$(this).parent().css({"cursor":"pointer"});
				}).click(function(){
					var userNo = $(this).parent().children("input").val();
					location.href = "<%=request.getContextPath()%>/adetail.staff?type=view&no=" + userNo;
				});
			});
		
		$("#staffFilter").change(function(){
			var how = $(this).val();
			location.href="<%= request.getContextPath() %>/alist.staff?how=" + how + "&page=1";
		});
		</script>
		<% } else { 
		request.setAttribute("errorCode", "NotFoundError");
		request.getRequestDispatcher("/viewAcademy/common/commonError.jsp").forward(request, response);
	   } %>
	</section>
	<footer> </footer>
</body>
</html>