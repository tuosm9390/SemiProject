<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>HAGONG</title>
<style>
	body {
		font-family: "Nanum Gothic";
 	}
 	
	.studentListArea {
		width: 86%;
		margin-left: auto;
		margin-right: auto;
		height:550px;
		position:absolute;
		display:inline;
		overflow:auto;
	}
	
	.selectArea {
		top:30%;
	}
	
	.bottomArea {
		background:white;
		position:static;
	}
	
	.attendDetailArea {
		width:43%;
		height:400px;
		border:1px solid lightgray;
		background:white;
		position:absolute;
		top:105%;
		left:7%;
		margin-bottom:30px;
		overflow:auto;
		visibility:hidden;
	}
	
	.detailReasonArea {
		width:43%;
		height:400px;
		border:1px solid green;
		position:absolute;
		top:105%;
		left:50%;
		margin-bottom:30px;
		visibility:hidden;
	}
	
	fieldset {
		width:16%;
	}
	
	.attendBtn {
		float:right;
		margin-bottom:10px;
		font-size: 18px;
		margin-left: 1%;
		font-family: "Nanum Gothic";
		font-weight: bold;
		border: 2px solid green;
		display: inline;
	}
	
	.attendBtn:hover {
		cursor: pointer;
		background: green;
		border: 2px solid green;
		color: white;
		display: inline;
	}
</style>
</head>
<body>
	<header>
	<%@ include file="/viewAcademy/common/menubar.jsp" %>
	</header>
	<section>
	<div align="center">
      		<fieldset style="margin-top:-25px; margin-bottom:-15px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;">
         	<legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">&nbsp;출결 상세&nbsp;</h1></legend>
      		</fieldset>
    </div> <!-- center end -->
	<button class="attendBtn">출결 처리</button>
	<div class="selectArea">
		<select style="margin-bottom:10px">
			<option>출석</option>
			<option>결석</option>
			<option>지각</option>
			<option>조퇴</option>
		</select>
	</div>
	
	<div class="outer">
		<div class="studentListArea">
			<form>
				<table class="studentListTable table">
					<tr>
						<th><input type="checkbox" id="checkAll"></th>
						<th>이름</th>
						<th width="100px" nowrap>정보</th>
						<% Calendar cal = Calendar.getInstance();
							int dayOfMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
								
							for(int i=0; i<dayOfMonth; i++) {
						%>
						<th>12/<%=i+1%></th>
						<% } %>
					</tr>
						
					<% for(int j=0; j<20; j++) { %>
					<tr>
						<td><input type="checkbox" id="checkOne"></td>
						<td>빛상찬</td>
						<td id="infoCol">kh중학교<br>4학년<br>010-4444-4444</td>
						<% for(int k=0; k<dayOfMonth; k++) { %>
						<td>결석</td>
						<% } %>
					</tr>
					<% } %>
				</table>
			</form>
		</div>
	<div class="bottomArea">
		<div class="attendDetailArea">
			<h4>&nbsp;&nbsp;학생별 출결 상세</h4>
			<table class="detailAreaTable table">
				<tr>
					<td>12/1</td>
					<td>결석</td>
				</tr>
				<tr>
						<td>12/2</td>
						<td>결석</td>
				</tr>
				<tr>
					<td>12/3</td>
					<td>결석</td>
				</tr>
				<tr>
					<td>12/4</td>
					<td>결석</td>
				</tr>
				<tr>
					<td>12/5</td>
					<td>결석</td>
				</tr>
				<tr>
					<td>12/6</td>
					<td>결석</td>
				</tr>
				<tr>
					<td>12/7</td>
					<td>결석</td>
				</tr>
				<tr>
					<td>12/8</td>
					<td>결석</td>
				</tr>
				<tr>
					<td>12/9</td>
					<td>결석</td>
				</tr>
			</table>
		</div>	<!-- attendDetailArea end -->
			<div class="detailReasonArea">
				<h4>&nbsp;&nbsp;출결 상세 사유</h4>
				<div class="reasonContent">
					<form action="" method="post">
						<textarea style="margin: 0px; width: 677px; height: 282px; resize:none;"></textarea>
						<br>
						<input type="submit" value="입력" style="float:right; padding:5px; width:100px; border:1px solid green; background:white; border-radius:3px;">
					</form>
				</div>
			</div> <!-- detailReasonArea end -->
		</div> <!-- bottomArea end -->
		</div> <!-- outer end -->
	<script>
		$(function(){
			$("input:checkbox[id='checkAll']").change(function(){			
				if(this.checked){
					$("input:checkbox[id='checkOne']").prop("checked",true);				
				}else {
					$("input:checkbox[id='checkOne']").prop("checked",false);
				}
			});
		});
		
		$(function(){
			$(".studentListTable td").click(function(){
				$(".attendDetailArea").css("visibility","visible");
			});
			
			$(".attendDetailArea").click(function(){
				$(".detailReasonArea").css("visibility","visible");
			})
		});
	</script>
	</section>
	<footer></footer>
</body>
</html>