<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
<style>
.wrap {
	margin: auto auto;
	width: 100%;
	padding: 30px;
	padding-top: 5px;
}

.accordion {
	display: block;
	position: relative;
	width: 100%;
}

.accordion__item {
	display: block;
	width: 100%;
	margin-bottom: 15px;
}

.accordion__item:last-child {
	margin-bottom: 0;
}

.accordion__title {
	width: 100%;
	display: block;
	position: relative;
	height: 40px;
	line-height: 40px;
	padding: 0px 50px 0 20px;
	font-size: .875em;
	font-weight: 500;
	color: #333;
	border-bottom: 1px solid #eee;
	overflow: hidden;
	transition: background-color .2s;
	text-decoration: none;
	display: block;
}

.accordion__title:hover {
	background-color: #fafafa;
}

.accordion__title.active {
	background: #31bc86;
	color: white;
}

.accordion__title.active .x7 {
	transform: rotate(-90deg);
}

.accordion__title.active .btop {
	width: 67%;
	top: 2px;
	transform: translateY(-50%) rotate(-45deg);
	transform-origin: 50% 50%;
}

.accordion__title.active .bmid {
	opacity: 0;
}

.accordion__title.active .bbot {
	width: 67%;
	bottom: 2px;
	transform: translateY(50%) rotate(45deg);
	transform-origin: 50% 50%;
}

.accordion__content {
	display: none;
	position: relative;
	overflow: hidden;
	border: 1px solid #eee;
	border-top: none;
	line-height: 1.65;
	background-color: #fff;
	font-size: .875em;
}

.bmenu {
	position: absolute;
	font-size: 20px;
	width: 26px;
	height: 16px;
	display: block;
	right: 15px;
	top: 1px;
}

.btnmenu {
	float:right;
	font-size: 12px;
	width: 350px;
	height: 30px;
	display: inline;
	margin-top:0.5%;
}

.outArea {
	width: 90%;
	margin: auto auto;
}

.btnArea {
	width: 90%;
	margin-left:6.5%;
}

.month {
	display: inline;
}

.selectMonth {
	border: none;
	font-size: 30px;
	height: 50px;
}

.nextBtn {
	border:none;
	color:green;
}

.nextBtn:focus, .nextBtn:hover {
	border:none;
	background: white;
	color:red;
}

.actionBtn {
	font-size: 15px;
	display: inline;
	width: 100px;
	height: 25px;
}

.viewDetailBtn:hover {
	cursor: pointer;
}

/* 모달 배경 */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* 모달 내부 상자 */
.modal-content {
	background-color: #fefefe;
	margin: 5% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	background-color: #fefefe;
	border-radius: 10px;
	/* Could be more or less, depending on screen size */
}
.refundModal {
	width: 60%;
}
.detailModal {
	width: 40%;
}
/* 모달 닫기 버튼 */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}
.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

table, th, td {
	border: 1px solid lightgray;
	padding-top: 5px;
	padding-bottom: 5px;
}

fieldset {
	width: 16%;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../../common/menubar.jsp"%>
	</header>
	<section>
		<div align="center">
	      <fieldset style="margin-top:-25px; margin-bottom:-15px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;">
	         <legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">　수납 내역　</h1></legend>
	      </fieldset>
	    </div>
		<div class="outArea">
		
			<!-- 년/월 선택 부분 -->
			<div align="center" class="monthArea">
				<button class="month nextBtn">◀</button>&nbsp;
				<select class="month selectMonth">
					<option>2019</option>
				</select> <label style="font-size:20px">년</label>
				<select class="month selectMonth">
					<% for(int i = 1; i < 13; i++) { %>
						<% if(i < 10) { %>
						<option>0<%= i %></option>
						<% } else { %>
						<option><%= i %></option>
						<% } %>
					<% } %>
				</select> <label style="font-size:20px">월</label>&nbsp;
				<button class="month nextBtn">▶</button>
			</div> <!-- monthArea end -->
			
			<!-- 환불규정 확인 버튼 / 미납자 모아보기 버튼 -->
			<div class="btnArea">
				<div style="float:left;"><button id="refundRuleBtn">환불규정 확인</button></div>
				<div style="float:right;"><button>미납자 모아보기</button></div>
			</div> <!-- btnArea end -->
			<br><br><hr width="90%" style="margin-right:40px;">
			
			<!-- 환불규정 모달 -->
			<div id="refundRule" class="modal">
				<div class="modal-content refundModal" align="center">
					<span class="close">&times;</span>
					<h2 style="margin-left:35px;">교습비등 반환기준</h2>
					<p>공정거래위원회 고시 제2019-3호, 2019.4.3.발령·시행</p>
					<table style="width:90%">
						<tr>
							<th colspan="2" width="50%">수강료 반환원인</th>
							<th width="50%">수강료 반환기준</th>
						</tr>
						<tr>
							<td rowspan="3" width="25%">사업자의 부당행위 후<br>수강자가 즉시 계약해제를 요구한 경우</td>
							<td width="25%">허위·과장광고에 의한<br>수강계약의 체결</td>
							<td width="50%">계약 해제 및 수강료 전액환급</td>
						</tr>
						<tr>
							<td>정원을 초과한 수강생<br>모집 및 교습</td>
							<td>계약 해제 및 수강료 전액환급</td>
						</tr>
						<tr>
							<td>무자격 또는 자격미달<br>강사에 의한 교습</td>
							<td>계약 해제 및 수강료 전액환급</td>
						</tr>
						<tr>
							<td colspan="2">사업자의 부당행위 후 수강자가 계속 수강하다가<br>계약 해제를 요구한 경우</td>
							<td>남은 기간에 대해 일할 계산해 수강료 환급</td>
						</tr>
						<tr>
							<td colspan="2">수강기간 도중 학원 인가 또는 등록 취소,<br>일정기간 교습정지 등 행정처분이나 학원의 이전, 폐강,<br>그 밖에 사업자의 사정으로 인한 수강불능의 경우</td>
							<td>남은 기간에 대해 일할 계산해 수강료 환급<br>(사유발생일로부터 5일 내)</td>
						</tr>
						<tr>
							<td colspan="2">교습개시 전 수강자의 귀책사유로<br>계약을 해제하는 경우</td>
							<td>기 납부한 수강료 전액 환급</td>
						</tr>
						<tr>
							<td rowspan="3">계약한 수강 개월이<br>1개월 이내인 경우<br>(수강자 귀책사유 해지 시)</td>
							<td>총 교습시간의 1/3 경과 전</td>
							<td>수강료의 2/3 해당액 환급</td>
						</tr>
						<tr>
							<td>총 교습시간의 1/2 경과 전</td>
							<td>수강료의 1/2 해당액 환급</td>
						</tr>
						<tr>
							<td>총 교습시간의 1/2 경과 후</td>
							<td>환급하지 않음</td>
						</tr>
						<tr>
							<td colspan="2">계약 수강 기간이 1개월 초과하는 경우<br>(교습개시 이후 수강자의 귀책사유로 해지 시)</td>
							<td>반환사유가 발생한 월의 환급액 (수강료 징수기간이<br>1개월 이내인 경우에 따라 산출된 수강료)와<br>나머지 월의 수강료 전액을 합산한 금액</td>
						</tr>
					</table>
					<br>
				</div>
			</div> <!-- refundRule end -->
			
			<!-- 과목별 수납내역 아코디언 영역 (내용 영역) -->
			<div class="wrap">
				<ul class="accordion">
					<% for(int j = 0; j < 10; j++) { %>
					<li class="accordion__item">
						<div class="accordion__title" href="javascript:void(0)">
							<label style="margin-left:10px">김진호의 국어 교실</label>
							<div class="bmenu">▼</div>
						</div>
						<div class="accordion__content">
							<div class="btnmenu">
								<button class="actionBtn" id="doComplete">수납 처리</button>
								<button class="actionBtn" id="giveBill">고지서 발급</button>
								<button class="actionBtn" id="giveRecipt">영수증 발급</button>
							</div>
							<div class="tableArea">
								<table class="table" style="width:100%; float:left;">
									<tr>
										<th><input type="checkbox" class="selectAll"><label for="selectAll">전체선택</label></th>
										<th>학생 이름</th>
										<th>학생 ID</th>
										<th>청구 금액</th>
										<th>납부 여부</th>
										<th>상세</th>
									</tr>
									<% for(int k = 0; k < 10; k++) { %>
									<tr>
										<td><input type="checkbox" class="selectOne"></td>
										<td>남윤진</td>
										<td>NYJ970708</td>
										<td>300,000원</td>
										<td>미납</td>
										<td><label style="border-bottom:1px solid lightgray;" class="viewDetailBtn">상세보기</label></td>
									</tr>
									<% } %>
								</table>
							</div> <!-- tableArea -->
						</div>
					
					<br>
					<% } %>					
				</ul>
			</div> <!-- wrap end -->
			
			<!-- 상세보기 모달 -->
			<div id="viewDetail" class="modal">
				
				<!-- 상세보기 조회  -->
				<div id="detailView" class="modal-content detailModal" align="center">
					<span class="close">&times;</span>
					<h2 style="margin-left:35px;">[ 남윤진 ] 학생<br>2019.10. 납부 상세 </h2>
					<table style="width:90%">
						<tr>
							<td width="40%" style="font-weight:bold;">수강 강좌</td>
							<td>고3 수학 단과</td>
						</tr>
						<tr>
							<td style="font-weight:bold;">강좌 비용</td>
							<td>300,000 원</td>
						</tr>
						<tr>
							<td style="font-weight:bold;">납부 고지일</td>
							<td>2019.10.01.</td>
						</tr>
						<tr>
							<td style="font-weight:bold;">상태</td>
							<td>완납 후 환불</td>
						</tr>
						<tr>
							<td style="font-weight:bold;">특이사항</td>
							<td>2019.10.15. 퇴원으로 인한 환불</td>
						</tr>
					</table> <br>
					<table style="width:90%">
						<tr>
							<td width="40%" style="font-weight:bold;">청구 금액</td>
							<td>300,000 원</td>
						</tr>
						<tr>
							<td style="font-weight:bold;">수납 금액</td>
							<td>300,000 원</td>
						</tr>
						<tr>
							<td style="font-weight:bold;">환불 시점</td>
							<td>수업 시작 1/2 경과 전</td>
						</tr>
						<tr>
							<td style="font-weight:bold;">환불 금액</td>
							<td>150,000 원</td>
						</tr>
						<tr>
							<td style="font-weight:bold;">차액 (수납 금액 - 환불 금액)</td>
							<td>150,000 원</td>
						</tr>
					</table>
					<br>
					<button id="modifyDetailBtn">수정</button>
				</div>
				
				<!-- 상세보기 수정 -->
				<div id="detailModify" class="modal-content detailModal" align="center">
					<span class="close">&times;</span>
					<h2 style="margin-left:35px;">[ 남윤진 ] 학생<br>2019.10. 납부 상세 </h2>
					<table style="width:90%">
						<tr>
							<td width="40%" style="font-weight:bold;">수강 강좌</td>
							<td>고3 수학 단과</td>
						</tr>
						<tr>
							<td style="font-weight:bold;">강좌 비용</td>
							<td>300,000 원</td>
						</tr>
						<tr>
							<td style="font-weight:bold;">납부 고지일</td>
							<td>2019.10.01.</td>
						</tr>
						<tr>
							<td style="font-weight:bold;">상태</td>
							<td>완납 후 환불</td>
						</tr>
						<tr>
							<td style="font-weight:bold;">특이사항</td>
							<td>
								<select id="note">
									<option>특이사항 선택</option>
									<option value="student">학생 퇴원</option>
									<option value="coupon">쿠폰 사용</option>
									<option value="academy">학원 귀책</option>
								</select>
								
								<div id="studentArea">
									<br><label>퇴원일 선택</label><input type="date">
								</div>
								
								<div id="couponArea">
									<br><label>사용한 쿠폰</label>
									<input type="text" value="수학 강의 만족도 조사 참여 [10% 할인]" readonly>
								</div>
								
								<div id="academyArea" style="display:inline;">
									&nbsp; &nbsp; <label>환불 일수</label>
									<input type="number" max="31" min="1" value="환불일수">
								</div>
							</td>
						</tr>
						<tr>
							<td style="font-weight:bold;">수납 금액</td>
							<td><input type="number" placeholder="300000" style="width:100px;">원</td>
						</tr>
					</table>
					<br>
					<button id="modifyDoneBtn">수정 완료</button>
					<br>
				</div>
				
			</div> <!-- viewDetail end -->
			
		<script>
			$(function() {
				//아코디언 스크립트
				$('.accordion').find('.accordion__title').click(function() {
					// Adds active class
					$(this).toggleClass('active');
					// Expand or collapse this panel
					$(this).next().slideToggle('fast');
					// Removes active class from other titles
					$('.accordion__title').not($(this)).removeClass('active');
				});
				
				//전체선택 버튼 스크립트
				$(".selectAll").change(function(){
					if($(this).prop("checked")) {
						$(".selectOne").prop("checked", true);
					} else {
						$(".selectOne").prop("checked", false);
					}
				});
				
				// 모달페이지
				var refundRule = document.getElementById("refundRule");
				var viewDetail = document.getElementById("viewDetail");
				// 모달 실행 버튼
				var refundRuleBtn = document.getElementById("refundRuleBtn");
				// 모달 닫기 버튼
				var close = document.getElementsByClassName("close");
				// 모달 실행
				refundRuleBtn.onclick = function() {
					refundRule.style.display = "block";
				}
				$(".viewDetailBtn").each(function(){
					$(this).click(function(){
						viewDetail.style.display = "block";
					});
				});
				// x버튼 클릭 시 종료
				$(".close").each(function(){
					$(this).click(function(){
						refundRule.style.display = "none";
						viewDetail.style.display = "none";
					});
				});
				
				$("#doComplete").click(function(){
					window.confirm("선택한 학생들의 수납을 완납 처리하시겠습니까?");
					window.confirm("선택한 학생들에게 영수증을 발송하시겠습니까?");
				});
				
				$("#giveBill").click(function(){
					window.confirm("선택한 학생들에게 고지서를 발송하시겠습니까?");
				});
				
				$("#giveRecipt").click(function(){
					window.confirm("선택한 학생들에게 영수증을 발송하시겠습니까?");
				});
				
				$("#detailModify").hide();
				$("#modifyDetailBtn").click(function(){
					$("#detailView").hide();
					$("#detailModify").show();
				});
				$("#modifyDoneBtn").click(function(){
					if(window.confirm("수정을 완료하시겠습니까?")) {
						$("#detailView").show();
						$("#detailModify").hide();
					}
				});
				
				$("#studentArea").hide(); $("#couponArea").hide(); $("#academyArea").hide();
				$("#note").change(function(){
					switch($(this).val()) {
					case 'student' : $("#studentArea").show(); $("#couponArea").hide(); $("#academyArea").hide(); break;
					case 'coupon' : $("#studentArea").hide(); $("#couponArea").show(); $("#academyArea").hide(); break;
					case 'academy' : $("#studentArea").hide(); $("#couponArea").hide(); $("#academyArea").show(); break;
					}
				});
				
			});
			
		</script>
		</div> <!-- outArea end -->
	</section>
	<footer>
	</footer>
</body>
</html>