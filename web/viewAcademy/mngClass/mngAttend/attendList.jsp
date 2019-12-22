<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, hagong.academy.mngClass.mngAttend.model.vo.*"%>
<% 
	ArrayList<ClassSubject> list = (ArrayList<ClassSubject>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
<style>
	body {
		font-family: "Nanum Gothic";
	}
	
	.listArea {
		width: 90%;
		margin-left: auto;
		margin-right: auto;
		overflow: auto;
	}
	
	.listArea > button {
		float: right;
	}
	
	.listArea > input {
		float: right;
		border: 1px solid lightgray;
		border-radius: 5px;
	}
	
	.listArea > select {
		float: left;
		margin-right: 1%;
	}
	
	fieldset {
		width: 16%;
	}
	
	.searchBtn {
   		margin-left: 1%;
   		margin-bottom: 1%;
	    font-family: "Nanum Gothic";
	    font-weight: bold;
    	border: 2px solid green;
    	display: inline;
	}	
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<%@ include file="/viewAcademy/common/menubar.jsp" %>
	<% if(loginUser != null) { %>
	<% if(loginUser.getUserType().equals("MASTER")) { %>
	<div align="center">
      		<fieldset style="margin-bottom:-15px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;">
         	<legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">　출결 관리　</h1></legend>
      		</fieldset>
    </div>
	<div class="listArea">
		<button class="searchBtn">검색</button>
		<input type="search" id="searchClass" name="searchClass">
		<select id="selectCondition" style="float:right; border-radius:5px;">
			<option value="" selected disabled hidden>검색 조건</option>
			<option name="searchClassCondition">과목</option>
			<option name="searchClassCondition">강좌명</option>
			<option name="searchClassCondition">담당 강사</option>
		</select>
			<table class="classList table" align="center">
				<tr>
					<th>No.</th>
					<th>과목</th>
					<th>강좌명</th>
					<th>담당 강사</th>
					<th>대상 학생</th>
					<th>정원</th>
					<th>기간</th>
				</tr>
				<% for (int i=0; i<list.size(); i++) { %>
					<tr>
						<td><%= i+1 %></td>
						<input id="clsNo<%= i %>" type="hidden" value="<%=list.get(i).getClsNo()%>">
						<td><%=list.get(i).getSubId()%></td>
						<td><%=list.get(i).getClsName()%></td>
						<td><%=list.get(i).getName()%></td>
						<td><%	String grade = "";
								switch(list.get(i).getClsStudent()) { 
								case "MID1" : grade = "중1"; break;
								case "MID2" : grade = "중2"; break;
								case "MID3" : grade = "중3"; break;
								case "HIGH1" : grade = "고1"; break;
								case "HIGH2" : grade = "고2"; break;
								case "HIGH3" : grade = "고3"; break;
								case "ETC" : grade = "기타"; break;
								} %><%=grade%></td>
						<td><%=list.get(i).getClsMax()%></td>
						<td><%=list.get(i).getClsStart()%> ~ <%=list.get(i).getClsEnd()%></td>
					</tr>
				<% } %>
			</table>
	</div> <!-- listArea end -->
	<% }else if(loginUser.getUserType().equals("TEACHER")){ %>
	<!-- 로그인 유저가 강사일 경우 -->
		<div align="center">
      		<fieldset style="margin-bottom:-15px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;">
         	<legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">　출결 관리　</h1></legend>
      		</fieldset>
    </div>
	<div class="listArea">
		<button class="searchBtn">검색</button>
		<input type="search" id="searchClass" name="searchClass">
		<select id="selectCondition" style="float:right; border-radius:5px;">
			<option value="" selected disabled hidden>검색 조건</option>
			<option name="searchClassCondition">과목</option>
			<option name="searchClassCondition">강좌명</option>
			<option name="searchClassCondition">담당 강사</option>
		</select>
			<table class="classList table" align="center">
				<tr>
					<th>No.</th>
					<th>과목</th>
					<th>강좌명</th>
					<th>담당 강사</th>
					<th>대상 학생</th>
					<th>정원</th>
					<th>기간</th>
				</tr>
				<% for (int i=0; i<list.size(); i++) { 
					if(list.get(i).getName().equals(loginUser.getName())) { %>
					<tr>
						<td><%= i+1 %></td>
						<input id="clsNo<%= i %>" type="hidden" value="<%=list.get(i).getClsNo()%>">
						<td><%=list.get(i).getSubId()%></td>
						<td><%=list.get(i).getClsName()%></td>
						<td><%=list.get(i).getName()%></td>
						<td><%	String grade = "";
								switch(list.get(i).getClsStudent()) { 
								case "MID1" : grade = "중1"; break;
								case "MID2" : grade = "중2"; break;
								case "MID3" : grade = "중3"; break;
								case "HIGH1" : grade = "고1"; break;
								case "HIGH2" : grade = "고2"; break;
								case "HIGH3" : grade = "고3"; break;
								case "ETC" : grade = "기타"; break;
								} %><%=grade%></td>
						<td><%=list.get(i).getClsMax()%></td>
						<td><%=list.get(i).getClsStart()%> ~ <%=list.get(i).getClsEnd()%></td>
					</tr>
				<% }
				} %>
			</table>
	</div> <!-- listArea end -->
	<% }
	}else { %>
		<script>
			alert('접근권한이 없습니다.');
		</script>
	<% } %>
	<script>
		$(function(){
			$(".classList td").mouseenter(function(){
				$(this).parent().css("cursor","pointer");
			}).click(function(){
				var index = $(this).parent().children().eq(0).text();
				var classNum = $("#clsNo"+(index-1)).val();
				location.href="<%=request.getContextPath()%>/alistStudent.attend?classNum="+classNum+"&year="+<%=purYear%>+"&month="+<%=purMonth%>;
				
			});
			
			$(".searchBtn").click(function(){
				var selectCondition = $("#selectCondition option:selected").val();
				var searchWord = $("input[type=search]").val();
				
				location.href = "<%=request.getContextPath()%>/searchClass.attend?selectCondition=" + selectCondition + "&searchWord=" + searchWord;

					
			});
		});
	</script>
</body>
</html>