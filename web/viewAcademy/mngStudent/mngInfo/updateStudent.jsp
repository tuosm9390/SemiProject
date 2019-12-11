<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
<style>
section {
	background:url("/hagong/images/backInfo.jpg") no-repeat top;
	/* background-size:85.9%; */
	/* background-size: 1333px 1200px; */
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
					<td><li>ID</li></td>
					<td><input type="text" placeholder="ID 입력" value="bbogak" id="userId" name="userId"><br>
					<span class="idSpan" class="redText"></span></td>
				</tr>
				<tr>
					<td><li>이름</li></td>
					<td><input type="text" placeholder="이름 입력" value="박상준" id="userName" name="userName"><br>
					<span class="nameSpan" class="redText"></span></td>
				</tr>
				<tr>
					<td><li>생년월일</li></td>
					<td><input type="text" id="datepicker" name="birth"></td>
				</tr>
				<tr>
					<td><li>전화번호</li></td>
					<td><input type="tel" maxlength="3" name="tel1"> - 
					<input type="tel" maxlength="4" name="tel2"> -
					<input type="tel" maxlength="4" name="tel3"></td>
				</tr>
				<tr>
					<td><li>학교 / 학년</li></td>
					<td><input type="text" placeholder="학교 이름 입력" style="width: 120px;" name="school"> &nbsp;
					<select style="width: 120px;" name="grade">
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
					<td><select name="track">
							<option>인문</option>
							<option>자연</option>
							<option>예체능</option>
					</select></td>
				</tr>
				<tr>
					<td><li>학부모 아이디</li></td>
					<td><input type="text" placeholder="학부모 아이디 입력" value="scpark9999" id="refId" name="refId"><br>
					<span class="idSpan" class="redText"></span></td>
				</tr>
				<tr>
					<td></td>
					<td><li>학부모 이름</li></td>
					<td><input type="text" placeholder="학부모 이름 입력" value="박상찬" id="refName" name="refName"><br>
					<span class="nameSpan" class="redText"></span></td>
				</tr>
				<tr>
					<td></td>
					<td><li>학부모 전화번호</li></td>
					<td><input type="tel" maxlength="3" name="reftel1"> - 
					<input type="tel" maxlength="4" name="reftel2"> -
					<input type="tel" maxlength="4" name="reftel3"></td>
				</tr>
				<tr>
					<td></td>
					<td><li>희망대학 / 학과</li></td>
					<td><input type="text" placeholder="희망 대학 입력" value="군대" name="college" style="width: 100px;">
						<label style="color: black;">대학교</label>&emsp;
						<input type="text" placeholder="희망 학과 입력" value="사망" name="major" style="width: 100px;"></td>
				</tr>
				<tr>
					<td></td>
					<td><li>주소</li></td>
					<td><input type="text" placeholder="학생 거주지 입력" value="학생 거주지 입력" name="address"
						style="width: 400px;"></td>
				</tr>
				<tr>
					<td></td>
					<td><li>이메일</li></td>
					<td><input type="email" placeholder="helloworld@kakao.com" value="helloworld@kakao.com" name="email"
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
		<button id="okbtn"
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

		//유효성검사
		// 아이디 정규식
		function idcheck(str) {
			var check = /^[a-z][a-z0-9_-]{3,11}$/;
			if (check.test(str)) {
				return true;
			}
			return false;
		}

		// 이름 정규식
		function namecheck(str) {
			var check = /^[가-힝]{2,4}$/;
			if (check.test(str)) {
				return true;
			}
			return false;
		}
		// 정규식 검사
		$("#userId").keyup(function(event) {
            var userId = $("#userId").val();
            var check = /^[a-z][a-z0-9]{3,11}$/;
            if(check.test(userId)){
               $.ajax({
                  url:"/hagong/idCheck.cm",
                  type:"post",
                  data:{userId:$("#userId").val()},
                  success:function(data){
                     if(data === "success") {
                        $("#idSpan").removeClass('redText').addClass('greenText');
                        $("#idSpan").text("사용 가능한 ID 입니다.");
                     } else {
                        $("#idSpan").removeClass('greenText').addClass('redText');
                        $("#idSpan").text("이미 사용중인 ID 입니다. 다시 설정해 주세요!");
                     }
                  },
                  error:function(){
                     console.log("Failed");
                  }
               });
            } else {
               $("#idSpan").removeClass('greenText').addClass('redText');
               $("#idSpan").text("부적합한 ID 입니다. 다시 설정해 주세요!");
            }
         });
         
         $("#userName").keyup(function(event){
            var userName = $("#userName").val();
            var check = /[a-zA-Z가-힣]{2,}/;
            if(check.test(userName)){
               $("#nameSpan").removeClass('redText').addClass('greenText');
               $("#nameSpan").text("");
            } else {
               $("#nameSpan").removeClass('greenText').addClass('redText');
               $("#nameSpan").text("이름은 2글자 이상으로 설정해 주세요.");
            }
         });
         
         $("#email").keyup(function(event){
            var email = $("#email").val();
            var check = /(\w{4,})@(\w{1,})\.(\w{1,3})/ig;
            if(check.test(email)){
               $("#emailSpan").removeClass('redText').addClass('greenText');
               $("#emailSpan").text("");
            } else {
               $("#emailSpan").removeClass('greenText').addClass('redText');
               $("#emailSpan").text("부적합한 Email 입니다. 다시 설정해 주세요!");
            }
         });
            
          $("input[type='tel']").keyup(function(event) {
             var inputVal = $(this).val();
             $(this).val(inputVal.replace(/[^0-9]/gi, ''));
          });
		
	</script>
</body>
</html>