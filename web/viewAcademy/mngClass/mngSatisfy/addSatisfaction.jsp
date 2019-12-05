<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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

th, td {
	background: white;
	text-align: left !important;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../../common/menubar.jsp"%>
	</header>
	<section>
		<h2 style="margin-left: 5%;">만족도 조사 등록</h2>
		<br>
		<form>
			<table class="table" align="center" style="width: 90%;">
				<tr>
					<td><li>만족도 조사 제목</td>
					<td><input type="text" placeholder="만족도 조사 제목 입력" size="50"></td>
				</tr>
				<tr>
					<td><li>만족도 조사 대상</td>
					<td><input type="text" placeholder="만족도 조사 대상 입력" size="80">&emsp;
						<select>
							<option>대상 인원 입력</option>
					</select></td>
				</tr>
				<tr>
					<td><li>만족도 조사 날짜</td>
					<td>
					<input type="text" id="from" name="from">&emsp;~
					&emsp;<input type="text" id="to" name="to"></td>
				</tr>
				<tr>
					<td><li>문항 및 결과</td>
				</tr>
				<tr>
					<td colspan="2">
						<ol>
							<li>&emsp;
							<input type="text" placeholder="질문 문항 입력" size="100"> <input type="button" value="-">
							<input type="button" value="+">
							<br>
							<br> &emsp;
							<input type="text" placeholder="선택항목 입력">&emsp;
							<select>
									<option>선택자 수</option>
							</select>
							<input type="button" value="-">
							<input type="button" value="+">
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
		$(function() {
	    	var dateFormat = "mm/dd/yy",
	    		from = $( "#from" )
	    		.datepicker({
	    			defaultDate: "+1w",
	    			changeMonth: true,
	    			numberOfMonths: 3
	    		})
	    		.on( "change", function() {
	    			to.datepicker( "option", "minDate", getDate( this ) );
	    		}),
	    			to = $( "#to" ).datepicker({
	    			defaultDate: "+1w",
	    			changeMonth: true,
	    			numberOfMonths: 3
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
	</script>
</body>
</html>