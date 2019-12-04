<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
#profile {
	width: 200px;
	height: 200px;
	radius: 50%;
}

td {
	/* background: white; */
	text-align: left !important;
}

input[type=file] {
	display: none;
	align-items: center;
}

.outArea {
	width: 90%;
	margin-left: auto;
	margin-right: auto;
}

.bottomBtn {
	display: inline-block;	
}

</style>
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
</script>
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
					<td>★ 직원 ID</td>
					<td><input type="text" name="userId" id="userId"></td>
					<td><div>중복 확인</div></td>
				</tr>
				<tr>
					<td width="200px">● 이름</td>
					<td colspan="3"><input type="text" name="userName" id="userName"></td>
				</tr>
				<tr>
					<td>● 생년월일</td>
					<td colspan="3"><input type="date" name="birth" id="birth"></td>
				</tr>
				<tr>
					<td>● 전화번호</td>
					<td colspan="3"><input type="text" maxlength="3" size="4" name="tel1"> - 
					    			<input type="text" maxlength="4" size="4" name="tel2"> - 
					    			<input type="text" maxlength="4" size="4" name="tel3"></td>
				</tr>
				<tr>
					<td>● 담당업무</td>
					<td colspan="3">
						<select name="subject">
							<option value="korea">국어</option>
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
					<td>● 주소</td>
					<td colspan="3"><input type="text" name="address" id="address"></td>
				</tr>
				<tr>
					<td></td>
					<td>● 이메일</td>
					<td colspan="2"><input type="email" name="email" id="email"></td>
				</tr>
				<tr>
					<td></td>
					<td>● 개인정보 제공<br>　및 활용 동의
					</td>
					<td colspan="2">
						<div style="width:500px; height:200px; overflow:auto; border:1px solid lightgray;">
							<pre align="left">【 개인정보처리방침 】
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
[선생님]
- 필수항목 : 성명, 생년월일, 아이디, 비밀번호, 연락처, 담당업무, 급여계약서
- 선택항목 : 주소, 이메일, 경력 등 기타 서류
※ 교육청 제출을 위한 주민등록번호 등 자료는 별도로 작성하여 교육청에 제출하며 선생님의 자격을 증명하기 위한 서류 등은 인사서류와 함께 별도 보관합니다.
[개인정보 수집방법]
- 개인정보는 홈페이지를 통해서만 수집합니다. (단, 선생님 인사정보 등은 별도 서류로 수집하여 보관합니다.)

2. 개인정보의 수집 및 이용목적
학원은 수집한 개인정보를 다음의 목적을 위해 활용합니다. 이용자가 제공한 모든 정보는 하기 목적에 필요한 용도 이외로는 사용되지 않으며 이용 목적이 변경될 시에는 사전 동의를 구할 것입니다.
[선생님 정보]
- 본인확인, 학원생에 대한 선생님 정보 안내, 학원운영

3. 개인정보의 보유 및 이용기간
학원은 개인정보의 수집목적 또는 제공받은 목적이 달성된 때에는 귀하의 개인정보를 지체 없이 파기합니다.
[선생님 정보]
- 선생님 정보는 퇴사 후 즉시 온라인상에서 삭제하며 경력 증명 용도로 10년간 별도 보관합니다.

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
시행일자 : 2019년 12월 20일</pre>
						</div>
						<div align="right"><input type="checkbox" name="accept" id="accept"><label for="accept"> 동의합니다.</label></div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td>● 급여 계약서 </td>
					<td colspan="2"><button id="payBtn">파일 선택</button><input type="file" id="payFile"></td>
				</tr>
				<tr>
					<td></td>
					<td>● 경력 등 기타 서류</td>
					<td colspan="2"><button id="docBtn">파일 선택</button><input type="file" id="docFile"></td>
				</tr>
			</table>		
			</form>
			
			<div class="btnArea" align="right">
				<button class="bottomBtn">등록</button>
				<button class="bottomBtn">취소</button>
			</div> <!-- btnArea end -->
		</div> <!-- outArea end -->
		
	</section>
	<footer>
	</footer>
</body>
</html> 