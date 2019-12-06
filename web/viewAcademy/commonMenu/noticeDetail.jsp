<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/viewAcademy/common/menubar.jsp"%>
<style>
	.returnUpdate > button{
		display:inline;
	}
	#return{
		margin-right:10px;
		margin-bottom:30px;
	}
</style>
</head>
<body>
	<div class="outer">
		<br>
		<h2 align="center">공지사항 내용</h2>
		<div class="tableArea">
			<table class="table">
				<tr>
					<td>제목</td>
					<td colspan="3">
						<input type="text" size="50" name="title" <%-- value="<%= n.getnTitle() %>" --%> readonly>
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>
						<input type="text" <%-- value="<%=n.getnWriter() %>" --%> name="writer" readonly>
					</td>
					<td>작성일</td>
					<td>
						<input type="date" name="date" <%-- value="<%= n.getnDate() %>" --%> readonly>
					</td>
				</tr>
				<tr>
					<td>내용</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea name="content" cols="60" rows="15" style="resize:none;" readonly>공지사항 내용<%-- <%= n.getnContent() %> --%></textarea>
					</td>
				</tr>
			</table>
			<br>
			<div class="returnUpdate" align="center">
				<button id="return" onclick="location.href='<%=request.getContextPath()%>/viewAcademy/commonMenu/noticeList.jsp'">목록으로 돌아가기</button>
				<%-- <% if(loginUser != null && loginUser.getUserId().equals("admin")){ %> --%>
				<button onclick="location.href='<%=request.getContextPath()%>/viewAcademy/commonMenu/noticeUpdate.jsp'">수정하기</button>
				<%-- <% } %> --%>
			</div>
		</div> <!-- tableArea end -->
	</div> <!-- outer end -->
</body>
</html>