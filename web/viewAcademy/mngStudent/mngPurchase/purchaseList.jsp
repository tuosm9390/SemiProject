<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, hagong.academy.mngStudent.mngPurchase.model.vo.*"%>
<%
	SelectDate selectDate = (SelectDate) request.getAttribute("selectDate");
	ArrayList<SelectClass> clsList = (ArrayList<SelectClass>) request.getAttribute("selectClass");
	ArrayList<Purchase> purList = (ArrayList<Purchase>) request.getAttribute("purList");
	
	for(int i = 0; i < purList.size(); i++) {
		if(purList.get(i).getPayStatus().equals("N")) {
			purList.get(i).setPayStatus("미납");
		} else {
			purList.get(i).setPayStatus("완납");
		}
	}
%>
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
	color: white;
	border-bottom: 1px solid #eee;
	overflow: hidden;
	transition: background-color .2s;
	text-decoration: none;
	display: block;
	background:green;
	opacity:50%;
	border-radius:10px;
}

.accordion__title:hover {
	background-color: coral;
	opacity:100%;
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
	width: 250px;
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
	background: none;
}

.nextBtn:focus, .nextBtn:hover {
	border:none;
	background: none;
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
	text-align: center;
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
	      <fieldset style="margin-bottom:-15px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;">
	         <legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">　수납 내역　</h1></legend>
	      </fieldset>
	    </div>
		<div class="outArea">
		
			<!-- 년/월 선택 부분 -->
			<div align="center" class="monthArea">
				<% if(selectDate.getSelectYear() == selectDate.getStartYear() && selectDate.getSelectMonth() == selectDate.getStartMonth()) {
				   } else { %>
					<button id="viewPreBtn" class="month nextBtn">◀</button>&nbsp;
				<% } %>
				<select id="selectYear" class="month selectMonth" onchange="changeDate();">
					<% for(int i = selectDate.getStartYear(); i <= selectDate.getEndYear(); i++) { %>
					<% if(i == selectDate.getSelectYear()) { %>
					<option selected><%= i %></option>
					<% } else { %>
					<option><%= i %></option>
					<% } } %>
				</select> <label style="font-size:20px">년</label>
				<select id="selectMonth" class="month selectMonth" onchange="changeDate();">
					<% if(selectDate.getStartYear() == selectDate.getEndYear()) { %>
						<% for(int i = selectDate.getStartMonth(); i <= selectDate.getEndMonth(); i++) { %>
							<% if(i == selectDate.getSelectMonth()) { %>
							<option selected><%= i %></option>
							<% } else { %>
							<option><%= i %></option>
							<% } %>
						<% } %>
					<% } else { %>
						<% for(int i = 1; i < 13; i++) { %>
							<% if(i == selectDate.getSelectMonth()) { %>
							<option selected><%= i %></option>
							<% } else { %>
							<option><%= i %></option>
							<% } %>
						<% } %>
					<% } %>
				</select> <label style="font-size:20px">월</label>&nbsp;
				<% if(selectDate.getSelectYear() == selectDate.getEndYear() && selectDate.getSelectMonth() == selectDate.getEndMonth()) {
				   } else { %>
					<button id="viewAftBtn" class="month nextBtn">▶</button>
				<% } %>
			</div> <!-- monthArea end -->
			
			<!-- 환불규정 확인 버튼 / 미납자 모아보기 버튼 -->
			<div class="btnArea">
				<div style="float:left;"><button id="refundRuleBtn">환불규정 확인</button></div>
				<div style="float:right;"><button id="nonePayPeople">미납자 필터링</button><button id="allPeople">전체 내역</button></div>
			</div> <!-- btnArea end -->
			<br><br><hr width="90%" style="margin-right:40px;">
			
			<!-- 환불규정 모달 -->
			<div id="refundRule" class="modal">
				<div class="modal-content refundModal" align="center">
					<span class="close">&times;</span>
					<h2 style="margin-left:35px; font-style:italic;">◎ 교습비등 반환기준 ◎</h2>
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
					<% for(int j = 0; j < clsList.size(); j++) { %>
					<li class="accordion__item">
						<div class="accordion__title" href="javascript:void(0)">
							<label style="margin-left:10px"><%= clsList.get(j).getClassName() %></label>
							<div class="bmenu">▼</div>
						</div>
						<div class="accordion__content">
							<div class="btnmenu">
								<button class="actionBtn" id="doComplete" onclick="donePay(<%= j %>);">수납 처리</button>
								<%-- <button class="actionBtn" id="giveBill" onclick="sendBill(<%= j %>);">고지서 발급</button> --%>
								<button class="actionBtn" id="giveRecipt" onclick="sendRecipt(<%= j %>);">영수증 발급</button>
							</div>
							<div class="tableArea">
								<table class="table" style="width:100%; float:left;">
									<tr>
										<th width="8%"><input type="checkbox" class="selectAll" id="selectAll<%= j %>" onchange="selectAllCk(<%= j %>);"><label for="selectAll<%= j %>">전체선택</label></th>
										<th width="24%">학생 ID</th>
										<th width="20%">학생 이름</th>
										<th width="20%">청구 금액</th>
										<th wdith="8%">납부 여부</th>
										<th width="20%"">상세</th>
									</tr>
									<% for(int k = 0; k < purList.size(); k++) { %>
										<% if(purList.get(k).getClassNo() == clsList.get(j).getClassNo()) { %>
										<tr>
											<td><input type="checkbox" class="selectOne selectOne<%= j %>" onchange="selectOneCk(this, <%= j %>);" value="<%= purList.get(k).getPurchaseNo() %>"></td>
											<td><%= purList.get(k).getStuId() %></td>
											<td><%= purList.get(k).getStuName() %></td>
											<td><%= purList.get(k).getRealPrice() %></td>
											<td><%= purList.get(k).getPayStatus() %></td>
											<td><label id="callDetail<%= purList.get(k).getPurchaseNo() %>" onclick="showDetail(<%= purList.get(k).getPurchaseNo() %>);" style="border-bottom:1px solid lightgray;" class="viewDetailBtn">상세보기</label></td>
										</tr>
									<% } } %>
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
					<h2 style="margin-left:35px; font-style:italic" id="detailTitle1"></h2>
					<h2 style="margin-left:35px; font-style:italic" id="detailTitle2"></h2>
					<table style="width:90%">
						<tr>
							<td width="40%" style="font-weight:bold;">수강 강좌</td>
							<td id="clsName"></td>
						</tr>
						<tr>
							<td style="font-weight:bold;">강좌 비용</td>
							<td id="tuition"></td>
						</tr>
						<tr>
							<td style="font-weight:bold;">납부 고지일</td>
							<td id="notifyDay"></td>
						</tr>
						<tr>
							<td style="font-weight:bold;">상태</td>
							<td id="detailStatus"></td>
						</tr>
						<tr>
							<td style="font-weight:bold;">특이사항</td>
							<td id="payMemo"></td>
						</tr>
					</table> <br>
					<table style="width:90%">
						<tr>
							<td width="40%" style="font-weight:bold;">청구 금액</td>
							<td id="realPrice"></td>
						</tr>
						<tr>
							<td style="font-weight:bold;">수납 금액</td>
							<td id="payPrice"></td>
						</tr>
						<tr>
							<td style="font-weight:bold;">환불 시점</td>
							<td id="refundPoint"></td>
						</tr>
						<tr>
							<td style="font-weight:bold;">환불 금액</td>
							<td id="refundPrice"></td>
						</tr>
						<tr>
							<td style="font-weight:bold;">차액 (수납 금액 - 환불 금액)</td>
							<td id="profit"></td>
						</tr>
					</table>
					<br>
					<input type="hidden" id="purNoForModify" value="">
					<button onclick="modifyDetail();" style="font-size:18px; width:100px;">수정</button>
				</div>
				
				<!-- 상세보기 수정 -->
				<div id="detailModify" class="modal-content detailModal" align="center">
					<span class="close">&times;</span>
					<h2 style="margin-left:35px; font-style:italic" id="modifyTitle1"></h2>
					<h2 style="margin-left:35px; font-style:italic" id="modifyTitle2"></h2>
					<table style="width:90%">
						<tr>
							<td width="40%" style="font-weight:bold;">수강 강좌</td>
							<td id="clsname"></td>
						</tr>
						<tr>
							<td style="font-weight:bold;">강좌 비용</td>
							<td id="clsprice"></td>
						</tr>
						<tr>
							<td style="font-weight:bold;">납부 고지일</td>
							<td id="notifyday"></td>
						</tr>
						<tr>
							<td style="font-weight:bold;">상태</td>
							<td id="detailstatus"></td>
						</tr>
						<tr>
							<td style="font-weight:bold;">특이사항</td>
							<td>
								<select id="note" name="payMemo">
									<option value="none" hidden>특이사항 선택</option>
									<option value="student">고객 환불</option>
									<option value="coupon" disabled>쿠폰 사용</option>
									<option value="academy">학원 귀책</option>
								</select>
								
								<div id="studentArea">
									<br><label>환불일 선택</label><input id="rfdDay" name="rfdDay" type="date" value="">
								</div>
								
								<div id="couponArea">
									<br><label>사용한 쿠폰</label>
									<input id="beneName" type="text" value="" readonly style="width:70%">
								</div>
								
								<div id="academyArea" style="display:inline;">
									<br><br> <label>환불 일수</label>
									<input id="faultDays" name="faultDays" value="" type="number" min="1" style="width:50px;"><label>일</label>
								</div>
							</td>
						</tr>
						<tr>
							<td style="font-weight:bold;">수납 금액</td>
							<td><input id="payprice" name="payPrice" type="number" min="0" placeholder="" style="width:100px;">원</td>
						</tr>
					</table>
					<br>
					<button id="modifyDoneBtn" style="font-size:18px; width:100px;">완료</button>
					<br>
				</div>
				
			</div> <!-- viewDetail end -->
			
		<script>
			$(function() {
				//개월 이동 버튼
				$("#viewPreBtn").click(function(){
					var year = $("#selectYear").val();
					var month = $("#selectMonth").val();
					if(month == '01') {
						year = Number(year);
						month = Number(month);
						location.href = "<%=request.getContextPath() %>/alist.pur?year=" + (year - 1) + "&month=" + 12;
					} else {
						year = Number(year);
						month = Number(month);
						location.href = "<%=request.getContextPath() %>/alist.pur?year=" + year + "&month=" + (month - 1);
					}
				});
				
				$("#viewAftBtn").click(function(){
					var year = $("#selectYear").val();
					var month = $("#selectMonth").val();
					if(month == '12') {
						year = Number(year);
						month = Number(month);
						location.href = "<%=request.getContextPath() %>/alist.pur?year=" + (year + 1) + "&month=" + 01;
					} else {
						year = Number(year);
						month = Number(month);
						location.href = "<%=request.getContextPath() %>/alist.pur?year=" + year + "&month=" + (month + 1);
					}
				});
				
				//아코디언 스크립트
				$('.accordion').find('.accordion__title').click(function() {
					// Expand or collapse this panel
					$(this).next().slideToggle('fast');
					// Removes active class from other titles
					$('.accordion__title').not($(this)).removeClass('active');
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
						$("#detailView").show();
						$("#detailModify").hide();
					});
				});
				
				$("#detailModify").hide();
				
				$("#studentArea").hide(); $("#couponArea").hide(); $("#academyArea").hide();
				$("#note").change(function(){
					switch($(this).val()) {
					case 'student' : $("#studentArea").show(); $("#couponArea").hide(); $("#academyArea").hide(); break;
					case 'coupon' : $("#studentArea").hide(); $("#couponArea").show(); $("#academyArea").hide(); break;
					case 'academy' : $("#studentArea").hide(); $("#couponArea").hide(); $("#academyArea").show(); break;
					}
				});
				
				//전체 내역보기 버튼 숨기기
				$("#allPeople").css("display", "none");
				
				//미납자 모아보기 스크립트
				$("#nonePayPeople").click(function(){
					$(this).css("display", "none"); $("#allPeople").css("display", "block");
					$("td").each(function(){
						if($(this).text() == "완납") {
							$(this).parent().hide();
						}
					});
				});
				
				//전체 내역보기 스크립트
				$("#allPeople").click(function(){
					$(this).css("display", "none"); $("#nonePayPeople").css("display", "block");
					$("td").parent().show();
				});
				
				//상세보기 수정완료 스크립트
				$("#modifyDoneBtn").click(function(){
					var num = $("#purNoForModify").val();
					var paymemo = $("#note").val();
					var payDetail;
					var payPrice = $("#payprice").val();
					if(paymemo == "student") {
						payDetail = $("#rfdDay").val();
					} else if(paymemo == "academy") {
						payDetail = $("#faultDays").val();
					}
					
					if(paymemo == "none" || paymemo == "coupon") {
						$("#detailModify").hide();
						$("#detailView").show();
						$("callDetail").click();
					} else {
						if(window.confirm("수정을 완료하시겠습니까?")) {
							$.ajax({
								url:"aupdate.pur",
								data:{ selectNos:num,
									   payMemo:paymemo,
									   payDetail:payDetail,
									   payPrice:payPrice
									 },
								type:"post",
								success:function(data){
									if(data == "fail") {
										alert("수납 상세 수정에 실패하였습니다.");
										$("#detailModify").hide();
										$("#detailView").show();
										$("#callDetail" + num).click();
									} else {
										alert("수납 상세 수정에 성공하였습니다.");
										$("#detailModify").hide();
										$("#detailView").show();
										$("#callDetail" + num).click();
									}
								},
								error:function(error, status){
									alert("SYSTEM ERROR!")
								}
							});
						}
					}
				});
				
			});
			
			function changeDate(){
				var year = $("#selectYear").val();
				var month = $("#selectMonth").val();
				location.href = "<%=request.getContextPath() %>/alist.pur?year=" + year + "&month=" + month;
			}
			
			//전체선택 버튼 스크립트
			function selectAllCk(num) {
				var check = $("#selectAll" + num).prop("checked");
				if(check) {
					$(".selectOne"+ num).prop("checked", true);
				} else {
					$(".selectOne"+ num).prop("checked", false);
				}
			}
			
			//전체선택 해제 버튼 스트립트
			function selectOneCk(value, num) {
				var check = $(value).prop("checked");
				if(!check) {
					$("#selectAll" + num).prop("checked", false);
				}
			}
			
			//일괄 수납처리
			function donePay(num) {
				var payNos = "";
				var checkPay = window.confirm("선택한 학생들의 수납을 완납 처리하시겠습니까?");
				
				if(checkPay) {
					$(".selectOne" + num).each(function(){
						if($(this).prop("checked")) {
							if(payNos == "") {
								payNos = $(this).val();
							} else {
								payNos += "," + $(this).val();
							}
						}
					});
					
					$.ajax({
						url:"aupdateAll.pur",
						data:{type:"donePay", selectNos:payNos},
						type:"post",
						success:function(data){
							if(data == "success") {
								alert("일괄 수납처리 되었습니다.");
								var payNosArr = payNos.split(",");
								for(var i = 0; i < payNosArr.length; i++) {
									$("input[value=" + payNosArr[i] + "]").prop("checked", false);
									$("input[value=" + payNosArr[i] + "]").parent().parent().children().eq(4).text("완납");
								}
							} else {
								alert("일괄 수납처리에 실패하였습니다.");
							}
						},
						error:function(error, status){
							alert("SYSTEM ERROR!")
						}
					});
				}				
			}
			
			//일괄 고지서 발급처리
			function sendBill(num) {
				var payNos = "";
				var check = window.confirm("선택한 학생들에게 고지서를 발송하시겠습니까?");
				
				if(check) {
					$(".selectOne" + num).each(function(){
						if($(this).prop("checked")) {
							if(payNos == "") {
								payNos = $(this).val();
							} else {
								payNos += "," + $(this).val();
							}
						}
					});
					
					$.ajax({
						url:"aupdateAll.pur",
						data:{type:"sendBill", selectNos:payNos},
						type:"post",
						success:function(data){
							if(data == "success") {
								alert("고지서가 발송되었습니다.");
								var payNosArr = payNos.split(",");
								for(var i = 0; i < payNosArr.length; i++) {
									$("input[value=" + payNosArr[i] + "]").prop("checked", false);
								}
							} else {
								alert("고지서 발송이 실패하였습니다.");
							}
						},
						error:function(error, status){
							alert("SYSTEM ERROR!")
						}
					});
				}				
			}
			
			//일괄 영수증 발급처리
			function sendRecipt(num) {
				var payNos = "";
				var check = window.confirm("선택한 학생들에게 영수증을 발송하시겠습니까?");
				
				if(check) {
					$(".selectOne" + num).each(function(){
						if($(this).prop("checked")) {
							if(payNos == "") {
								payNos = $(this).val();
							} else {
								payNos += "," + $(this).val();
							}
						}
					});
					
					$.ajax({
						url:"aupdateAll.pur",
						data:{type:"sendRecipt", selectNos:payNos},
						type:"post",
						success:function(data){
							if(data == "success") {
								alert("영수증이 발송되었습니다.");
								var payNosArr = payNos.split(",");
								for(var i = 0; i < payNosArr.length; i++) {
									$("input[value=" + payNosArr[i] + "]").prop("checked", false);
								}
							} else {
								alert("영수증 발송이 실패하였습니다.");
							}
						},
						error:function(error, status){
							alert("SYSTEM ERROR!")
						}
					});
				}				
			}
			
			//상세보기
			function showDetail(num) {
				$.ajax({
					url:"adetail.pur",
					data:{purchaseNo:num},
					type:"post",
					success:function(data){
						if(data == "fail") {
							alert("수납 상세조회에 실패하였습니다.");
							document.getElementById("viewDetail").style.display = "none";
						} else {
							$("#detailTitle1").text("[ " + data.stuName + "] 학생");
							$("#detailTitle2").text("<%= selectDate.getSelectYear()%>.<%= selectDate.getSelectMonth()%>. 납부 상세");
							$("#clsName").text(data.className);
							$("#tuition").text(data.classPrice + " 원");
							$("#notifyDay").text(data.strNotifyDate);
							$("#detailStatus").text(data.detailStatus);
							
							if(data.payMemo == "NONE") {
								$("#payMemo").text("-");
							} else if(data.payMemo == "REFUND") {
								$("#payMemo").text(data.strRefundDay + " 환불처리")
							} else if(data.payMemo == "BENEFIT") {
								$("#payMemo").text("쿠폰 혜택 사용")
							}
							
							$("#realPrice").text(data.realPrice + " 원");
							$("#payPrice").text(data.payPrice + " 원");
							
							if(data.refundRate == 0 && data.faultDays == 0) {
								$("#refundPoint").parent().hide();
								$("#refundPrice").parent().hide();
								$("#profit").parent().hide();
							} else if(data.refundRate == 1/2 && data.faultDays == 0) {
								$("#refundPoint").parent().show();
								$("#refundPrice").parent().show();
								$("#profit").parent().show();
								$("#refundPoint").text("수업 시작 1/2 경과 전");
								$("#refundPrice").text(data.refundPrice + " 원");
								$("#profit").text(data.profit + " 원");
							} else if(data.refundRate == 2/3 && data.faultDays == 0) {
								$("#refundPoint").parent().show();
								$("#refundPrice").parent().show();
								$("#profit").parent().show();
								$("#refundPoint").text("수업 시작 1/3 경과 전");
								$("#refundPrice").text(data.refundPrice + " 원");
								$("#profit").text(data.profit + " 원");
							} else {
								$("#refundPoint").parent().show();
								$("#refundPrice").parent().show();
								$("#profit").parent().show();
								$("#refundPoint").text("학원귀책 " + data.faultDays + " 회분");
								$("#refundPrice").text(data.refundPrice + " 원");
								$("#profit").text(data.profit + " 원");
							}
							
							$("#purNoForModify").val(data.purchaseNo);
						}
					},
					error:function(error, status){
						alert("SYSTEM ERROR!")
					}
				});
			}
			
			//상세보기 수정보기
			function modifyDetail(){
				$("#detailView").hide();
				$("#detailModify").show();
				$("#couponArea").hide();
				$("#studentArea").hide();
				$("#academyArea").hide();
				var num = $("#purNoForModify").val();
				
				$.ajax({
					url:"adetail.pur",
					data:{purchaseNo:num},
					type:"post",
					success:function(data){
						if(data == "fail") {
							alert("수납 상세조회에 실패하였습니다.");
							document.getElementById("viewDetail").style.display = "none";
						} else {
							$("#modifyTitle1").text("[ " + data.stuName + "] 학생");
							$("#modifyTitle2").text("<%= selectDate.getSelectYear()%>.<%= selectDate.getSelectMonth()%>. 납부 상세");
							$("#clsname").text(data.className);
							$("#clsprice").text(data.classPrice + " 원");
							$("#notifyday").text(data.strNotifyDate);
							$("#detailstatus").text(data.detailStatus);
							
							if(data.payStatus == 'N') {
								$("#note").prop("disabled", true);
							} else {
								if(data.payMemo == "NONE") {
									
								} else if(data.payMemo == "REFUND") {
									if(data.faultDays == 0) {
										$("#note").val("student").prop("selected", true);
										$("#rfdDay").val(data.refundDay);
										$("#studentArea").show();
									} else {
										$("#note").val("academy").prop("selected", true);
										$("#faultDays").val(data.faultDays);
										$("#academyArea").show();
									}
								} else if(data.payMemo == "BENEFIT") {
									$("#note").val("coupon").prop("selected", true);
									$("#beneName").val(data.beneName);
								}
							}
							
							$("#payprice").attr("placeholder", data.payPrice);
							$("#payprice").val(data.payPrice);
						}
					},
					error:function(error, status){
						alert("SYSTEM ERROR!")
					}
				});
			}
			
		</script>
		</div> <!-- outArea end -->
	</section>
	<footer>
	</footer>
</body>
</html>