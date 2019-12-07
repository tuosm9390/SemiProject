<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	background: url("/hagong/images/abc.jpg") no-repeat top;
	background-size: 86%;
}

#profile {
	width: 200px;
	height: 200px;
	radius: 50%;
}

td, tr{
	background: none !important;
	text-align: left !important;
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
</style>
</head>
<body>
	<header>
		<%@ include file="../common/menubar.jsp"%>
	</header>
	<section>
	<div align="center">
	<fieldset
			style="border-bottom: none; border-left: none; border-right: none; border-top: 1px solid black;
					width: 80%;">
			<legend align="center">
				<h1 style="font-family:'Do Hyeon'">　학생 정보 수정　</h1>
			</legend>
	<div style="width: 80%; margin: auto auto;">
		<form id="UpdateStudentForm">
			<table class="table" align="center">
				<tr align="center">
					<td rowspan="8">
						<div align="center">
							<img id="profile"
								src="<%=request.getContextPath()%>/images/user.png">
							<button type="button" id="addimg"
								style="height: 1.5em; margin-top: 3%;">사진 선택</button>
							<input type="file" id="imgfile"> <select
								id="studentStatus" style="height: 25px; margin-top: 5%;">
								<option selected>재원</option>
								<option>퇴원</option>
								<option>휴원</option>
							</select>
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
					<td><input type="text" id="datepicker" readonly></td>
				</tr>
				<tr>
					<td><li>전화번호</li></td>
					<td><input type="tel" maxlength="3"> - 
					<input type="tel" maxlength="4"> -
					<input type="tel" maxlength="4"></td>
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
					<td><li>학부모 이름</li></td>
					<td><input type="text" value="박상찬" style="border: none;" readonly></td>
				</tr>
				<tr>
					<td></td>
					<td><li>학부모 아이디</li></td>
					<td><input type="text" value="scpark9999" style="border: none;" readonly></td>
				</tr>
				<tr>
					<td></td>
					<td><li>학부모 전화번호</li></td>
					<td><input type="tel" maxlength="3"> - 
					<input type="tel" maxlength="4"> -
					<input type="tel" maxlength="4"></td>
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
					<td><input type="text" value="학생 거주지 입력"
						style="width: 400px;"></td>
				</tr>
				<tr>
					<td></td>
					<td><li>이메일</li></td>
					<td><input type="email" value="helloworld@kakao.com"
						style="width: 400px;"></td>
				</tr>
				<tr>
					<td></td>
					<td><li>개인정보 동의여부</li></td>
					<td>Y</td>
				</tr>
			</table>
		</form>
		</div>
		<button id="okbtn"
			style="float: right; width: 80px; height: 30px; margin-left: 10px; margin-bottom: 50px;">수정</button>
		<button id="cancelbtn"
			onclick="location.href='<%=request.getContextPath()%>/viewAcademy/mngStudent/mngInfo/studentInfo.jsp'"
			style="float: right; width: 80px; height: 30px;">취소</button>
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
		
		//DatePicker
		$(function() {
			$("#datepicker").datepicker(
					{
						dateFormat : 'yy-mm-dd',
						prevText : '이전 달',
						nextText : '다음 달',
						monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
						dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
						dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
						showMonthAfterYear : true,
						changeMonth : true,
						changeYear : true,
						constrainInput : false,
						yearSuffix : '년',
						yearRange : 'c-20:c'
					});
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
	</script>
</body>
</html>