<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
section {
	background:url("/hagong/images/backModifySample.png") no-repeat top;
	background-size:cover;
}
	
tr {
	background: none !important;
}

td {
	text-align: left !important;
}

label {
	color:black;
}

input, select {
	border: 1px solid lightgray;
	border-radius: 5px;
	height: 30px;
}

input[readonly], input[readonly]:focus {
	background: none;
	border: none;
	outline: none;
}

input[type=file] {
	display: none;
	align-items: center;
}

input[type=text], input[type=email], select {
	width: 300px;
}

input[size] {
	width: 90px;
	text-align: center;
}

.outArea {
	width: 100%;
	margin-left: auto;
	margin-right: auto;
}

.bottomBtn {
	font-size: 18px;
	margin-left: 1%;
	font-family: "Nanum Gothic";
	font-weight: bold;
	border: 2px solid green;
	display: inline;
}

.bottomBtn:hover {
	cursor: pointer;
	background: green;
	border: 2px solid green;
	color: white;
	display: inline;
}

.delete {
	display: inline;
}

#profile {
	width: 200px;
	height: 200px;
	radius: 50%;
}

#userId {
	width: 300px;
}

#address {
	width: 500px;
}

#deleteBtn {
	border-color: red;
}

#deleteBtn:hover {
	background: red;
	color: white;
}

fieldset {
	width: 80%;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../common/menubar.jsp"%>
	</header>
	<section>
		<div align="center">
			<fieldset style="border-left:none; border-right:none; border-bottom:none; border-top-color:black;">
				<legend align="center" style="font-family:'Do Hyeon';"><h1>　개인정보 수정　</h1></legend>
				<div class="outArea">
					<form action="" method="post">
					<table class="table">
						<tr>
							<td rowspan="5" width="10%"><div align="center"><img id="profile" src="../../images/user.png"></div></td>
							<td width="20%"><li>ID</li></td>
							<td width="40%"><input type="text" name="userId" id="userId" value="KJH001205" readonly></td>
							<td width="20%"></td>
						</tr>
						<tr>
							<td><li>이름</li></td>
							<td colspan="2"><input type="text" name="userName" id="userName" value="김진호" readonly></td>
						</tr>
						<tr>
							<td><li>비밀번호</li></td>
							<td colspan="2"><input type="password" name="userPwd" id="userPwd"></td>
						</tr>
						<tr>
							<td><li>비밀번호 확인</li></td>
							<td colspan="2"><input type="password" name="userPwdCk" id="userPwdCk"></td>
						</tr>
						<tr>
							<td><li>생년월일</li></td>
							<td colspan="2"><input type="text" name="birth" id="datepicker" value="2000년 12월 05일 (20세)" readonly></td>
						</tr>
						<tr>
							<td><div align="center"><button id="imgBtn">사진 변경</button></div><input type="file" id="imgFile"></td>
							<td><li>전화번호</li></td>
							<td colspan="2"><input type="text" maxlength="3" size="4" name="tel1" value="010"> - 
							    			<input type="text" maxlength="4" size="4" name="tel2" value="0000"> - 
							    			<input type="text" maxlength="4" size="4" name="tel3" value="7771"></td>
						</tr>
						<tr>
							<td></td>
							<td><li>담당업무</li></td>
							<td colspan="2">
								<select name="subject" disabled>
									<option value="select">담당업무 선택</option>
									<option value="korea" selected>국어</option>
									<option value="math">수학</option>
									<option value="english">영어</option>
									<option value="social">사회탐구</option>
									<option value="science">과학탐구</option>
									<option value="foreign">제2외국어</option>
									<option value="desk">행정</option>
									<option value="cram">입시</option>
								</select>
							</td>
						</tr>
						<tr>
							<td></td>
							<td><li>이메일</li></td>
							<td colspan="2"><input type="email" name="email" id="email" value="kjh7771@gmail.com"></td>
						</tr>
						<tr>
							<td></td>
							<td><li>주소</li></td>
							<td colspan="2"><input type="text" name="address" id="address" value="강남구 역삼동 KH정보교육원 C class"></td>
						</tr>
						<tr>
							<td></td>
							<td><li>개인정보 제공<br>　　및 활용 동의</li></td>
							<td colspan="2">
								<div class="acceptText"><label>Y</label></div>
							</td>
						</tr>
						<tr>
							<td></td>
							<td><li>급여 계약서</li></td>
							<td><label>20191205_김진호_급여_계약서.hwp</label></td>
							<td><button id="payBtn">파일 추가</button><input type="file" id="payFile"></td>
						</tr>
						<tr>
							<td></td>
							<td><li>경력 등 기타 서류</li></td>
							<td><label>20191205_김진호_이력서.hwp</label></td>
							<td><button id="docBtn">파일 추가</button><input type="file" id="docFile"></td>
						</tr>
						<tr>
							<td></td>
							<td colspan="3">
								<div class="btnArea" align="center">
									<button type="button" class="bottomBtn" onclick="doCancel();">취소</button>
									<button type="button" class="bottomBtn" onclick="doModify();">수정 완료</button>
								</div> <!-- btnArea end -->
							</td>
						</tr>
					</table>		
					</form>
				</div> <!-- outArea end -->
			</fieldset>
		</div>
		<script>
			$(function(){
				$("#imgBtn").click(function(){
					$("#imgFile").click();
				});
				
				$("#payBtn").click(function(){
					$("#payFile").click();
				});
				
				$("#docBtn").click(function(){
					$("#docFile").click();
				});
			});
			
			function doModify(){
				if(window.confirm("정말로 수정하시겠습니까?")) {
					location.href= "<%= request.getContextPath() %>/viewAcademy/commonMenu/viewStaffInfo.jsp";
				}
			}
			
			function doCancel(){
				if(window.confirm("수정을 취소하시겠습니까?")) {
					location.href = "<%= request.getContextPath() %>/viewAcademy/commonMenu/viewStaffInfo.jsp";
				}
			}
		</script>
	</section>
	<footer>
	</footer>
</body>
</html> 