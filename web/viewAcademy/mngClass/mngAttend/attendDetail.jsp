<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
	body {
		font-family: "Nanum Gothic";
	}
	.upperArea {
		width:86%;
		height:550px;
		position:absolute; top:27%;
		display:inline;
		overflow:auto;
	}
	#studentListTable {
		overflow:auto;
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
		top:100%;
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
		top:100%;
		left:50%;
		margin-bottom:30px;
		visibility:hidden;
	}
</style>
</head>
<body>
	<%@ include file="/viewAcademy/common/menubar.jsp" %>
	<h2>수강 학생 목록</h2>
	<button style="float:right; margin-bottom:10px;">출결 처리</button>
	<div class="container">
		<div class="upperArea">
			<div class="selectArea">
				<select style="margin-bottom:10px">
					<option>출석</option>
					<option>결석</option>
					<option>지각</option>
					<option>조퇴</option>
				</select>
			</div>
			<div class="studentListArea">
				<form>
					<table id="studentListTable" class="table">
						<tr>
							<th><input type="checkbox" id="checkAll"></th>
							<th>이름</th>
							<th>정보</th>
							<th>12/1</th>
							<th>12/2</th>
							<th>12/3</th>
							<th>12/4</th>
							<th>12/5</th>
							<th>12/6</th>
							<th>12/7</th>
							<th>12/8</th>
							<th>12/9</th>
							<th>12/10</th>
							<th>12/11</th>
							<th>12/12</th>
						</tr>
						<tr>
							<td><input type="checkbox" id="checkOne"></td>
							<td>빛상찬</td>
							<td>kh중학교<br>4학년<br>010-4444-4444</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
						</tr>
						<tr>
							<td><input type="checkbox" id="checkOne"></td>
							<td>빛상찬</td>
							<td>kh중학교<br>4학년<br>010-4444-4444</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
						</tr>
						<tr>
							<td><input type="checkbox" id="checkOne"></td>
							<td>빛상찬</td>
							<td>kh중학교<br>4학년<br>010-4444-4444</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
						</tr>
						<tr>
							<td><input type="checkbox" id="checkOne"></td>
							<td>빛상찬</td>
							<td>kh중학교<br>4학년<br>010-4444-4444</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
						</tr>
						<tr>
							<td><input type="checkbox" id="checkOne"></td>
							<td>빛상찬</td>
							<td>kh중학교<br>4학년<br>010-4444-4444</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
						</tr>
						<tr>
							<td><input type="checkbox" id="checkOne"></td>
							<td>빛상찬</td>
							<td>kh중학교<br>4학년<br>010-4444-4444</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
						</tr>
						<tr>
							<td><input type="checkbox" id="checkOne"></td>
							<td>빛상찬</td>
							<td>kh중학교<br>4학년<br>010-4444-4444</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
						</tr>
						<tr>
							<td><input type="checkbox" id="checkOne"></td>
							<td>빛상찬</td>
							<td>kh중학교<br>4학년<br>010-4444-4444</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
							<td>결석</td>
						</tr>
					</table>
				</form>
			</div>
		</div> <!-- upperArea end -->
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
	</div> <!-- container end -->
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
			$("#studentListTable td").click(function(){
				$(".attendDetailArea").css("visibility","visible");
			});
			
			$(".attendDetailArea").click(function(){
				$(".detailReasonArea").css("visibility","visible");
			})
		});
	</script>
</body>
</html>