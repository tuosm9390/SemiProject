<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
<style>
section {
	background: url("/hagong/images/backInfo.jpg") no-repeat top;
	background-size: cover;
}

#profile {
	width: 200px;
	height: 200px;
	radius: 50%;
}

td, tr {
	background: none !important;
	text-align: left !important;
}

input {
	border: 1px solid lightgray;
	border-radius: 5px;
	height: 30px;
}

input[type='checkbox'] {
	height: 15px;
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
	padding-top: 0;
	padding-bottom: 0;
	font-weight: bold;
	border: 2px solid green;
}

section button:hover {
	cursor: pointer;
	background: green;
	border: 2px solid green;
	color: white;
}

.redText {
	display: block;
	color: red;
}

.greenText {
	display: block;
	color: green;
}

.blueText {
	display: block;
	color: blue;
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
				style="border-bottom: none; border-left: none; border-right: none; border-top: 1px solid black; width: 90%;">
				<legend align="center">
					<h1 style="font-family: 'Do Hyeon'">　학생 등록　</h1>
				</legend>
				<div style="width: 100%; margin: auto auto;">
					<h5 align="center">(*) 표시는 필수 입력 항목입니다.</h5>
					<form id="enrollStudentForm" encType="multipart/form-data"
						action="<%=request.getContextPath()%>/ainsert.info" method="post">
						<table class="table" align="center">
							<tr align="center">
								<td rowspan="6">
									<div align="center">
										<img id="profile"
											src="<%=request.getContextPath()%>/images/user.png">
										<button type="button" id="addimg"
											style="height: 1.5em; margin-top: 3%;">사진 선택</button>
										<input type="file" id="imgfile" name="imgfile" onchange="loadImg(this);">
									</div>
								</td>
							</tr>
							<tr>
								<td><li>ID (*)</li></td>
								<td><input type="text" placeholder="ID 입력" id="userId" name="userId"><br>
								<input type="hidden" name="userPwd" value="0000">
								<input type="hidden" name="userType" value="student">
								<input type="hidden" name="status" value="y">
								<span id="useridSpan" class="redText"></span></td>
							</tr>
							<tr>
								<td><li>이름 (*)</li></td>
								<td><input type="text" placeholder="이름 입력" id="userName" name="userName"><br>
								<span id="usernameSpan" class="redText"></span></td>
							</tr>
							<tr>
								<td><li>생년월일 (*)</li></td>
								<td><input type="text" id="datepicker" name="birth"
									readonly></td>
							</tr>
							<tr>
								<td><li>전화번호 (*)</li></td>
								<td><input type="tel" maxlength="3" name="tel1"> -
									<input type="tel" maxlength="4" name="tel2"> - <input
									type="tel" maxlength="4" name="tel3"></td>
							</tr>
							<tr>
								<td><li>학교 / 학년 (*)</li></td>
								<td><input type="text" name="school" placeholder="학교 이름 입력"
									style="width: 120px;"> &nbsp;
								<select name="grade" style="width: 120px;">
									<option value="1" selected>중학교 1학년</option>
									<option value="2">중학교 2학년</option>
									<option value="3">중학교 3학년</option>
									<option value="4">고등학교 1학년</option>
									<option value="5">고등학교 2학년</option>
									<option value="6">고등학교 3학년</option>
								</select></td>
							</tr>
							<tr>
								<td rowspan="2" style="text-align: center !important;">
								<li>유입경로</li>
								<br>
								<select name="inflowPath" style="width: 100px;">
									<option value="FRIEND" selected>친구소개</option>
									<option value="INTERNET">인터넷</option>
									<option value="PICKET">전단지</option>
									<option value="PCARD">플래카드</option>
									<option value="ETC">기타</option>
								</select></td>
								<td><li>계열 (*)</li></td>
								<td><select name="track">
										<option value="LIB" selected>인문계</option>
										<option value="NAT">자연계</option>
										<option value="AMP">예체능</option>
										<option value="IDS">실업계</option>
										<option value="ETC">기타</option>
								</select></td>
							</tr>
							<tr>
								<td><li>학부모 아이디 (*)</li></td>
								<td><input type="hidden" id="refNo" name="refNo" value="">
								<input type="text" placeholder="학부모 아이디 입력" id="refId"name="refId"><br>
								<span id="refidSpan" class="redText"></span></td>
							</tr>
							<tr>
								<td></td>
								<td><li>학부모 이름 (*)</li></td>
								<td><input type="text" placeholder="학부모 이름 입력" id="refName"
									name="refName"><br>
									<span id="refnameSpan" class="redText"></span></td>
							</tr>
							<tr>
								<td></td>
								<td><li>학부모 전화번호 (*)</li></td>
								<td><input type="tel" maxlength="3" id="reftel1" name="reftel1">
									- <input type="tel" maxlength="4" id="reftel2" name="reftel2"> - <input
									type="tel" maxlength="4" id="reftel3" name="reftel3"></td>
							</tr>
							<tr>
								<td></td>
								<td><li>희망대학 / 학과 (*)</li></td>
								<td><input type="text" placeholder="희망 대학 입력" id="college" name="college" style="width: 110px;" value="">
									<label style="color: black;">대학교</label>&emsp;
									<input type="text" placeholder="희망 학과 입력" id="major" name="major" style="width: 110px;" value=""></td>
							</tr>
							<tr>
								<td></td>
								<td><li>주소</li></td>
								<td><input type="text" placeholder="주소 입력" name="address"
									style="width: 400px;"></td>
							</tr>
							<tr>
								<td></td>
								<td><li>이메일</li></td>
								<td><input type="email" placeholder="이메일 입력" id="email" name="email"
									style="width: 400px;"><br>
									<span id="emailSpan" class="redText"></span></td>
							</tr>
							<tr>
								<td></td>
								<td><li>개인정보 제공 및 활용 동의</li></td>
								<td>
									<div
										style="border: 1px solid lightgray; width: 600px; height: 200px; overflow: auto; background: white;">
										<pre align="left" style="color: black;">【 개인정보처리방침 】
'하공학원'은(이하 학원 이라 함) 귀하의 개인정보보호를 중요시하며, 『개인정보보호법』을 준수하고 있습니다. 학원은 개인정보처리방침을 통하여 귀하께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다. 이 개인정보처리방침의 순서는 다음과 같습니다.
----------------------------------------------------
1. 수집하는 개인정보의 항목 및 수집방법
2. 개인정보의 수집 및 이용목적
3. 개인정보의 보유 및 이용기간
4. 개인정보의 파기절차 및 그 방법
5. 개인정보 제공 및 공유
6. 수집한 개인정보의 취급위탁
7. 이용자 및 법정대리인의 권리와 그 행사방법
8. 동의철회 / 회원탈퇴 방법
9. 개인정보관리책임자
10. 개인정보의 안전성 확보조치
11. 영상정보처리기기 설치·운영에 관한 사항
12. 정책 변경에 따른 공지의무
----------------------------------------------------

1. 수집하는 개인정보의 항목 및 수집방법
학원은 회원가입 시 서비스 이용을 위해 필요한 최소한의 개인정보만을 수집합니다. 귀하가 학원의 서비스를 이용하기 위해서는 회원가입 시 필수항목과 선택항목을 입력하여야 하며, 선택항목은 입력하지 않더라도 회원에 가입할 수 있습니다.
[학원생 정보]
- 필수항목 : 성명, 생년월일, 아이디, 비밀번호, 연락처, 학교, 학년,
- 선택항목 : 계열, 희망대학, 희망학과, 주소, 이메일, 학원 등록경로
[학부형 정보]
- 필수항목 : 성명, 아이디, 비밀번호, 연락처
- 선택항목 : 생년월일, 주소, 이메일, 학원 등록경로, 학원생 아이디
※ 학원생이 14세 미만일 경우 학부형(법정대리인)의 가입이 반드시 필요합니다.
[개인정보 수집방법]
- 개인정보는 홈페이지를 통해서만 수집합니다. (단, 학원비 결제정보 등은 별도 서류로 수집하여 보관합니다.)

2. 개인정보의 수집 및 이용목적
학원은 수집한 개인정보를 다음의 목적을 위해 활용합니다. 이용자가 제공한 모든 정보는 하기 목적에 필요한 용도 이외로는 사용되지 않으며 이용 목적이 변경될 시에는 사전 동의를 구할 것입니다.
[학원생정보]
- 회원제 서비스 이용에 따른 본인확인, 입학·수강·평가·성적관리·출결관리·입시상담 등을 포함한 학원의 서비스 제공에 관한 계약 이행
[학부형 및 일반 홈페이지 회원정보]
- 서비스 제공에 따른 요금정산, 학원생 관련 상담, 학원 및 입시에 대한 정보제공

3. 개인정보의 보유 및 이용기간
학원은 개인정보의 수집목적 또는 제공받은 목적이 달성된 때에는 귀하의 개인정보를 지체 없이 파기합니다.
[학원생정보, 학부형 회원정보]
- 회원탈퇴시 또는 학원 수강 계약 파기시 까지 보유
- 계약, 대금결재, 소비자 분쟁 관련 기록 등은 관련 법률에 따라 5년간 별도로 보관합니다.
※ 관련법률 : 상법, 전자상거래등에서의 소비자보호에 관한 법률

4. 개인정보의 파기절차 및 그 방법
학원은 『개인정보의 수집 및 이용목적』이 달성된 후에는 즉시 파기합니다. 파기절차 및 방법은 다음과 같습니다.
[파기절차]
이용자가 회원가입 등을 위해 입력한 정보는 목적이 달성된 후 파기방법에 의하여 즉시 파기합니다.
[파기방법]
전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다. 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각하여 파기합니다.

5. 개인정보 제공 및 공유
학원은 귀하의 동의가 있거나 관련법령의 규정에 의한 경우를 제외하고는 어떠한 경우에도 『개인정보의 수집 및 이용목적』에서 고지한 범위를 넘어 귀하의 개인정보를 이용하거나 타인 또는 타기업 ㆍ기관에 제공하지 않습니다.

6. 수집한 개인정보의 취급위탁
학원은 서비스 이행을 위해 아래와 같이 개인정보를 위탁하고 있으며, 관계 법령에 따라 위탁계약 시 개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다. 학원의 개인정보 위탁처리 기관 및 위탁업무 내용은 아래와 같습니다.
[개인정보 보유 및 수탁업체] 테트리스
[위탁업무 내용] 학원 운영 전반 관련 전산화
[이용기간] 위탁계약 종료시까지
[위탁 개인정보 항목] 모든 수집항목

7. 이용자 및 법정대리인의 권리와 그 행사방법
만14세 미만 아동(이하 "아동"이라 함)의 회원가입과 개인정보 수집시 반드시 법정대리인의 동의를 구하고 있습니다. 법정대리인의 동의를 받기 위하여 아동으로부터 법정대리인의 성명과 연락처 등 최소한의 정보를 수집하고 있으며, 개인정보취급방침에서 규정하고 있는 방법에 따라 법정대리인의 동의를 받고 있습니다. 아동의 법정대리인은 아동의 개인정보에 대한 열람, 정정 및 삭제를 요청할 수 있습니다. 아동의 개인정보를 열람·정정, 삭제하고자 할 경우에는 회원정보수정을 클릭하여 법정대리인 확인 절차를 거치신 후 아동의 개인정보를 법정대리인이 직접 열람·정정, 삭제하거나, 개인정보보호책임자로 서면, 전화, 또는 Fax등으로 연락하시면 필요한 조치를 취합니다. 학원은 아동에 관한 정보를 제3자에게 제공하거나 공유하지 않으며, 아동으로부터 수집한 개인정보에 대하여 법정대리인이 오류의 정정을 요구하는 경우 그 오류를 정정할 때까지 해당 개인정보의 이용 및 제공을 금지합니다.

8. 동의철회 / 회원탈퇴 방법
회원가입 시 개인정보의 수집ㆍ이용 및 제공에 대해 동의하신 내용을 언제든지 철회하실 수 있습니다. 회원탈퇴는 학원 개인정보관리책임자로 서면, 전화 또는 Fax 등으로 연락하시면 지체 없이 귀하의 개인정보를 파기하는 등 필요한 조치를 하겠습니다. 단, 관련 법률에 따라 회원탈퇴 후에도 일정기간 보존하여야 하는 기록은 별도로 보관할 수 있습니다.

9. 개인정보관리책임자
귀하의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 학원은 아래와 같이 개인정보관리책임자를 두고 있습니다.
[개인정보 관리책임자]
이름 : 김진호
직위 : 하공학원 원장
전화번호 : 010-0000-7771
메일 : programmer7771@kkk.hh
귀하께서는 학원의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자로 신고하실 수 있습니다. 학원은 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다. 기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.
인분쟁조정위원회 (http://www.1336.or.kr / 1336)
정보보호마크인증위원회 (http://www.eprivacy.or.kr / (02) XXXXXXXX ~4)
대검찰청 사이버범죄수사단 (http://www.spo.go.kr / (02) 3480-3573)
경찰청 사이버테러대응센터 (http://www.ctrc.go.kr / (02) XXXXXXXX )

10. 개인정보의 안전성 확보조치
학원은 이용자의 개인정보보호를 위한 기술적 대책으로서 여러 보안장치를 마련하고 있습니다. 이용자께서 보내시는 모든 정보는 방화벽장치에 의해 보호되는 보안시스템에 안전하게 보관/관리되고 있습니다. 또한 학원은 이용자의 개인정보보호를 위한 관리적 대책으로서 이용자의 개인정보에 대한 접근 및 관리에 필요한 절차를 마련하고, 이용자의 개인정보를 취급하는 인원을 최소한으로 제한하여 지속적인 보안교육을 실시하고 있습니다. 또한 개인정보를 처리하는 시스템의 사용자를 지정하여 사용자 비밀번호를 부여하고 이를 정기적으로 갱신하겠습니다. 

11. 영상정보처리기기의 설치·운영에 관한 사항
O 설치근거 및 목적 : 개인정보보호법 제25조에 따라 범죄예방 및 시설안전 목적으로 설치
O 설치대수, 위치, 촬영범위 : 학원입구와 복도에 각 1대씩 설치되었으며 출입구와 강의실 사이의 공간을 촬영
O 관리책임자 및 영상정보처리기기 운영자 : 김진호(하공학원 원장)
O 촬영시간 : 24시간, 보관기간 : 3개월, 보관장소 : 관리실, 처리방법 : 촬영내용 자동저장
O 영상정보는 관리실에서 운영자가 모니터링
O 정보주체의 열람요구시 운영자가 관리책임자의 승인 후 정보주체만 촬영된 부분은 열람 허용 (단, 다수가 촬영되어 정보주체의 식별이 어려운 경우는 범죄수사 등 불가피한 경우에만 제공)
O 영상정보는 인터넷에 연결되지 않은 내부 전용시스템으로 관리되며 시스템 접근권한을 운영자에게만 부여하고 열람기록을 6개월 이상 보관하는 등 안전하게 관리하고 있습니다.

12. 정책 변경에 따른 공지의무
이 개인정보취급방침은 2011년 O월 OO일에 제정되었으며 법령ㆍ정책 또는 보안기술의 변경에 따라 내용의 추가ㆍ삭제 및 수정이 있을 시에는 변경되는 개인정보취급방침을 시행하기 최소 7일전에 학원 홈페이지를 통해 변경이유 및 내용 등을 공지하도록 하겠습니다.
공고일자 : 2019년 12월 20일
시행일자 : 2019년 12월 20일
                  </pre>
									</div>
									<div align="left">
										<input type="checkbox" name="accept" id="accept">
										<label id="acceptLabel" for="accept" style="color:red;">동의합니다.</label>
									</div>
								</td>
							</tr>
						</table>
					<button id="okbtn" type="button" onclick="doEnroll();"
						style="float: right; width: 80px; height: 30px; margin-left: 10px;">등록</button>
					<button id="cancelbtn"
						onclick="location.href='<%=request.getContextPath()%>/viewAcademy/mngStudent/mngInfo/studentList.jsp'"
						style="float: right; width: 80px; height: 30px;">취소</button>
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
		$("input[type='number']").keyup(function(event) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[^0-9]/gi, ''));
		});
		$("input[type='tel']").keyup(function(event) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[^0-9]/gi, ''));
		});

		//프로필이미지
		function loadImg(value) {
			if (value.files && value.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#profile").attr("src", e.target.result);
					console.log(e.target.result)
					$("#profile").css({"border-radius" : "50%"})
				};
				reader.readAsDataURL(value.files[0]);
			}
		}

		//동의버튼 클릭시 색상 변경
		$("#accept").click(function(){
			if($("#accept").prop("checked")) {
				$("#acceptLabel").css({"color":"green"});
			} else {
				$("#acceptLabel").css({"color":"red"});
			}
		});
		
		// 정규식 검사
		// 학생 아이디
		$("#userId").keyup(
				function(event) {
					var userId = $("#userId").val();
					var check = /^[a-z][a-z0-9]{4,11}$/;
					if (check.test(userId)) {
						$.ajax({
							url : "/hagong/idCheck.cm",
							type : "post",
							data : {
								userId : $("#userId").val()
							},
							success : function(data) {
								if (data === "success") {
									$("#useridSpan").removeClass('redText')
											.addClass('greenText');
									$("#useridSpan").text("사용 가능한 ID 입니다.");
								} else {
									$("#useridSpan").removeClass('greenText')
											.addClass('redText');
									$("#useridSpan").text(
											"이미 사용중인 ID 입니다. 다시 설정해 주세요!");
								}
							},
							error : function() {
							}
						});
					} else {
						$("#useridSpan").removeClass('greenText').addClass(
								'redText');
						$("#useridSpan").text("부적합한 ID 입니다. 다시 설정해 주세요!");
					}
				});

		// 학생 이름
		$("#userName").keyup(
				function(event) {
					var userName = $("#userName").val();
					var check = /[\Da-zA-Z가-힣]{2,}/;
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

		// 학부모 아이디
		$("#refId").keyup(
				function(event) {
					var refId = $("#refId").val();
					var check = /^[a-z][a-z0-9]{4,11}$/;
					if (check.test(refId)) {
						$.ajax({
							url : "/hagong/refIdCheck.cm",
							type : "post",
							async : false,
							data : {
								refId : refId
							},
							success : function(data) {
								if (data === 0) {
								//result가 0이면 아이디 없음
									$("#refidSpan").removeClass('redText').addClass('greenText');
									$("#refidSpan").text("새로 생성되는 ID입니다.");
									$("#refNo").val(data);
								//refNo가 -1이면 부모타입이 아닌 아이디가 있음
								} else if(data === -1) {
									$("#refidSpan").removeClass('greenText').addClass('redText');
									$("#refidSpan").text("중복되는 ID입니다.");
									$("#refNo").val(data);
								} else {
								//0이상이면 아이디 있음(학부모의 유저넘버 반환)
									$("#refidSpan").removeClass('redText').addClass('greenText');
									$("#refidSpan").text("존재하는 학부모 ID 입니다.");
									for(var key in data){
										$("#refNo").val(data[key].userNo);
										$("#refName").val(data[key].name);
										var tel = data[key].phone.split('-');
										$("#reftel1").val(tel[0]);
										$("#reftel2").val(tel[1]);
										$("#reftel3").val(tel[2]);
									}
								}
							},
							error : function(data) {
							}
						});
					} else {
						$("#refidSpan").removeClass('greenText').addClass(
								'redText');
						$("#refidSpan").text("부적합한 ID 입니다. 다시 설정해 주세요!");
					}
				});

		// 학부모 이름
		$("#refName").keyup(
				function(event) {
					var refName = $("#refName").val();
					var check = /[\Da-zA-Z가-힣]{2,}/;
					var check2 = /^[^0-9]+$/;
					var check3 = /[`~!@#$%^&*()_+{}\[\]\\';:",./<>?|]/;
					if (check.test(refName) && check2.test(refName)
							&& !check3.test(refName)) {
						$("#refnameSpan").removeClass('redText').addClass(
								'greenText');
						$("#refnameSpan").text("");
					} else {
						$("#refnameSpan").removeClass('greenText').addClass('redText');
						$("#refnameSpan").text("이름은 2글자 이상의 문자로 설정해 주세요.");
					}
				});

		function doEnroll() {
			if ($("#useridSpan").prop("class") === "redText") {
				alert("학생 ID를 확인해 주세요.");
				return false;
			} else if ($("#usernameSpan").prop("class") === "redText") {
				alert("학생 이름을 확인해 주세요.");
				return false;
			} else if ($("#datepicker").val() === "") {
				alert("생년월일을 확인해 주세요.");
				return false;
			} else if ($("#college").val() === ""){
				alert("희망대학을 입력해주세요.");
				return false;
			} else if ($("#major").val() === ""){
				alert("희망학과를 입력해주세요.");
				return false;
			} else if ($("#refidSpan").prop("class") === "redText"){
				alert("학부모 ID를 확인해 주세요.");
				return false;
			} else if ($("#refnameSpan").prop("class") === "redText"){
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
				$("#enrollStudentForm").submit();
			}
		};

		//개인정보약관 동의
		$("#accept").click(function() {
			if ($("#accept").prop("checked")) {
				$("#acceptLabel").css({
					"color" : "green"
				});
			} else {
				$("#acceptLabel").css({
					"color" : "red"
				});
			}
		});
	</script>
</body>
</html>