<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/viewAcademy/common/menubar.jsp"%>
<style>
	#write{
		margin-left:90%;
	}
	.searchArea > button{
		margin-left:5%;
		display:inline;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<h1>공지사항 게시판</h1>
	<div>
		<table class="table" id="noticeList">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
			<tr>
				<td>1</td>
				<td>공지1</td>
				<td>재영</td>
				<td>2019-12-03</td>
				<td>23</td>
			</tr>
			<tr>
				<td>1</td>
				<td>공지1</td>
				<td>재영</td>
				<td>2019-12-03</td>
				<td>23</td>
			</tr>
			<tr>
				<td>1</td>
				<td>공지1</td>
				<td>재영</td>
				<td>2019-12-03</td>
				<td>23</td>
			</tr>
			<tr>
				<td>1</td>
				<td>공지1</td>
				<td>재영</td>
				<td>2019-12-03</td>
				<td>23</td>
			</tr>
		</table>
	</div>
	<div id="write">
		<button type="button" onclick="location.href='noticeInsertForm.jsp'">글쓰기</button>
	</div>
	<div class="searchArea">
			<select id="searchCondition" name="searchCondition">
				<option value="writer">작성자</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="search">
			<button type="submit">검색하기</button>
			<%-- <% if(loginUser != null && loginUser.getUserId().equals("admin")){ %>
			<button onclick="location.href='views/notice/noticeInsertForm.jsp'">작성하기</button>
			<% } %> --%>
	</div> <!-- searchArea end -->
	<script>
		$(function(){
			$("#noticeList td").click(function(){
				location.href='<%=request.getContextPath()%>/viewAcademy/commonMenu/noticeDetail.jsp';
			});
		});
	</script>
</body>
</html>