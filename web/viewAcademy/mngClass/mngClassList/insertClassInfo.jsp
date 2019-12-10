<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>HAGONG</title>
<style>
	body {
		font-family: "Nanum Gothic";
		background:url("/hagong/images/classInsert.jpg") no-repeat top;
		background-size:85.9%;
	}
	
	input[type="text"], input[type="number"], input[type="date"] {
		width: 300px;
		height: 30px;
		margin-bottom:20px;
		border-radius: 5px;
		border: 1px solid lightgray;
	}
	
	input[type="checkbox"] {
		margin-left: 10px;
		width:20px;
		height:30px;
		margin-bottom:20px;
	}
	
	.bottomArea > button {
		display:inline;
		font-size: 18px;
		font-family: "Nanum Gothic";
		width:100px;
	}
	
	.bottomArea > button:hover {
		background:green;
		color:white;
	}
		
	fieldset {
		width:20%;
	}
		
	select {
		height: 30px;
		width: 300px;
		margin-bottom: 20px;
		border-radius: 5px;
		border: 1px solid lightgray;
	}
	
	.tableArea {
		background:rgba(268,268,268,50%);
		padding-top: 25px;
		width: 550px;
    	border-radius: 5px;
   		margin-bottom: 10px;
	}
</style>
</head>
<body>
	<header>
	<%@ include file="../../common/menubar.jsp" %>
	</header>
	<section>
	<div align="center">
      	<fieldset style="margin-bottom:-30px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;">
         	<legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">　수업정보 등록　</h1></legend>
      	</fieldset>
    </div>
	<div class="body" align="center">
		<div class="tableArea">
		<form id="classInfo" action="<%=request.getContextPath()%>/viewAcademy/mngClass/mngClassList/classInfo.jsp" method="get">
			<table class="insertTable">
				<tr>
					<td>과목 : </td>
					<td>
					<select style="margin-bottom:20px">
						<option>국어</option>
						<option>수학</option>
						<option>영어</option>
						<option>사회</option>
						<option>과학</option>
						<option>기타</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>
					<label for="selectTeacher">담당 강사 : </label>
					</td>
					<td>
					<select id="selectTeacher" style="margin-bottom:20px">
						<option value="김상찬">김상찬</option>
						<option value="서범수">서범수</option>
						<option value="박재영">박재영</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>
					<label>강좌명 : </label>
					</td>
					<td>
					<input type="text" id="classTitle" name="classTitle">
					</td>
				</tr>
				<tr>
					<td>
					<label>정원 : </label>
					</td>
					<td>
					<input type="number" id="numOfClass" name="numOfClass">
					</td>
				</tr>
				<tr>
					<td>
					<label>기간 : </label>
					</td>
					<td>
					<input type="date" id="dateOfClass" name="dateOfClass">
					</td>
				</tr>
				<tr>
					<td>
					<label>요일 : </label>
					</td>
					<td>
					<input type="checkbox" id="mon" name="day" value="monday"><label for="mon">월</label>
					<input type="checkbox" id="tue" name="day" value="tuesday"><label for="tue">화</label>
					<input type="checkbox" id="wed" name="day" value="wednesday"><label for="wed">수</label>
					<input type="checkbox" id="thur" name="day" value="thursday"><label for="thur">목</label>
					<input type="checkbox" id="fri" name="day" value="friday"><label for="fri">금</label>
					<input type="checkbox" id="sat" name="day" value="saturday"><label for="sat">토</label>
					<input type="checkbox" id="sun" name="day" value="sunday"><label for="sun">일</label>
					</td>
				</tr>
				<tr>
					<td>
					<label for="classroom">강의실 : </label>
					</td>
					<td>
					<select id="classroom" name="classroom" style="margin-bottom:20px">
						<option>A</option>
						<option>B</option>
						<option>C</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>
						<label for="classTime">강의 시간 : </label>
					</td>
					<td>
						<select id="classTime" style="margin-bottom:20px">
							<option>15:00 ~ 16:00</option>
							<option>16:00 ~ 17:00</option>
							<option>17:00 ~ 18:00</option>
						</select>
					</td>
				</tr> 	
				<tr>
					<td>
						<label>수업료 : </label>
					</td>
					<td>
						<input type="number" id="money" step="1000">
					</td>
				</tr>	
			</table>
		</div>
		<div class="bottomArea" style="margin-bottom:20px">
			<button onclick="location.href='<%=request.getContextPath()%>/viewAcademy/mngClass/mngClassList/classList.jsp'">취소</button>
			<button id="insertClassInfoBtn">등록</button>
		</div>
		</form>
	</div> <!-- body end -->
	</section>
	<footer></footer>
</body>
</html>