<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, hagong.academy.mngClass.mngSatisfy.model.vo.*"%>
<%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
	ArrayList<SatisfyInfo> blist = (ArrayList<SatisfyInfo>) request.getAttribute("blist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
<style>
section{
	background: url("/hagong/images/satisfy.png") no-repeat center;
	background-size: 100% 100%;
}

section button {
	float: right;
	margin-bottom: 5px;
	margin-left: 1%;
	padding-top: 0;
	padding-bottom: 0;
	font-size: 18px;
	font-family: "Nanum Gothic";
	font-weight: bold;
	border: 2px solid green;
}

input[type=button]{
	width: 30px;
	margin-bottom: 5px;
	margin-left: 1%;
	font-size: 18px;
	font-family: "Nanum Gothic";
	font-weight: bold;
	border: 2px solid green;
	border-radius: 5px;
	background: none;
	color: black;
}

input[type=text], select {
	border: 1px solid lightgray;
	border-radius: 5px;
	height: 30px;
}

textarea{
	border: 1px solid lightgray;
	border-radius: 5px;
}
section button:hover {
	cursor: pointer;
	background: green;
	border: 2px solid green;
	color: white;
}

tr, td {
	background: none !important;
	text-align: left !important;
}

.qo li{
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../../common/menubar.jsp"%>
	</header>
	<section>
	<div align="center">
	<fieldset style="border-bottom: none; border-left: none; border-right: none; border-top-color: black;
					width: 80%;">
		<legend align="center"><h1 style="font-family:'Do Hyeon'">　만족도 조사 수정　</h1></legend>
		<form id="updateSatisfactionForm" action="<%=request.getContextPath()%>/aupdate.satis" method="post">
			<table class="table" align="center">
				<tr>
					<td><li>만족도 조사 제목<input type="hidden" name="satNo" value="<%=list.get(0).get("satNo")%>"></td>
					<td colspan="3"><input type="text" name="title" value="<%=list.get(0).get("satTitle") %>" size="50"></td>
				</tr>
				<tr>
					<td><li>만족도 조사 대상</td>
					<td colspan="3"><input type="text" name="target" value="<%=list.get(0).get("target") %>" size="50"></td>
				</tr>
				<tr>
					<td style="width: 239px;"><li>만족도 조사 날짜</td>
					<td style="width: 384px;">
					<input align="center" type="text" style="width: 100px;" id="start" name="start" value="<%=list.get(0).get("start") %>">
					&nbsp; ~ &emsp;<input align="center" type="text" style="width: 100px;" id="end" name="end" value="<%=list.get(0).get("end") %>">
					</td>
					<td style="text-align: center !important; width: 177px;"><label><li>혜택</li></label></td>
					<td>
					<select class='sort' id="benefitSelect" name="benefit" align="center" space="&nbsp;&nbsp;"
							style="border: 1px solid lightgray; border-radius: 5px; height: 30px">
						<% for(int i = 0; i < blist.size(); i++) { %>
							<option value="<%=blist.get(i).getBenNo()%>"><%=blist.get(i).getBenCondition() + "" + blist.get(i).getBenType() + " "
											+ (int) (Math.floor(blist.get(i).getBenRate() * 100)) + "%"%></option>
						<% } %>
					</select>
					</td>
				</tr>
				<tr>
					<td colspan="4"><li>문항 및 결과</td>
				</tr>
				<tr>
					<td colspan="4" class="question">
						<ol class="qo" style="color:black;">
						<% int n = 0; for(int i = 0; i < list.size(); i++) {
							if(i == 0) { %>
							<!-- 첫번째 문항 -->
							<li class="ql">&emsp;
								<div class="que" style="display: contents;">
									<input type="hidden" class="questionNum" name="questionNum" value="<%= n%>">
									<input type="text" id="question" name="question" value="<%= list.get(i).get("queContent") %>" 
									placeholder="질문 문항 입력" size="100">
									<input type="button" class="qdelete" value="-">
									<input type="button" class="qadd" value="+">
									<br><br>
									<ol>
										<li>
											<span class="ans" style="display: contents;">
												<input type="hidden" class="answerNum" name="answerNum" value="<%= n%>">
												<input type="text" id="answer" name="answer" value="<%= list.get(i).get("ansContent") %>"
												placeholder="선택항목 입력">
												<input type="button" class="adelete" value="-">
												<input type="button" class="aadd" value="+">
											</span>
										</li>
										<%	} else {
											if(list.get(i).get("queNo") == list.get(i - 1).get("queNo")) { %>
											<!-- 두번째 이후 문항 중 두개가 서로 같은 문항일 때 -->
											<li>
												<span class="ans" style="display: contents;">
													<input type="hidden" class="answerNum" name="answerNum" value="<%= n%>">
													<input type="text" id="answer" name="answer" value="<%= list.get(i).get("ansContent") %>" placeholder="선택항목 입력">
													<input type="button" class="adelete" value="-">
													<input type="button" class="aadd" value="+">
												</span>
											</li>
										<%	} else {
											n++;%>
										<!-- 서로 다른 문항일 때 -->
										</ol>
									<br>
								</div>
							</li>
							<li class="ql">&emsp;
								<div class="que" style="display: contents;">
									<input type="hidden" class="questionNum" name="questionNum" value="<%= n%>">
									<input type="text" id="question" name="question" value="<%= list.get(i).get("queContent") %>" 
									placeholder="질문 문항 입력" size="100">
									<input type="button" class="qdelete" value="-">
									<input type="button" class="qadd" value="+">
									<br><br>
									<ol>
										<li>
											<span class="ans" style="display: contents;">
												<input type="hidden" class="answerNum" name="answerNum" value="<%= n%>">
												<input type="text" id="answer" name="answer" value="<%= list.get(i).get("ansContent") %>"
												placeholder="선택항목 입력">
												<input type="button" class="adelete" value="-">
												<input type="button" class="aadd" value="+">
											</span>
										</li>
										<% } } }%>
									</ol>
									<br>
								</div>
							</li>
						</ol>
					</td>
				</tr>
			</table>
		</form>
		<button style="margin-right: 5%; margin-bottom: 50px;" id="update">수정하기</button>
		<button onclick="location.href='<%=request.getContextPath()%>/adetail.satis?satNo=' + '<%=list.get(0).get("satNo")%>' + '&type=detail'">취소</button>
		</fieldset>
	</div>
	</section>
	<footer> </footer>
	<script>
		$("#update").click(function(){
			$("#updateSatisfactionForm").submit();
		});
		//DatePicker
		$.datepicker.setDefaults({
			dateFormat:'yy-mm-dd',
			prevText: '이전 달',
			nextText: '다음 달',
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			dayNames: ['일', '월', '화', '수', '목', '금', '토'],
			dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			changeMonth : true,
			changeYear : true,
			});
		$( function() {
		    var dateFormat = "yy-mm-dd",
		      from = $( "#start" )
		        .datepicker({
		          defaultDate: "+1w",
		          changeMonth: true,
		          numberOfMonths: 2,
		          minDate: 0
		        })
		        .on( "change", function() {
		          to.datepicker( "option", "minDate", getDate( this ) );
		        }),
		      to = $( "#end" ).datepicker({
		        defaultDate: "+1w",
		        changeMonth: true,
		        numberOfMonths: 2
		      })
		      .on( "change", function() {
		        from.datepicker( "option", "maxDate", getDate( this ) );
		      });
		 
		    function getDate( element ) {
		      var date;
		      try {
		        date = $.datepicker.parseDate( dateFormat, element.value );
		      } catch( error ) {
		        date = null;
		      }
		 
		      return date;
			}
		});

		var quecnt = <%=list.size()%>;	//문항번호
		//문항 답변항목 추가
		$(".qo").on("click", ".aadd", function(){
			var anscnt = $(this).closest("div span").children(".answerNum").val();
			$(this).closest("ol").append("<li><span class='ans' style='display: contents;'><input type='hidden' class='answerNum' name='answerNum' value='" + anscnt + "'><input type='text' id='answer' name='answer' placeholder='선택항목 입력'>&nbsp;<input type='button' class='adelete' value='-'>&nbsp;<input type='button' class='aadd' value='+'></span></li>");
		});
		//문항 답변항목 삭제
		$(".qo").on("click", ".adelete", function(){
			console.log($(this).closest("li").siblings().size());
			if($(this).closest("li").siblings().size() > 0){
				$(this).closest("li").remove();
			}
		});
		
		//설문 문항 추가
		$(".question").on("click", ".qadd", function(){
			quecnt++;
			$(this).closest(".qo").append("<li class='ql'>&emsp;<div class='que' style='display: contents'><input type='hidden' class='questionNum' name='questionNum' value='" + quecnt + "'><input type='text' id='question' name='question' placeholder='질문 문항 입력' size='100'><input type='button' class='qdelete' value='-'>&nbsp;<input type='button' class='qadd' value='+'><br><br><ol><li><span class='ans' style='display: contents;'><input type='hidden' class='answerNum' name='answerNum' value='" + quecnt + "'><input type='text' id='answer' name='answer' placeholder='선택항목 입력'>&nbsp;<input type='button' class='adelete' value='-'>&nbsp;<input type='button' class='aadd' value='+'></span></li>");
		});
		//설문 문항 제거
		$(".question").on("click", ".qdelete", function(){
			console.log($(this).parents(".ql").siblings().size());
			if($(this).parents(".ql").siblings().size() > 0){
				$(this).closest(".ql").remove();
			};
		});
	</script>
</body>
</html>