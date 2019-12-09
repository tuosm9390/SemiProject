<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section{
	background: url("/hagong/images/satisfy.png") no-repeat center;
	background-size: 100% 100%;
}

section button {
	float: right;
	margin-bottom: 5px;
	margin-left: 1%;
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
		<form>
			<table class="table" align="center">
				<tr>
					<td><li>만족도 조사 제목</td>
					<td colspan="3"><input type="text" placeholder="만족도 조사 제목 입력" size="50"></td>
				</tr>
				<tr>
					<td><li>만족도 조사 대상</td>
					<td colspan="3"><input type="text" placeholder="만족도 조사 대상 입력" size="80">&emsp;
					</td>
				</tr>
				<tr>
					<td><li>만족도 조사 날짜</td>
					<td>
					<input type="text" id="from" name="from" readonly>&emsp;~
					&emsp;<input type="text" id="to" name="to" readonly>
					</td>
					<td style="text-align: center !important;"><label>쿠폰 선택</label></td>
					<td>
					<select>
						<option>학원비 5%</option>
						<option>학원비 10%</option>
					</select>
					</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="4"><li>문항 및 결과</td>
				</tr>
				<tr>
					<td colspan="4" class="question">
						<ol class="qo">
							<li class="ql">
								<span class="que" style="display: contents;">
									<input type="text" placeholder="질문 문항 입력" size="100">
									<input type="button" class="qdelete" value="-">
									<input type="button" class="qadd" value="+"><br>
								</span>
								<span class="answer" style="display: contents;">
									<input type="text" placeholder="선택항목 입력">
									<input type="button" class="adelete" value="-">
									<input type="button" class="aadd" value="+"><br>
								</span>
							</li>
						</ol>
					</td>
				</tr>
			</table>
		</form>
		<button style="margin-right: 5%; margin-bottom: 50px;">추가 완료</button>
		<button onclick="location.href='<%=request.getContextPath()%>/viewAcademy/mngClass/mngSatisfy/satisfactionList.jsp'">취소</button>
		</fieldset>
	</div>
	</section>
	<footer> </footer>
	
	<script>
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
		      from = $( "#from" )
		        .datepicker({
		          defaultDate: "+1w",
		          changeMonth: true,
		          numberOfMonths: 2
		        })
		        .on( "change", function() {
		          to.datepicker( "option", "minDate", getDate( this ) );
		        }),
		      to = $( "#to" ).datepicker({
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
		
		//설문 문항 추가
		$(".question").on("click", ".qadd", function(){
			$(".qo").append("<li class='ql'><span class='que' style='display: contents'><input type='text' placeholder='질문 문항 입력' size='100'> <input type='button' class='qdelete' value='-'><input type='button' class='qadd' value='+'><br></span><span class='answer' style='display: contents;'><input type='text' placeholder='선택항목 입력'>&nbsp;<input type='button' class='adelete' value='-'>&nbsp;<input type='button' class='aadd' value='+'><br></span></li>");
		});
		//설문 문항 제거
		$(".question").on("click", ".qdelete", function(){
			if($(".que").size() != 1){
				$(this).closest(".qo .ql").remove();
			};
		});
		
		//문항 선택항목 추가
		$(".question").on("click", ".aadd", function(){
			$(this).closest("span").append("<span class='answer' style='display: contents;'><input type='text' placeholder='선택항목 입력'>&nbsp;<input type='button' class='adelete' value='-'>&nbsp;<input type='button' class='aadd' value='+'><br></span>");
		});
		//문항 선택항목 삭제
		$(".question").on("click", ".adelete", function(){
			if($(this).parents("span").size() != 1){
				$(this).closest("span").remove();
			}
		});
	</script>
</body>
</html>