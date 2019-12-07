<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#boardBack{
	background: url("/hagong/images/board.png") no-repeat top;
	background-size: 25%;
	
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
	<div id="boardBack" align="center" style="height: 180px;">
	<fieldset style="border-left:none; border-right:none; border-bottom:none; border-top-color:black;
					width: 20%;">
		<legend align="center"><h1>　만족도 조사 등록　</h1></legend></fieldset>
	</div>
		<form>
			<table class="table" align="center" style="width: 80%;">
				<tr>
					<td><li>만족도 조사 제목</td>
					<td><input type="text" placeholder="만족도 조사 제목 입력" size="50"></td>
				</tr>
				<tr>
					<td><li>만족도 조사 대상</td>
					<td><input type="text" placeholder="만족도 조사 대상 입력" size="80">&emsp;
					</td>
				</tr>
				<tr>
					<td><li>만족도 조사 날짜</td>
					<td>
					<input type="text" id="from" name="from" readonly>&emsp;~
					&emsp;<input type="text" id="to" name="to" readonly></td>
				</tr>
				<tr>
					<td><li>문항 및 결과</td>
				</tr>
				<tr>
					<td colspan="2" class="question">
						<ol class="qo">
							<li>&emsp;
							<input class="insertQ" type="text" placeholder="질문 문항 입력" size="100">
							<input type="button" class="qdelete" value="-">
							<input type="button" class="qadd" value="+">
							<br>
							<br> &emsp;
							<input class="insertA" type="text" placeholder="선택항목 입력">&emsp;
							<input type="button" class="adelete" value="-">
							<input type="button" class="aadd" value="+"><br>
							</li>
						</ol>
					</td>
				</tr>
				<tr>
					<td><li>쿠폰 선택</td>
					<td>
					<select>
						<option>학원비 5%</option>
						<option>학원비 10%</option>
					</select>
					</td>
				</tr>
			</table>
		</form>
		<button style="margin-right: 5%; margin-bottom: 50px;">추가 완료</button>
		<button onclick="location.href='<%=request.getContextPath()%>/viewAcademy/mngClass/mngSatisfy/satisfactionList.jsp'">취소</button>
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
			$(".qo").append("<li>&emsp;&nbsp;<input type='text' placeholder='질문 문항 입력' size='100'> <input type='button' class='qdelete' value='-'>&nbsp;<input type='button' class='qadd' value='+'><br><br> &emsp;&nbsp;<input type='text' placeholder='선택항목 입력'>&emsp;&nbsp;<input type='button' class='adelete' value='-'>&nbsp;<input type='button' class='aadd' value='+'><br></li>");
		});
		//설문 문항 제거
		$(".question").on("click", ".qdelete", function(){
			if($(".qo li").size() != 1){
				$(this).closest(".qo li").remove();
			};
		});
		
		//문항 선택항목 추가
		$(".question").on("click", ".aadd", function(){
			console.log("aadd실행");
			$(this).closest(".insertA .aadd").append("<input type='button' class='aadd' value='+'><br>");
		});
		//문항 선택항목 삭제
	</script>
</body>
</html>