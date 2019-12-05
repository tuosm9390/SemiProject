<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	input[type="text"], input[type="number"], input[type="date"] {
		width: 300px;
		padding:10px;
		margin-bottom:20px;
	}
	input[type="checkbox"] {
		margin-left: 10px;
		width:20px;
		height:20px;
		margin-bottom:20px;
	}
	.bottomArea > button {
		padding:10px;
		margin-right:10px;
		margin-bottom:50px;
		width:100px;
		border:1px solid green;
		border-radius:5px;
		background:white;
		color:black;
		display:inline;
	}
	
	.bottomArea > input:hover {
		background:green;
		color:white;
	}
</style>
</head>
<body>
	<%@ include file="/viewAcademy/common/menubar.jsp" %>
	<h2>강좌 정보 수정</h2>
		<div class="body" align="center">
		<form id="classInfo" action="<%=request.getContextPath()%>/viewAcademy/mngClass/mngClassList/classInfo.jsp" method="post">
			<table class="insertTable">
				<tr>
					<td>
					<label>과목 : <input type="text" id="subject"></label>
					</td>
				</tr>
				<tr>
					<td>
					<label for="selectTeacher">담당 강사 : </label>
					<select id="selectTeacher" style="width:300px; padding:10px; margin-bottom:20px">
						<option value="김상찬">김상찬</option>
						<option value="서범수">서범수</option>
						<option value="박재영">박재영</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>
					<label>강좌명 : </label><input type="text" id="classTitle" name="classTitle">
					</td>
				</tr>
				<tr>
					<td>
					<label>정원 : <input type="number" id="numOfClass" name="numOfClass"></label><br>
					</td>
				</tr>
				<tr>
					<td>
					<label>기간 : </label>
					<input type="date" id="dateOfClass" name="dateOfClass">
					</td>
				</tr>
				<tr>
					<td>
					<label>요일 : </label>
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
					<td>
					<label for="classroom">강의실 : </label>
					<select id="classroom" name="classroom" style="width:300px; padding:10px; margin-bottom:20px">
						<option>A</option>
						<option>B</option>
						<option>C</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>
						<label for="classTime">강의 시간 : </label>
						<select id="classTime" style="width:300px; padding:10px; margin-bottom:20px">
							<option>15:00 ~ 16:00</option>
							<option>16:00 ~ 17:00</option>
							<option>17:00 ~ 18:00</option>
						</select>
					</td>
				</tr> 	
				<tr>
					<td>
						<label>수업료 : </label>
						<input type="number" id="money">
					</td>
				</tr>	
			</table>
		<div class="bottomArea">
			<button type="button" onclick="deleteClass();">강좌 삭제</button>
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
</body>
</html>