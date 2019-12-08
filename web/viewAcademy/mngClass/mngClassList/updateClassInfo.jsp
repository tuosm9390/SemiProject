<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	input[type=text], input[type=number], input[type=date] {
		width: 300px;
		height: 30px;
		margin-bottom:20px;
		border-radius: 5px;
		background:none;
	}
	
	input[type="checkbox"] {
		margin-left: 10px;
		width:20px;
		height:30px;
		margin-bottom:20px;
	}
	
	.bottomArea > button {
		padding:10px;
		margin-right:10px;
		margin-bottom:50px;
		width:100px;
		border-radius:5px;
		background:white;
		color:black;
		display:inline;
		font-size: 18px;
		font-family: "Nanum Gothic";
		font-weight: bold;
		border: 2px solid green;
	}
	
	.bottomArea > button:hover {
		background:green;
		color:white;
	}
	
	fieldset {
		width:16%;
	}
	
	select {
		height: 30px;
		width: 300px;
		margin-bottom: 20px;
		border-radius: 5px;
	}
</style>
</head>
<body>
	<header>
	<%@ include file="/viewAcademy/common/menubar.jsp" %>
	</header>
	<section>
	<div align="center">
      	<fieldset style="margin-top:-25px; margin-bottom:-30px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;">
         	<legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">&nbsp;수업정보 수정&nbsp;</h1></legend>
      	</fieldset>
    </div>
		<div class="body" align="center">
		<form id="classInfo" action="<%=request.getContextPath()%>/viewAcademy/mngClass/mngClassList/classInfo.jsp" method="post">
			<table class="insertTable">
				<tr>
					<td>과목 : </td>
					<td>
					<select style="margin-bottom:20px">
						<option>국어</option>
						<option>수학</option>
						<option>영어</option>
						<option>사회</option>
						<option>과학</option>
						<option>기타</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>담당 강사 : </td>
					<td>
						<select id="selectTeacher" style="margin-bottom:20px">
							<option value="김상찬">김상찬</option>
							<option value="서범수">서범수</option>
							<option value="박재영">박재영</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>강좌명 : </td>
					<td><input type="text" id="classTitle" name="classTitle"></td>
				</tr>
				<tr>
					<td>정원 : </td>
					<td><input type="number" id="numOfClass" name="numOfClass"></td>
				</tr>
				<tr>
					<td>기간 : </td>
					<td><input type="date" id="dateOfClass" name="dateOfClass"></td>
				</tr>
				<tr>
					<td>요일 : </td>
					<td>
						<input type="checkbox" id="mon" name="day" value="monday"><label for="mon">월</label>
						<input type="checkbox" id="tue" name="day" value="tuesday"><label for="tue">화</label>
						<input type="checkbox" id="wed" name="day" value="wednesday"><label for="wed">수</label>
						<input type="checkbox" id="thur" name="day" value="thursday"><label for="thur">목</label>
						<input type="checkbox" id="fri" name="day" value="friday"><label for="fri">금</label>
						<input type="checkbox" id="sat" name="day" value="saturday"><label for="sat">토</label>
						<input type="checkbox" id="sun" name="day" value="sunday"><label for="sun">일</label>
					</td>
				</tr>
				<tr>
					<td>강의실 : </td>
					<td>
						<select id="classroom" name="classroom" style="margin-bottom:20px">
							<option>A</option>
							<option>B</option>
							<option>C</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>강의 시간 : </td>
					<td>	
						<select id="classTime" style="margin-bottom:20px">
							<option>15:00 ~ 16:00</option>
							<option>16:00 ~ 17:00</option>
							<option>17:00 ~ 18:00</option>
						</select>
					</td>
				</tr> 	
				<tr>
					<td>수업료 : </td>
					<td><input type="number" step="1000"></td>
				</tr>	
			</table>
		<div class="bottomArea">
			<button type="button">취소</button>
			<button id="insertClassInfoBtn">수정 완료</button>
		</div>
		</form>
	</div> <!-- body end -->
	<script>
		function deleteClass() {
			var form = document.getElementById("classInfo");
			
			swal({
				title: "강좌 삭제",
				text: "강좌 정보를 영구적으로 삭제하시겠습니까?",
				icon: "warning",
	    		buttons : [ "취소", "삭제" ],
	    		dangerMode: true,
	    	}).then(function(isConfirm) {
	    		if(isConfirm) {
	    			swal ({
	    				title: "삭제되었습니다.",
	    				icon: "success"
	    			}).then(function(){
	    				form.submit();
	    			});
	    		}else {
	    			swal ("강좌 삭제가 취소되었습니다.");
	    		}
	    	});
		}
		
		document.querySelector("#classInfo").addEventListener('submit', function(e) {
			var form = this;
			
			e.preventDefault();
			
			swal({
				title: "강좌 수정",
				text: "강좌 정보를 수정하시겠습니까?",
				icon: "warning",
	    		buttons : [ "취소", "수정" ],
	    		dangerMode: true,
	    	}).then(function(isConfirm) {
	    		if(isConfirm) {
	    			swal ({
	    				title: "수정되었습니다.",
	    				icon: "success"
	    			}).then(function(){
	    				//form.submit();
	    				console.log(form);
	    			});
	    		}else {
	    			swal ("강좌 삭제가 취소되었습니다.");
	    		}
	    	});
			
		})
	</script>
	</section>
	<footer></footer>
</body>
</html>