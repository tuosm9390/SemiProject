<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, hagong.academy.commonMenu.notice.model.vo.*"%>
<%
	Notice n = (Notice)request.getAttribute("n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
<style>
	.returnUpdate > button{
		display:inline;
	}
	#return{
		margin-right:10px;
		margin-bottom:30px;
	}
	fieldset {
      width:25%
   }
</style>
</head>
<body>
	<header>
      <%@ include file="/viewAcademy/common/menubar.jsp"%>
   </header>
   <section>
   <div align="center">
      <fieldset style=" margin-bottom:-15px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;">
         <legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">　공지사항 내용　</h1></legend>
      </fieldset>
    </div>
	<div style="width:90%; margin:auto auto;" class="outer" >
		<div class="tableArea" align="center">
			<table>
				<tr>
					<td>제목</td>
					<td style="padding-bottom:1%" colspan="3">
						<input type="label" size="50" name="title" style="border-radius:5px; border:none;" value="<%= n.getnTitle() %>" readonly>
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>
						<input type="label" name="writer" style="border-radius:5px; border:none;" value="<%=n.getnAuthor() %>" readonly>
					</td>
					<td>작성일</td>
					<td>
						<input type="text" name="date" style="border-radius:5px; border:none;" value="<%= n.getnDate() %>" readonly>
					</td>
				</tr>
				<tr>
					<td>내용</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea name="content" cols="60" rows="15" style="resize:none; border-radius:5px; border:1px solid lightgray;" readonly><%= n.getnContent() %></textarea>
					</td>
				</tr>
			</table>
			<br>
			<div class="returnUpdate" align="center">
				<button id="return" onclick="location.href='<%=request.getContextPath()%>/alist.no?crrentPage=1'" style="margin-right:5px;">목록</button>
				<%-- <% if(loginUser != null && loginUser.getUserId().equals("admin")){ %> --%>
				<button onclick="location.href='<%=request.getContextPath()%>/aselect.no?num=<%=n.getNno()%>'">수정</button>
				<%-- <% } %> --%>
			</div>
		</div> <!-- tableArea end -->
	</div> <!-- outer end -->
	</section>
	<footer>
	</footer>
</body>
</html>

