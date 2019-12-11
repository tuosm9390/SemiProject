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
	<%-- <%= if(loginUser.getUserId() == "admin") { %> --%>
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
						<td><%=list.get(i).getSubId()%></td>
						<td><%=list.get(i).getClsName()%></td>
						<td><%=list.get(i).getName()%></td>
						<% if(list.get(i).getClsStudent().equals("MID1")) { %>
							<td>중학교 1학년</td>		
						<% }else if(list.get(i).getClsStudent().equals("MID2")) {%>
							<td>중학교 2학년</td>
						<% } %>
						<td><%=list.get(i).getClsMax()%></td>
						<td><%=list.get(i).getClsStart()%> ~ <%=list.get(i).getClsEnd()%></td>
					</tr>
				<% } %>
			</table>
	</div> <!-- listArea end -->
	<%-- <% }else { %>
	<!-- 로그인 유저가 강사일 경우 -->
	<div id="head">
		<h2 align="center">출결 관리</h2>
		<select>
			<option value="" selected disabled hidden>기간별 검색</option>
			<option value="year">2019</option>
			<option value="year">2018</option>
		</select>
		<button id="searchClass" style="margin:10px; border:1px solid green; background:white; color:black; display:inline">검색</button>
		<button id="writeClass" style="margin:10px; border:1px solid green; background:white; color:black; display:inline" onclick="location.href='insertClassInfo.jsp'">입력</button>
		<input type="search" id="searchClass" name="searchClass">
				<select style="float:right">
			<option value="" selected disabled hidden>조건별 검색</option>
			<option name="searchClassCondition">과목</option>
			<option name="searchClassCondition">강좌명</option>
			<option name="searchClassCondition">담당 강사</option>
		</select>
			<table>
				<thead>
					<tr>
						<th>No.</th>
						<th>과목</th>
						<th>강좌명</th>
						<th>기간</th>
						<th>강의실</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td class="user-name">1</td>
						<td class="user-email">고등 입시 국어</td>
						<td class="user-phone">2019.11.10~2020.03.21</td>
						<td class="user-mobile">2층 C클래스</td>
					</tr>
					<tr>
						<td class="user-name">2</td>
						<td class="user-email">중등 영어</td>
						<td class="user-phone">2019.11.02~2020.03.21</td>
						<td class="user-mobile">1층 B클래스</td>
					</tr>
					<tr>
						<td class="user-name">3</td>
						<td class="user-email">김상찬 수학교실</td>
						<td class="user-phone">2019.09.01~2020.03.21</td>
						<td class="user-mobile">3층 A클래스</td>
					</tr>
					<tr>
						<td class="user-name">4</td>
						<td class="user-email"></td>
						<td class="user-phone"></td>
						<td class="user-mobile"></td>
					</tr>
					<tr>
						<td class="user-name">5</td>
						<td class="user-email"></td>
						<td class="user-phone"></td>
						<td class="user-mobile"></td>
					</tr>
					<tr>
						<td class="user-name"></td>
						<td class="user-email"></td>
						<td class="user-phone"></td>
						<td class="user-mobile"></td>
					</tr>
					<tr>
						<td class="user-name"></td>
						<td class="user-email"></td>
						<td class="user-phone"></td>
						<td class="user-mobile"></td>
					</tr>
					<tr>
						<td class="user-name"></td>
						<td class="user-email" ></td>
						<td class="user-phone">(724)-705-3555</td>
						<td class="user-mobile">(764)-841-2531</td>
					</tr>
					<tr>
						<td class="user-name"></td>
						<td class="user-email" ></td>
						<td class="user-phone">(774)-205-7754</td>
						<td class="user-mobile">(639)-267-9728</td>
					</tr>
					<tr>
						<td class="user-name"></td>
						<td class="user-email" ></td>
						<td class="user-phone">(723)-243-7706</td>
						<td class="user-mobile">(172)-597-3422</td>
					</tr>
				</tbody>
			</table>
	</div> <!-- head end -->
	<% } %> --%>
	<script>
		$(function(){
			$(".classList td").mouseenter(function(){
				$(this).parent().css("cursor","pointer");
			}).click(function(){
				<%-- var num = $(this).parent().children().eq(0).text();
				
				location.href="<%=request.getContextPath()%>/selectOne.at?num=" + num; --%>
				location.href="<%=request.getContextPath()%>/viewAcademy/mngClass/mngAttend/attendDetail.jsp";
			});
			
			$(".searchBtn").click(function(){
				var selectCondition = $("#selectCondition option:selected").val();
				var searchWord = $("input[type=search]").val();
				
				location.href = "<%=request.getContextPath()%>/searchClass.attend?selectCondition=" + selectCondition + "&searchWord=" + searchWord;
				if(selectCondition == "과목") {
					console.log(searchWord);
				}else if(selectCondition == "강좌명") {
					console.log('강좌명 선택함');
				}else if(selectCondition == "담당 강사") {
					console.log('담당 강사 선택함');
				}
					
			});
		});
	</script>
</body>
</html>