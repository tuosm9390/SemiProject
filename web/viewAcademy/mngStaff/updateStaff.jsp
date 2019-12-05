<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
td {
	background: white;
	text-align: left !important;
}

input, select {
	border: 1px solid lightgray;
	border-radius: 5px;
	height: 30px;
}

input[readonly] {
	border: none;
}

input[type=file] {
	display: none;
	align-items: center;
}

input[type=text], input[type=email], select {
	width: 300px;
}

input[size] {
	width: 90px;
	text-align: center;
}

.outArea {
	width: 70%;
	margin-left: auto;
	margin-right: auto;
}

.btnArea {
	display: inline;
}

.bottomBtn {
	font-size: 18px;
	margin-left: 1%;
	font-family: "Nanum Gothic";
	font-weight: bold;
	border: 2px solid green;
	display: inline;
}

.bottomBtn:hover {
	cursor: pointer;
	background: green;
	border: 2px solid green;
	color: white;
	display: inline;
}

.delete {
	display: inline;
}

#profile {
	width: 200px;
	height: 200px;
	radius: 50%;
}

#userId {
	width: 300px;
}

#address {
	width: 500px;
}

#deleteBtn {
	border-color: red;
}

#deleteBtn:hover {
	background: red;
	color: white;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../common/menubar.jsp"%>
	</header>
	<section>
		<div class="outArea">
			<form action="" method="post">
			<table>
				<tr>
					<td rowspan="5" width="10%"><div align="center"><img id="profile" src="../../images/user.png"></div></td>
					<td width="190px">★ 직원 ID</td>
					<td width="300px"><input type="text" name="userId" id="userId" value="KJH001205" readoonly></td>
					<td width="300px"></td>
				</tr>
				<tr>
					<td>● 이름</td>
					<td colspan="2"><input type="text" name="userName" id="userName" value="김진호"></td>
				</tr>
				<tr>
					<td>● 생년월일</td>
					<td colspan="2"><input type="text" name="birth" id="datepicker" value="2000.12.05." readonly></td>
				</tr>
				<tr>
					<td>● 전화번호</td>
					<td colspan="2"><input type="text" maxlength="3" size="4" name="tel1" value="010"> - 
					    			<input type="text" maxlength="4" size="4" name="tel2" value="0000"> - 
					    			<input type="text" maxlength="4" size="4" name="tel3" value="7771"></td>
				</tr>
				<tr>
					<td>● 담당업무</td>
					<td colspan="2">
						<select name="subject">
							<option value="select">담당업무 선택</option>
							<option value="korea" selected>국어</option>
							<option value="math">수학</option>
							<option value="english">영어</option>
							<option value="social">사회탐구</option>
							<option value="science">과학탐구</option>
							<option value="foreign">제2외국어</option>
							<option value="desk">행정</option>
							<option value="cram">입시</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><div align="center"><button id="imgBtn">사진 선택</button></div><input type="file" id="imgFile"></td>
					<td>● 이메일</td>
					<td colspan="2"><input type="email" name="email" id="email" value="kjh7771@gmail.com"></td>
				</tr>
				<tr>
					<td></td>
					<td>● 주소</td>
					<td colspan="2"><input type="text" name="address" id="address" value="강남구 역삼동 KH정보교육원 C class"></td>
				</tr>
				<tr>
					<td></td>
					<td>● 개인정보 제공<br>　및 활용 동의</td>
					<td colspan="2">
						<div class="acceptText">Y</div>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>● 급여 계약서 </td>
					<td>20191205_김진호_급여_계약서.hwp　<button class="delete">삭제</button></td>
					<td><button id="payBtn">파일 선택</button><input type="file" id="payFile"></td>
				</tr>
				<tr>
					<td></td>
					<td>● 경력 등 기타 서류</td>
					<td>20191205_김진호_이력서.hwp　<button class="delete">삭제</button></td>
					<td><button id="docBtn">파일 선택</button><input type="file" id="docFile"></td>
				</tr>
			</table>		
			</form>
			
			<div class="btnArea">
				<button class="bottomBtn" id="deleteBtn">삭제</button>
			</div>
			<div class="btnArea" style="margin-left:80%;">
				<button class="bottomBtn" onclick="goModify();">수정</button>
				<button class="bottomBtn" onclick="goList();">목록</button>
			</div> <!-- btnArea end -->
			<br>
			
		</div> <!-- outArea end -->
		<script>
			$(function(){
				$("#imgBtn").click(function(){
					$("#imgFile").click();
				});
				
				$("#payBtn").click(function(){
					$("#payFile").click();
				});
				
				$("#docBtn").click(function(){
					$("#docFile").click();
				});
			});
			
			function doModify(){
				location.href= "<%= request.getContextPath() %>/viewAcademy/mngStaff/updateStaff.jsp";
			}
			
			function goList(){
				location.href = "<%= request.getContextPath() %>/viewAcademy/mngStaff/staffList.jsp";
			}
		</script>
	</section>
	<footer>
	</footer>
</body>
</html> 