<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
<style>
	.detailClass {
		width:1080px;
		margin-left:auto;
		margin-right:auto;
	}
	
	.detailClass .classbtn {
		display:flex;
		float: right;
		margin-top:30px;
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
	.detailClass .classListArea{display:flex;margin-top: 250px;margin-right: 100px;}
	.cArea{margin: 60px auto 0 auto;}
	.cArea.addDel{margin:185px 0 0 0;}
	.classListArea li {padding:2px;}
	.detailClass .classListArea .studentList{border:1px solid #333; padding:10px 0 0 0; width:220px; height:250px;border-radius: 10px;}
	.detailClass .classListArea .inputSrch{height:30px;border-radius: 20px;text-align:center;border:1px solid #333;}
	
</style>
</head>
<!-- <body> -->
<body>
	<%@ include file="../../common/menubar.jsp" %>
	<div class="detailClass">
	<form id="classForm" action="" method="post">
		<div class="classListArea">
			<div class="classInfo">
				<h1>수학기초반</h1>
				<ul>
					<li>담당강사 : 김진호</li>
					<li>대상학생 : 중학교 1학년</li>
					<li>개설 기간 : 2019.03.02 ~ 2019.06.17</li>
					<li>강의실 : 2층 D강의실</li>
					<li>제한 인원 : 30명</li>
				</ul>
					<div class="bInfo">
			<div align="center">
		      <fieldset style="margin-top:-25px; margin-bottom:-15px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;width:90%;">
		         <legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">　수업정보　</h1></legend>
		      </fieldset>
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
					<td>김진호</td>
					<td>중학교 1학년</td>
					<td>2019.03.02 ~ 2019.06.17</td>
					<td>2층 D강의실</td>
					<td>30명</td>
				</tr>
			</table>
		</div> <!-- 블랙리스트 정보 end -->	
			</div>
			<div class="cArea allStudentList" align="center">
				<h3>전체 학생 목록</h3>
				<div class="studentList">
					<input type="search" class="inputSrch" placeholder="학생이름검색">
					<ul style="list-style-type: none;padding-inline-start: 0px;">
						<li>강동원(010-1111-2222)</li>
						<li>강동원(010-1111-2222)</li>
						<li>강동원(010-1111-2222)</li>
						<li>강동원(010-1111-2222)</li>
						<li>강동원(010-1111-2222)</li>
						<li>강동원(010-1111-2222)</li>
						<li>강동원(010-1111-2222)</li>
					</ul>
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
					<ul style="list-style-type: none;padding-inline-start: 0px;">
						<li>아이린(010-1234-4567)</li>
						<li>아이린(010-1234-4567)</li>
						<li>아이린(010-1234-4567)</li>
						<li>아이린(010-1234-4567)</li>
						<li>아이린(010-1234-4567)</li>
					</ul>
				</div>
				<input type="text" name="count" value="(29/30)" style="border:none;float:right;width:57px;" readonly>
			</div>
		</div> <!-- classListArea end -->
		<div class="classbtn">
			<button type="button" onclick="location.href='<%=request.getContextPath()%>/viewAcademy/mngClass/mngCS/classStudent.jsp'">취소</button>
			<button type="submit">저장</button>
		</div>
	</form>
	</div>
	
</body>
</html>