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
}

input[type=tel] {
	text-align: center;
	width: 90px;
}

input[type=text], select {
	border: 1px solid lightgray;
	border-radius: 5px;
	width: 200px;
	height: 30px;
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

input[readonly] {
	background:none;
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
	
	<legend align="center"><h2 style="font-family:'Do Hyeon'">　개인정보 수정　</h2></legend>
	<div style="width:100%; margin: auto auto;">
		<form id="UpdateStudentForm">
			<table class="table" align="center">
				<tr align="center">
					<td rowspan="7">
						<div align="center">
							<img id="profile"
								src="<%=request.getContextPath()%>/images/user.png">
							<button type="button" id="addimg"
								style="height: 1.5em; margin-top: 3%;">사진 선택</button>
							<input type="file" id="imgfile"> 
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
					<td><input type="tel" maxlength="3" placeholder="000"> - 
					<input type="tel" maxlength="4" placeholder="0000"> -
					<input type="tel" maxlength="4" placeholder="0000"></td>
				</tr>
				<tr>
					<td><li>학교 / 학년</li></td>
					<td><input type="text" placeholder="학교 이름 입력" style="width: 120px;"> &nbsp;
					<select style="width: 120px;">
						<option value="mid1">중학교 1학년</option>
						<option value="mid2">중학교 2학년</option>
						<option value="mid3">중학교 3학년</option>
						<option value="high1">고등학교 1학년</option>
						<option value="high2">고등학교 2학년</option>
						<option value="high3">고등학교 3학년</option>
					</select>
					</td>
				</tr>
				<tr>
					<td><li>계열</li></td>
					<td><select>
							<option>인문</option>
							<option>자연</option>
							<option>예체능</option>
					</select></td>
				</tr>
				<tr>
					<td></td>
					<td><li>희망대학 / 학과</li></td>
					<td><input type="text" value="군대"> &nbsp;
						<input type="text" value="사망"></td>
				</tr>
				<tr>
					<td></td>
					<td><li>주소</li></td>
					<td><input type="text" placeholder="학생 거주지 입력"
						style="width: 400px;"></td>
				</tr>
				<tr>
					<td></td>
					<td><li>이메일</li></td>
					<td><input type="email" placeholder="helloworld@kakao.com"
						style="width: 400px;"></td>
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
						<button type="button" id="cancelbtn" onclick="historyBack();" style="height: 30px; display:inline;">취소</button>
						<button id="okbtn" style="height: 30px;display:inline;">수정완료</button>
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
			history.back();
		};
	</script>
</body>
</html>