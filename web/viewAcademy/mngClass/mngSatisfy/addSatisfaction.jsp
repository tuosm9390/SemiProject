<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, hagong.academy.mngClass.mngSatisfy.model.vo.*, hagong.academy.mngClass.mngClassList.model.vo.Class"%>
<%
	ArrayList<SatisfyInfo> blist = (ArrayList<SatisfyInfo>) request.getAttribute("blist");
	ArrayList<Class> clist = (ArrayList<Class>) request.getAttribute("clist");
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
	<fieldset style="border-left:none; border-right:none; border-bottom:none; border-top-color:black;
						width: 80%; background: none;">
		<legend align="center"><h1 style="font-family:'Do Hyeon'">　만족도 조사 등록　</h1></legend>
		<form id="insertSatisfactionForm"
			action="<%=request.getContextPath()%>/ainsert.satis?type=insert" method="post">
			<table class="table" align="center">
				<tr>
					<td><li>만족도 조사 제목</td>
					<td colspan="3"><input type="text" id="title" name="title" placeholder="만족도 조사 제목 입력" size="50"></td>
				</tr>
				<tr>
					<td><li>만족도 조사 대상</td>
					<td colspan="3">
					<select id="target" name="target" align="center"
							style="border: 1px solid lightgray; border-radius: 5px; height: 30px">
						<option selected>선택</option>
						<% for(int i = 0; i < clist.size(); i++) { %>
						<option value="<%=clist.get(i).getClsNo() %>">
						<%=clist.get(i).getClsName() %></option>
						<% } %>
					</select>
					</td>
				</tr>
				<tr>
					<td><li>만족도 조사 날짜</td>
					<td>
					<input type="text" id="start" name="start" readonly>&emsp;~
					&emsp;<input type="text" id="end" name="end" readonly>
					</td>
					<td style="text-align: center !important;"><label>쿠폰 선택</label></td>
					<td>
					<select class='sort' id="benefitSelect" name="benefit" align="center" space="&nbsp;&nbsp;"
							style="border: 1px solid lightgray; border-radius: 5px; height: 30px">
						<option selected>선택</option>
								<% for(int i = 0; i < blist.size(); i++) { %>
								<option value="<%=blist.get(i).getBenNo()%>">
								<%=blist.get(i).getBenCondition() + "" + blist.get(i).getBenType() + " "
									+ (int) (Math.floor(blist.get(i).getBenRate() * 100)) + "%"%></option>
								<% } %>
						</select></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="4"><li>문항 및 답변</td>
				</tr>
				<tr>
					<td colspan="4" class="question">
						<ol class="qo">
							<li class="ql">
								<div class="que" style="display: contents;">
									<input type="hidden" class="questionNum" name="questionNum" value="0">
									<input type="text" id="question" name="question" placeholder="질문 문항 입력" size="100">
									<input type="button" class="qdelete" value="-">
									<input type="button" class="qadd" value="+"><br>
									<span class="ans" style="display: contents;">
										<input type="hidden" class="answerNum" name="answerNum" value="0">
										<input type="text" id="answer" name="answer" placeholder="선택항목 입력">
										<input type="button" class="adelete" value="-">
										<input type="button" class="aadd" value="+"><br>
									</span>
								</div>
							</li>
						</ol>
					</td>
				</tr>
			</table>
		</form>
		<button style="margin-right: 5%; margin-bottom: 50px;" id="insert">등록하기</button>
		<button onclick="location.href='<%=request.getContextPath()%>/alist.satis'">취소</button>
		</fieldset>
	</div>
	</section>
	<footer> </footer>
	
	<script>
		$("#insert").click(function(){
			$("#insertSatisfactionForm").submit();
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
		  } );
		
		
		var quecnt = 0;	//문항번호
		//문항 답변항목 추가
		$(".qo").on("click", ".aadd", function(){
			var anscnt = $(this).closest("div span").children(".answerNum").val();
			$(this).closest("span").after("<span class='ans' style='display: contents;'><input type='hidden' class='answerNum' name='answerNum' value='" + anscnt + "'><input type='text' id='answer' name='answer' placeholder='선택항목 입력'>&nbsp;<input type='button' class='adelete' value='-'>&nbsp;<input type='button' class='aadd' value='+'><br></span>");
		});
		//문항 답변항목 삭제
		$(".qo").on("click", ".adelete", function(){
			console.log($(this).closest("span").siblings().size());
			if($(this).closest("span").siblings().size() > 5){
				$(this).closest("span").remove();
			}
		});
		
		//설문 문항 추가
		$(".question").on("click", ".qadd", function(){
			quecnt++;
			$(this).closest(".ql").after("<li class='ql'><div class='que' style='display: contents'><input type='hidden' class='questionNum' name='questionNum' value='" + quecnt + "'><input type='text' id='question' name='question' placeholder='질문 문항 입력' size='100'> <input type='button' class='qdelete' value='-'>&nbsp;<input type='button' class='qadd' value='+'><br><span class='ans' style='display: contents;'><input type='hidden' class='answerNum' name='answerNum' value='" + quecnt + "'><input type='text' id='answer' name='answer' placeholder='선택항목 입력'>&nbsp;<input type='button' class='adelete' value='-'>&nbsp;<input type='button' class='aadd' value='+'><br></span></div></li>");
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