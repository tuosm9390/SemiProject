<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#detailClass {
		width:1080px;
		margin-left:auto;
		margin-right:auto;
	}
	#detailClass div {
		display:inline-block;
		margin-left:auto;
		margin-right: 60px;
    	margin-top: 70px;
	}
	
	#detailClass #classbtn {
		display:flex;
		float: right;
	}
	#detailClass #classbtn button{
		margin-right:10px;
	}
	#detailClass #addDel button{
		margin-top:10px;
	}
	#detailClass button {
		width:90px; height:35px; background:white; border:1px solid green; border-radius:5px/5px;
	}
	#detailClass button:hover {
		background:green; color:white;
	}
	
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<section id="detailClass">
	<form id="classForm" action="" method="post">
	<div id="classInfo">
		<h1>수학기초반</h1>
		<ul>
			<li>담당강사 : 김진호</li>
			<li>대상학생 : 중학교 1학년</li>
			<li>개설 기간 : 2019.03.02 ~ 2019.06.17</li>
			<li>강의실 : 2층 D강의실</li>
			<li>제한 인원 : 30명</li>
		</ul>
	</div>
	<div class="allStudentList" align="center">
		<h2>전체 학생 목록</h2>
		<input type="search" placeholder="학생이름검색">
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
	<div id="addDel">
		<button class="addStudent">추가 ▶</button>
		<button class="delStudent">◀ 삭제</button>
	</div>
	<div class="inClassStudentLsit" align="center">
		<h2>해당 강좌 수강생 목록</h2>
		<input type="search" placeholder="학생이름검색">
		<ul style="list-style-type: none;padding-inline-start: 0px;">
			<li>아이린(010-1234-4567)</li>
			<li>아이린(010-1234-4567)</li>
			<li>아이린(010-1234-4567)</li>
			<li>아이린(010-1234-4567)</li>
			<li>아이린(010-1234-4567)</li>
		</ul>
		<input type="text" name="count" value="(29/30)" style="border:none;" readonly>
	</div>
	<div id="classbtn">
		<button type="reset">취소</button>
		<button type="submit">저장</button>
	</div>
	</form>
	</section>
	
</body>
</html>