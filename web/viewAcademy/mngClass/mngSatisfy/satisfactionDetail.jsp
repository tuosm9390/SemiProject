<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.bottomBtn {
	width: 100px;
	font-size:18px;
}
input {
	border: none !important;
}
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
		<legend align="center"><h1 style="font-family:'Do Hyeon'">　만족도 조사 상세　</h1></legend>
		<form>
			<table class="table" align="center">
				<tr>
					<td><li>만족도 조사 제목</td>
					<td colspan="3"><input type="text" value="2019 하반기 학원 운영 관련 만족도 평가" size="50"></td>
				</tr>
				<tr>
					<td><li>만족도 조사 대상</td>
					<td colspan="3"><input type="text" value="전체 원생 및 학부모 대상" size="50">&emsp;</td>
				</tr>
				<tr>
					<td><li>만족도 조사 날짜</td>
					<td>
					<input type="text" id="from" name="from" readonly>&emsp;~
					&emsp;<input type="text" id="to" name="to" readonly></td>
					<td style="text-align: center !important;"><label><li>쿠폰 선택</li></label></td>
					<td>
					<select disabled>
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
							<li>&emsp;
							<input type="text" value="수업 커리큘럼에 대한 만족도" size="100">
							<br>
							<br> &emsp;
							<input type="text" value="진도와 내용이 적당했다" size="50">
							<br> &emsp;
							<input type="text" value="비교적 내용이 부족하다고 느껴졌다." size="50">
							<br> &emsp;
							<input type="text" value="진도 진행이 적절하지 않았다고 생각한다." size="50">
							</li>
							<li>&emsp;
								<input type="text" value="수업 및 강사에 대한 개선 의견" size="100"><br><br>
								&emsp;
								<textarea placeholder="내용을 입력해주세요" cols="80" rows="6" 
								style="resize: none;" readonly></textarea>
							</li>
						</ol>
					</td>
				</tr>
			</table>
		</form>
		<button class="bottomBtn" style="margin-right: 5%;"
			onclick="location.href='<%=request.getContextPath()%>/viewAcademy/mngClass/mngSatisfy/updateSatisfaction.jsp'">수정</button>
		<button class="bottomBtn" onclick="location.href='<%=request.getContextPath()%>/viewAcademy/mngClass/mngSatisfy/satisfactionList.jsp'">취소</button>
		</fieldset>
	</div>
	</section>
	<script>		
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
		
		//문항 선택항목 삭제
		
		$("input").attr("readonly", true);
	</script>
</body>
</html>