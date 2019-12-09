<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
<style>
section {
		background:url("/hagong/images/backModifySample.png") no-repeat top;
		background-size: cover;
	}
#profile {
	width: 200px;
	height: 200px;
	radius: 50%;
}

tr {
	background: none !important;
}

input {
	border: 1px solid lightgray;
	border-radius: 5px;
	height: 30px;
	background: none;
}

input[type=tel] {
	border: none;
	width: 50px;
}

input[type=text], select {
	border: none;
	border-radius: 5px;
	width: 200px;
	height: 30px;
	background: none;
}

input[type='email']{
	border: none;
}

#studentStatus {
	width: 70px;
}

input[type='file'] {
	display: none;
}

section button {
	font-size: 18px;
	margin-left: 1%;
	font-family: "Nanum Gothic";
	font-weight: bold;
	border: 2px solid green;
}

section button:hover {
	cursor: pointer;
	background: green;
	border: 2px solid green;
	color: white;
}

th, td {
	text-align: left !important;
}

fieldset {
	width:80%;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../common/menubar.jsp"%>
	</header>
	<section style="margin-bottom: 10%;">

	<div align="center">
	<fieldset style="border-left:none; border-right:none; border-bottom:none; border-top-color:black;">
		<legend align="center"><h2 style="font-family:'Do Hyeon'">　@@@ 님의 개인정보　</h2></legend>
		<div style="width: 100%; margin: auto auto;">
		<form id="UpdateStudentForm">
			<table class="table" align="center">
				<tr align="center">
					<td rowspan="7">
						<div align="center">
							<img id="profile"
								src="<%=request.getContextPath()%>/images/user.png">
						</div>
					</td>
				</tr>
				<tr>
					<td><li>아이디</li></td>
					<td><input type="text" value="bbogak" style="border: none;" readonly></td>
				</tr>
				<tr>
					<td><li>이름</li></td>
					<td><input type="text" value="박상준" style="border: none;" readonly></td>
				</tr>
				<tr>
					<td><li>생년월일</li></td>
					<td><input type="text" style="border: none;" value="2020년 3월 33일" readonly></td>
				</tr>
				<tr>
					<td><li>전화번호</li></td>
					<td><input type="tel" maxlength="3" value="000" readonly> - 
					<input type="tel" maxlength="4" value="0000" readonly> -
					<input type="tel" maxlength="4" value="0000" readonly></td>
				</tr>
				<tr>
					<td><li>학교 / 학년</li></td>
					<td><input type="text" value="kh" style="width: 120px;" readonly> &nbsp;
					<select style="width: 120px;" disabled>
						<option value="mid1">중학교 1학년</option>
						<option value="mid2" selected>중학교 2학년</option>
						<option value="mid3">중학교 3학년</option>
						<option value="high1">고등학교 1학년</option>
						<option value="high2">고등학교 2학년</option>
						<option value="high3">고등학교 3학년</option>
					</select>
					</td>
				</tr>
				<tr>
					<td><li>계열</li></td>
					<td><select disabled>
							<option>인문</option>
							<option>자연</option>
							<option selected>예체능</option>
					</select></td>
				</tr>
				<tr>
					<td></td>
					<td><li>희망대학 / 학과</li></td>
					<td><input type="text" value="군대" readonly> &nbsp;
						<input type="text" value="사망" readonly></td>
				</tr>
				<tr>
					<td></td>
					<td><li>주소</li></td>
					<td><input type="text" value="천호"
						style="width: 400px;" readonly></td>
				</tr>
				<tr>
					<td></td>
					<td><li>이메일</li></td>
					<td><input type="email" value="helloworld@kakao.com"
						style="width: 400px;" readonly></td>
				</tr>
				<tr>
					<td></td>
					<td><li>개인정보 동의여부</li></td>
					<td>Y</td>
				</tr>
				<tr>
					<td></td>
					<td colspan="2">
						<div align="center">
							<button type="button" id="cancelbtn" onclick="historyBack();"
							style="height: 30px;  display:inline;">메인</button>
							<button type="button" id="okbtn" onclick="location.href='<%=request.getContextPath()%>/viewAcademy/commonMenu/UpdateUserInfo.jsp'"
							style="height: 30px; display:inline;">수정</button>
						</div>
					</td>
				</tr>
			</table>
		</form>
		
	</div>
	</fieldset>
	</div>
	
	</section>
	<footer> </footer>
	<script>
		$("#addimg").click(function() {
			$("#imgfile").click();
		});

		$("#okbtn").click(function() {
			$("#updateForm").submit();
		});
		
		//숫자만 입력
		$("input[type='number']").keyup(function(event){
		    var inputVal = $(this).val();
		    $(this).val(inputVal.replace(/[^0-9]/gi,''));
		});
		$("input[type='tel']").keyup(function(event){
		    var inputVal = $(this).val();
		    $(this).val(inputVal.replace(/[^0-9]/gi,''));
		});
		
		//뒤로가기
		function historyBack(){
			location.href='<%=request.getContextPath() %>/index.jsp';
		};
	</script>
</body>
</html>