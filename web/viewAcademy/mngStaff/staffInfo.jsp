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

label, input, select, input:focus, select:focus {
	border: none;
	outline: none;
	border-radius: 5px;
	height: 30px;
	color: black;
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
	width: 80%;
	margin-left: auto;
	margin-right: auto;
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

.download {
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
					<td width="20%"><li>직원 ID</li></td>
					<td width="50%"><input type="text" name="userId" id="userId" value="KJH001205" readonly></td>
					<td width="10%"></td>
				</tr>
				<tr>
					<td><li>이름</li></td>
					<td colspan="2"><input type="text" name="userName" id="userName" value="김진호"></td>
				</tr>
				<tr>
					<td><li>생년월일</li></td>
					<td colspan="2"><input type="text" name="birth" id="datepicker" value="2000.12.05." readonly></td>
				</tr>
				<tr>
					<td><li>전화번호</li></td>
					<td colspan="2"><input type="text" maxlength="3" size="4" name="tel1" value="010" readonly> - 
					    			<input type="text" maxlength="4" size="4" name="tel2" value="0000" readonly> - 
					    			<input type="text" maxlength="4" size="4" name="tel3" value="7771" readonly></td>
				</tr>
				<tr>
					<td><li>담당업무</li></td>
					<td colspan="2">
						<select name="subject" disabled>
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
					<td></td>
					<td><li>이메일</li></td>
					<td colspan="2"><input type="email" name="email" id="email" value="kjh7771@gmail.com" readonly></td>
				</tr>
				<tr>
					<td></td>
					<td><li>주소</li></td>
					<td colspan="2"><input type="text" name="address" id="address" value="강남구 역삼동 KH정보교육원 C class" readonly></td>
				</tr>
				<tr>
					<td></td>
					<td><li>개인정보 제공<br>　　및 활용 동의</li></td>
					<td colspan="2">
						<div class="acceptText">Y</div>
					</td>
				</tr>
				<tr>
					<td></td>
					<td><li>급여 계약서</li></td>
					<td colspan="2"><label>20191205_김진호_급여_계약서.hwp</label>&nbsp;<button class="download">다운로드</button></td>
				</tr>
				<tr>
					<td></td>
					<td><li>경력 등 기타 서류</li></td>
					<td colspan="2"><label>20191205_김진호_이력서.hwp</label>&nbsp;<button class="download">다운로드</button></td>
				</tr>
			</table>		
			</form>
			
			<div class="btnArea" align="right">
				<button class="bottomBtn" onclick="goModify();">수정</button>
				<button class="bottomBtn" onclick="goList();">목록</button>
			</div> <!-- btnArea end -->
			<br>
			
		</div> <!-- outArea end -->
		<script>
			function goModify(){
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