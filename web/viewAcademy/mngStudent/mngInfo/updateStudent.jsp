<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="hagong.academy.mngStudent.mngInfo.model.vo.*"%>
<%
	Student s = (Student) request.getAttribute("s");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
<style>
section {
	background:url("/hagong/images/backInfo.jpg") no-repeat top;
	background-size: cover;
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

.redText {
	display: block;
	color: red;
}

.greenText {
	display: block;
	color: green;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../../common/menubar.jsp"%>
	</header>
	<section>
		<div align="center">
		<fieldset
				style="border-bottom: none; border-left: none; border-right: none; border-top: 1px solid black;
						width: 90%;">
				<legend align="center">
					<h1 style="font-family:'Do Hyeon'">　학생 정보 수정　</h1>
				</legend>
				<div style="width: 80%; margin: auto auto;">
					<form id="UpdateStudentForm" encType="multipart/form-data" 
						action="<%= request.getContextPath() %>/aupdate.info" method="post">
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
											<option value='Y' selected>재원</option>
											<option value='X'>퇴원</option>
											<option value='R'>휴원</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td><li>ID</li></td>
								<td><input type="text" placeholder="<%= s.getUserId() %>" value="<%= s.getUserId() %>" id="userId" name="userId" readonly
									style="background: none; border: none;"><br>
								</td>
							</tr>
							<tr>
								<td><li>이름</li></td>
								<td><input type="text" placeholder="<%= s.getName() %>" value="<%= s.getName() %>" id="userName" name="userName"><br>
								<span id="usernameSpan" class="redText"></span></td>
							</tr>
							<tr>
								<td><li>생년월일</li></td>
								<td><input type="text" id="datepicker" name="birth" value="<%= s.getBirth()%>" readonly></td>
							</tr>
							<tr>
								<td><li>전화번호</li></td>
								<td><input type="tel" maxlength="3" name="tel1" value="<%= s.getPhone().substring(0, 2)%>"> - 
								<input type="tel" maxlength="4" name="tel2" value="<%= s.getPhone().substring(4, 7)%>"> - 
								<input type="tel" maxlength="4" name="tel3" value="<%= s.getPhone().substring(9, 12)%>"></td>
							</tr>
							<tr>
								<td><li>학교 / 학년</li></td>
								<td><input type="text" placeholder="<%= s.getSchool()%>" style="width: 120px;" name="school" value="<%= s.getSchool()%>"> &nbsp;
								<select style="width: 120px;" name="grade">
									<option value="1" selected>중학교 1학년</option>
									<option value="2">중학교 2학년</option>
									<option value="3">중학교 3학년</option>
									<option value="4">고등학교 1학년</option>
									<option value="5">고등학교 2학년</option>
									<option value="6">고등학교 3학년</option>
								</select>
								</td>
							</tr>
							<tr>
								<td><li>계열</li></td>
								<td><select name="track">
									<option value="LIB" selected>인문계</option>
									<option value="NAT">자연계</option>
									<option value="AMP">예체능</option>
									<option value="IDS">실업계</option>
									<option value="ETC">기타</option>
								</select></td>
							</tr>
							<tr>
								<td><li>학부모 아이디</li></td>
								<td><input type="text" placeholder="<%= s.getRefId()%>" value="<%= s.getRefId()%>" id="refId" name="refId" readonly
									style="background: none; border: none;"><br>
								</td>
							</tr>
							<tr>
								<td></td>
								<td><li>학부모 이름</li></td>
								<td><input type="text" placeholder="<%= s.getRefName() %>" value="<%= s.getRefName() %>" id="refName" name="refName"><br>
								<span id="refnameSpan" class="redText"></span></td>
							</tr>
							<tr>
								<td></td>
								<td><li>학부모 전화번호</li></td>
								<td><input type="tel" maxlength="3" name="reftel1" value="<%= s.getRefPhone().substring(0, 3) %>"> - 
								<input type="tel" maxlength="4" name="reftel2" value="<%= s.getRefPhone().substring(4, 7) %>"> -
								<input type="tel" maxlength="4" name="reftel3" value="<%= s.getRefPhone().substring(8, 11) %>"></td>
							</tr>
							<tr>
								<td></td>
								<td><li>희망대학 / 학과</li></td>
								<td><input type="text" placeholder="<%= s.getCollege() %>" value="<%= s.getCollege() %>" name="college" style="width: 100px;">
									<label style="color: black;">대학교</label>&emsp;
									<input type="text" placeholder="<%= s.getMajor() %>" value="<%= s.getMajor() %>" name="major" style="width: 100px;"></td>
							</tr>
							<tr>
								<td></td>
								<td><li>주소</li></td>
								<td><input type="text" placeholder="<%= s.getAddress() %>" value="<%= s.getAddress() %>" name="address"
									style="width: 400px;"></td>
							</tr>
							<tr>
								<td></td>
								<td><li>이메일</li></td>
								<td><input type="email" placeholder="<%= s.getEmail() %>" value="<%= s.getEmail() %>" name="email"
									style="width: 400px;"></td>
							</tr>
							<tr>
								<td></td>
								<td><li>개인정보 동의여부</li></td>
								<td style="color: black;">Y</td>
							</tr>
						</table>
					</form>
				</div>
				<button id="okbtn" type="button" onclick="doUpdate();"
					style="float: right; width: 80px; height: 30px; margin-left: 10px; margin-bottom: 50px;">수정</button>
				<button id="cancelbtn"
					onclick="location.href='<%=request.getContextPath()%>/viewAcademy/mngStudent/mngInfo/studentDetail.jsp'"
					style="float: right; width: 80px; height: 30px;">취소</button>
			</fieldset>
		</div>
	</section>
	<footer> </footer>
	<script>
		$("#addimg").click(function() {
			$("#imgfile").click();
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
		
		//프로필이미지
		function loadImg(value) {
			if (value.files && value.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#profile").attr("src", e.target.result);
					$("#profile").css({
						"border-radius" : "50%"
					})
				};
				reader.readAsDataURL(value.files[0]);
			}
		}

		// 유효성검사
		// 정규식 검사
		// 학생 이름
		$("#userName").keyup(
				function(event) {
					var userName = $("#userName").val();
					var check = /[a-zA-Z가-힣]{2,}/;
					var check2 = /^[^0-9]+$/;
					var check3 = /[`~!@#$%^&*()_+{}\[\]\\';:",./<>?|]/;
					if (check.test(userName) && check2.test(userName)
							&& !check3.test(userName)) {
						$("#usernameSpan").removeClass('redText').addClass(
								'greenText');
						$("#usernameSpan").text("");
					} else {
						$("#usernameSpan").removeClass('greenText').addClass(
								'redText');
						$("#usernameSpan").text("이름은 2글자 이상의 문자로 설정해 주세요.");
					}
				});

		// 학생 이메일
		$("#email").keyup(function(event) {
			var email = $("#email").val();
			var check = /(\w{4,})@(\w{1,})\.(\w{1,3})/ig;
			if (check.test(email)) {
				$("#emailSpan").removeClass('redText').addClass('greenText');
				$("#emailSpan").text("");
			} else {
				$("#emailSpan").removeClass('greenText').addClass('redText');
				$("#emailSpan").text("부적합한 Email 입니다. 다시 설정해 주세요!");
			}
		});

		// 학생 전화번호
		$("input[type='tel']").keyup(function(event) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[^0-9]/gi, ''));
		});

		// 학부모 이름
		$("#refName").keyup(
				function(event) {
					var refName = $("#refName").val();
					var check = /[a-zA-Z가-힣]{2,}/;
					var check2 = /^[^0-9]+$/;
					var check3 = /[`~!@#$%^&*()_+{}\[\]\\';:",./<>?|]/;
					if (check.test(refName) && check2.test(refName)
							&& !check3.test(refName)) {
						$("#refnameSpan").removeClass('redText').addClass(
								'greenText');
						$("#refnameSpan").text("");
					} else {
						$("#refnameSpan").removeClass('greenText').addClass(
								'redText');
						$("#refnameSpan").text("이름은 2글자 이상의 문자로 설정해 주세요.");
					}
				});

		function doUpdate() {
			if ($("#usernameSpan").prop("class") === "redText") {
				alert("학생 이름을 확인해 주세요.");
				return false;
			} else if ($("#datepicker").val() === "") {
				alert("생년월일을 확인해 주세요.");
				return false;
			} else if ($("#refnameSpan").prop("class") === "redText") {
				alert("학부모 이름을 확인해 주세요.");
				return false;
			} else if ($("#tel1").val() === "" || $("#tel2").val() === ""
					|| $("#tel3").val() === "") {
				alert("전화번호를 확인해 주세요.");
				return false;
			} else if ($("#reftel1").val() === "" || $("#reftel2").val() === ""
					|| $("#reftel3").val() === "") {
				alert("학부모 전화번호를 확인해 주세요.");
				return false;
			} else if ($("#accept").prop("checked") === false) {
				alert("개인정보 제공 및 활용에 동의해 주세요.");
				return false;
			} else {
				alert("된다!");
				return true;
			}
		};
	</script>
</body>
</html>