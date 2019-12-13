<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, hagong.academy.mngStudent.mngCouns.model.vo.*"%>
<% ArrayList<MemberCouns> detailCounsList =(ArrayList<MemberCouns>) request.getAttribute("detailCounsList"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
<style>
.bottomBtn {
	font-size:18px;
}
input, select, textarea {
	border-radius:5px;
	border:1px solid lightgray;
}
.backSection{
	width:100%;
	background: url("/hagong/images/consBackImg.jpg") no-repeat top;
	background-size: 100%;
	height:900px;
}
.wrap {
	position: absolute;
	width: 100%;
	padding: 30px;
	max-width: 700px;
	left: 50%;
	transform: translateX(-50%);
    border-radius: 5px;
}

.accordion {
	display: block;
	position: relative;
	width: 100%;
	padding-inline-start: 0;
}

.accordionArea {
	background:rgba(268, 268, 268, 50%);
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
	width:100%;
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
	text-decoration:none;
}

.accordion__title:hover {
	background-color: rgba(129,208,177,.3);
}

.accordion__title.active {
	background: #31bc86;
	color:white;
}

.accordion__title.active .x7 {
	transform: rotate(-90deg); 
}

.accordion__title.active .btop { width :
	67%;
	top: 2px;
	transform: translateY(-50%) rotate(-45deg);
	transform-origin: 50% 50%;}
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
width:100%;
	display: none;
	position: relative;
	overflow: hidden;
	border: 1px solid #eee;
	border-top: none;
	line-height: 1.65;
	padding: 25px;
	background-color: #fff;
	font-size: .875em;
}


.bmenu {
	width: 26px;
	height: 16px;
	display: block;
	position: absolute;
	right: 15px;
	top: 12px;
}

.btop, .bmid, .bbot {
	right: 0;
	width: 100%;
	height: 2px;
	position: absolute;
	background-color: #333;
	border-radius: 1px;
}

.btop {
	width: 40%;
}

.bmid {
	width: 60%;
}

.bbot {
	width: 80%;
}

.x7 {
	transition: transform .3s ease-out;
	transform-origin: 60% 75%; 
}
.x7 .btop { top : 0;
	transition: width .3s, transform .3s, top .0s;
	transition-timing-function: ease-out;}
	
.x7 .bmid {
	top: calc(50% - 1px);
	transform-origin: 100% 50%;
	transition: opacity .1s;
	transition-timing-function: ease-out;
}

.x7 .bbot {
	bottom: 0;
	transition: width .3s, transform .3s, bottom .0s;
	transition-timing-function: ease-out;
}
.detailArea {
	display: table-caption;
}
.inputCons {
	resize:none;
}
.btnArea {
	text-align:center;
}
.btnArea button{
font-size:18px;
	display:inline-block;
	margin:0 2px;
	width: 70px;
}
.btnArea .bottomBtn.doneBtn{
	display:none;
}

.updateBtn {
	display:inline-block;
	margin:0 2px;
	width: 70px;
	height: 22px;
	line-height: 19px;
	text-decoration: none;
	border: 1px solid green;
	border-radius: 5px;
	background: none;
	color: black;
	position: relative;
	padding: 1px 6px;
}

.updateBtn:focus {
	outline: none;
}

.updateBtn:hover {
	cursor: pointer;
	background: green;
	border: 1px solid green;
	color: white;
}
.detailArea{display: block;width: 100%;}
.dArea .dCtn{padding-bottom: 20px;}
.dArea .dCtn .inputCons{padding: 4px;}
.dArea .dCtn.consTitle .inputCons{display: block;width: 100%;}
.dArea .dCtn .consCate{padding: 4px;width: 162px;}
.dArea .dTit{display: block;padding-bottom: 5px;font-weight: bold;font-size: 15px;}
.dArea textarea.inputCons{width: 100%;min-height: 100px;}
.btnArea{padding: 24px 0 13px;}
.names{display:flex;}
.names .dCtn.tName{margin-right:160px;}
.dArea.dArea2{display:flex;}
.dArea.dArea2 .dCtn.consDate{margin-right:160px;}

</style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp"%>
	<section class="backSection">
		<div class="wrap">
		<div align="center">
      		<fieldset style="margin-top:-25px; margin-bottom:-15px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;width: 30%;">
         		<legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">　상담일지　</h1></legend>
      		</fieldset>
      	</div>
      	<div class="accordionArea">
		<ul class="accordion">
			<% for(int i = 0; i < detailCounsList.size(); i++) {%>
			<li class="accordion__item"><a class="accordion__title"
				href="javascript:void(0)"><%= detailCounsList.get(i).getCouTitle() %>
					<div class="bmenu x7">
						<span class="btop"></span><span class="bmid"></span><span
							class="bbot"></span>
					</div>
			</a>
				<form id="detailCouns<%= i %>" class="accordion__content" method="post">
					<div class="detailArea">
						<div class="dArea dArea1">
							<div class="dCtn consTitle">
								<input type="hidden" name="couNo" value="<%= detailCounsList.get(i).getCouNo() %>">
								<input type="hidden" name="userNo" value="<%= detailCounsList.get(i).getUserNo() %>">								
								<label class="dTit">상담제목</label>
								<input name="title" type="text" class="inputCons updateAble" value="<%= detailCounsList.get(i).getCouTitle() %>" readonly>
							</div>
							<div class="names">
								<div class="dCtn tName">
									<label class="dTit">상담자 이름</label>
									<input name="couName" type="text" class="inputCons" value="<%= detailCounsList.get(i).getCouUserName() %>" readonly>
								</div>
								<div class="dCtn sName">
									<label class="dTit">상담학생명</label>
									<input name="userName" type="text" class="inputCons" value="<%= detailCounsList.get(i).getUserName() %>" readonly>
								</div>
							</div>

						</div>
						<div class="dArea dArea2">
							<div class="dCtn consDate"> 
								<label class="dTit">상담일자</label>
								<input type="text" class="inputCons" id="from<%= i %>" name="from" value="<%= detailCounsList.get(i).getCouDate() %>" readonly>
							</div>
							<div class="dCtn category">
								<label class="dTit">상담종류</label>
								<select id="category<%= i %>" name="consCategory" disabled class="consCate updateAble">
									<option value="SCORE">성적</option>
									<option value="LIFE">학원생활</option>
									<option value="PARENT">학부모</option>
									<option value="APPLY">진학</option>
									<option value="ETC">기타</option>
								</select>
								<script>
									$(function(){
										var value = '<%= detailCounsList.get(i).getCouType() %>';
										var q = '<%= i %>';
										$("#category" + q + " option").each(function(){
											if($(this).val() == value){
												$(this).prop("selected", true);
											}
										});
									})
								</script>
							</div>
						</div>
						<div class="dArea dArea3">
							<div class="dCtn content">
								<label class="dTit">내용</label>
								<textarea class="inputCons updateAble" name="consreq" readonly><%= detailCounsList.get(i).getCouContent() %></textarea>
							</div>
							<div class="dCtn answer">
								<label class="dTit">상담자의 대응내용</label>
								<textarea class="inputCons updateAble" name="consres" readonly><%= detailCounsList.get(i).getCouAction() %></textarea>
							</div>
						</div>
					</div>
					<div class="btnArea">
						<button class="bottomBtn" onclick="deleteCouns(<%= i %>)">삭제</button>
						<button id="updateBtn<%=i %>" type="button" class="bottomBtn" onclick="updateCouns(<%= i %>);">수정</button>
						<button id="updateCons<%=i %>" class="bottomBtn doneBtn" onclick="completeCouns(<%= i %>)">완료</button>
					</div> <!-- btnArea -->
				</form>
				<script>
					function updateCouns(i){
						console.log(i);
						console.log($("#detail" + i + " input").val());
						$("#detailCouns" + i + " .updateAble").prop("readonly", false);
						
						$("#category" + i).prop("disabled", false);
						$("#updateCons" + i).show().css("display","inline-block");
						$("#updateBtn" + i).hide();
						
						$("#from" + i).datepicker();				
						
					}
					function completeCouns(i){			
						$("#detailCouns" + i).attr("action", "<%= request.getContextPath()%>/update.couns");
					}
					
					function deleteCouns(i){
						$("#detailCouns" + i).attr("action", "<%= request.getContextPath()%>/deletedetail.couns");
					}
				</script>
			</li>
			<%} %>
		</ul>
		</div>
	</div>
	</section>

	<script>
		//아코디언 기능 스크립트
		$(function() {
			$('.accordion').find('.accordion__title').click(function() {
				// Adds active class
				$(this).toggleClass('active');
				// Expand or collapse this panel
				$(this).next().slideToggle('fast');
				// Hide the other panels
				$('.accordion__content').not($(this).next()).slideUp('fast');
				// Removes active class from other titles
				$('.accordion__title').not($(this)).removeClass('active');
			});
		});
		
		//DatePicker
		$.datepicker.setDefaults({
    		dateFormat: 'yy-mm-dd',
    		prevText: '이전 달',
    		nextText: '다음 달',
    		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    		dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    		showMonthAfterYear: true,
    		changeMonth : true,
			changeYear : true,
			constrainInput: false,
    		yearSuffix: '년'
  		});
<%-- 		$(function() {
			var size = <%= detailCounsList.size( )%>;
			for(var i = 0; i < size; i++){
				$("#from" + i).datepicker();				
			}
		}); --%>
		
	</script>
</body>
</html>