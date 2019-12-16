<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, hagong.academy.mngClass.mngCS.model.vo.*"%>
<%
	ArrayList<CSStudent> csslist = (ArrayList<CSStudent>) request.getAttribute("csslist");
	ArrayList<CSStudent> allStudent = (ArrayList<CSStudent>) request.getAttribute("allStudent");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
<style>
	.bottomBtn {
		width:100px !important;
		height:30px !important;
		font-size:18px;
	}
	section {
		background: snow;
	}
	.detailClass {
		width:1080px;
		margin-left:auto;
		margin-right:auto;
	}
	
	.detailClass .classbtn {
		display:flex;
		float: right;
		margin-top:10px;
		margin-bottom:10px;
	}
	.detailClass .classbtn button{
		margin-right:10px;
	}
	.detailClass .addDel button{
		margin-top:10px;
	}
	.detailClass button {
		width:90px; height:35px; background:white; border:1px solid green; border-radius:5px/5px;
	}
	.detailClass button:hover {
		background:green; color:white;
	}
	.detailClass .classListArea{display:flex;}
	.cArea{margin:0 auto;}
	.cArea.addDel{margin:auto 0;}
	.classListArea li {padding:2px;}
	.detailClass .classListArea .studentList{border:1px solid #333; padding:10px 0 0 0;width:450px; height:350px;border-radius: 10px;overflow:hidden;}
	.detailClass .classListArea .inputSrch{height:30px;border-radius: 20px;text-align:center;border:1px solid #333;margin-bottom: 10px;}
	.cArea h3 {margin:10px auto;}
	.studentList .tableArea {height:350px;overflow:auto;}
	.table {margin-bottom:2px !important;}
</style>
</head>
<!-- <body> -->
<body>
	<header>
		<%@ include file="../../common/menubar.jsp" %>	
	</header>
	<section>
		<div class="detailClass">
	<form id="classForm" action="" method="post">
		<div class="classInfo">
			<div align="center">
		      <h1 align="center" style="font-family:'Do Hyeon'; padding-top:20px;"><　<%= csslist.get(0).getClsName() %>　></h1>
	    	</div>
   			<div class="bTable">
				<table class="table">
					<tr>
						<th>담당강사</th>
						<th>대상학생</th>
						<th>개설 기간</th>
						<th>강의실</th>
						<th>제한인원</th>					
					</tr>
					<tr>
						<td><%= csslist.get(0).getTchName() %></td>
						<td><%= csslist.get(0).getClsStudentName() %></td>
						<td><%= csslist.get(0).getClsStart() %> ~ <%= csslist.get(0).getClsEnd()%></td>
						<td><%= csslist.get(0).getClassName()%></td>
						<td><%= csslist.get(0).getClsMax() %>명</td>
					</tr>
				</table>
			</div> <!-- 블랙리스트 정보 end -->	
		</div>
		<div class="classListArea">
			<div class="cArea allStudentList" align="center">
				<h3>전체 학생 목록</h3>
				<div class="studentList">
					<input type="search" class="inputSrch" placeholder="학생이름검색">
				<div class="tableArea">
					<table class="table">
						
						<%for(int i = 0; i < allStudent.size(); i++) {%>
							<tr>
								<td><%= allStudent.get(i).getStuName() %></td>
								<td><%= allStudent.get(i).getUserId() %></td>
								<td><%= allStudent.get(i).getSchool() %></td>
								<td><%= allStudent.get(i).getGradeName() %></td>
							</tr>
						<% } %>
					</table>
				</div>
					
				</div>
			</div>
			<div class="cArea addDel">
				<button class="addStudent">추가 ▶</button>
				<button class="delStudent">◀ 삭제</button>
			</div>
			<div class="cArea inClassStudentLsit" align="center">
				<h3>해당 강좌 수강생 목록</h3>
				<div class="studentList">
					<input type="search" class="inputSrch" placeholder="학생이름검색">
					<div class="tableArea">
					<table class="table">
						<%for(int i = 0; i < csslist.size(); i++) {%>
							<%if(csslist.get(i).getStuName() != null) {%>
							<tr>
								<td><%= csslist.get(i).getStuName() %></td>
								<td><%= csslist.get(i).getUserId() %></td>
								<td><%= csslist.get(i).getSchool() %></td>
								<td><%= csslist.get(i).getGradeName() %></td>
							</tr>
						<%}
						} %>
					</table>
					</div>
				</div>
				<input type="text" name="count" value="(29/30)" style="border:none;float:right;width:57px;" readonly>
			</div>
		</div> <!-- classListArea end -->
		<div class="classbtn">
			<button class="bottomBtn" type="button" onclick="location.href='<%=request.getContextPath()%>/viewAcademy/mngClass/mngCS/classStudent.jsp'">취소</button>
			<button class="bottomBtn" type="submit">저장</button>
			<br><br>
		</div>
	</form>
	</div>
	
	</section>

</body>
</html>