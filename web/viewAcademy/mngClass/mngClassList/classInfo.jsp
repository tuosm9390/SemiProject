<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	.listArea {
		width: 90%;
		margin-left: auto;
		margin-right: auto;
	}
	
	.classDetailBottom > button {
		display:inline-block;
	}
	
	/* 모달 배경 */
	.modal {
		display: none; /* Hidden by default */
		position: fixed; /* Stay in place */
		z-index: 1; /* Sit on top */
		left: 0;
		top: 0;
		width: 100%; /* Full width */
		height: 100%; /* Full height */
		overflow: auto; /* Enable scroll if needed */
		background-color: rgb(0, 0, 0); /* Fallback color */
		background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	}
	
	/* 모달 내부 상자 */
	.modal-content {
		background-color: #fefefe;
		margin: 13% auto; /* 15% from the top and centered */
		padding: 40px;
		border: 1px solid #888;
		width: 35%;
		background-color: #fefefe;
		/* Could be more or less, depending on screen size */
	}
	/* 모달 닫기 버튼 */
	#xBtn {
		color: #aaa;
		float: right;
		font-size: 28px;
		font-weight: bold;
	}
	
	#xBtn:hover, #xBtn:focus {
		color: black;
		text-decoration: none;
		cursor: pointer;
	}
	
	#modalTable td {
		padding: 10px;
		border: 1px solid lightgray;
		text-align: center;		
	}
	
	#modalTable td {
		text-weight: bold;
	}
	
	#modalBtnTable {
		margin-top: 20px;
	}
	
	fieldset {
		width:16%;
	}
	
	#searchBtn, #writeBtn, #classroomBtn {
		font-size: 18px;
		margin-left: 1%;
		margin-bottom: 1%;
		font-family: "Nanum Gothic";
		font-weight: bold;
		border: 2px solid green;
		display: inline;
		float: right;
	}
	
	#searchBtn:hover, #writeBtn:hover, #classroomBtn:hover {
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
		<%@ include file="../../common/menubar.jsp" %>
	</header>
	<section>
	<div class="listArea">
		<div align="center">
      		<fieldset style="margin-top:-25px; margin-bottom:-30px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;">
         		<legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">&nbsp;강좌 관리&nbsp;</h1></legend>
      		</fieldset>
      	</div>
		<select>
			<option value="" selected disabled hidden>기간별 검색</option>
			<option value="year">2019</option>
			<option value="year">2018</option>
		</select>
		<button id="writeBtn" onclick="location.href='insertClassInfo.jsp'">입력</button>
		<button id="searchBtn">검색</button>
		<input type="search" id="searchClass" name="searchClass">
				<select style="float:right">
			<option value="" selected disabled hidden>조건별 검색</option>
			<option name="searchClassCondition">과목</option>
			<option name="searchClassCondition">강좌명</option>
			<option name="searchClassCondition">담당 강사</option>
		</select>
			<table class="classInfoTable table">
				<thead>
					<tr>
						<th>No.</th>
						<th>과목</th>
						<th>강좌명</th>
						<th>담당 강사</th>
						<th>대상 학생</th>
						<th>정원</th>
						<th>기간</th>
					</tr>
				</thead>
				<tbody>
					<% for(int i=0; i<10; i++) { %>
					<tr>
						<td><%= i+1 %></td>
						<td>수학</td>
						<td>수학 기초반1</td>
						<td>김상찬</td>
						<td>중1</td>
						<td>30명</td>
						<td>2019.12.06~2020.02.28</td>
					</tr>
					<% } %>
				</tbody>
			</table>
		</form>
		<button id="classroomBtn" style="margin-bottom:3%;">강의실 관리</button>
	</div> <!-- listArea end -->

	<!-- 강좌 상세정보 모달 -->
	<div id="detailClassInfo" class="modal">
		<div class="modal-content" align="center">
			<span id="xBtn">&times;</span>
			<h2>강좌 정보 확인</h2>
			<table id="modalTable">
				<tr>
					<td width="100px">과목</td>
					<td width="250px">국어</td>
				</tr>
				<tr>
					<td>강좌명</td>
					<td>국어의 숲</td>
				</tr>
				<tr>
					<td>담당 강사</td>
					<td>김상찬</td>
				</tr>
				<tr>
					<td>대상 학생</td>
					<td>고등국어 / 3학년</td>
				</tr>
				<tr>
					<td>정원</td>
					<td>30명</td>
				</tr>
				<tr>
					<td>기간</td>
					<td>2019.12.01 ~ 2020.02.28</td>
				</tr>
				<tr>
					<td>강의 시간</td>
					<td>15:00 ~ 17:00</td>
				</tr>
				<tr>
					<td>수업료</td>
					<td>300,000원</td>
				</tr>
			</table>
			<table id="modalBtnTable">
				<tr>
					<td colspan="2">
						<button id="deleteBtn"
							style="display: inline; margin-left: 20px; width: 100px; height: 30px;">삭제</button>
						<button type="button" id="updateBtn"
							style="display: inline; width: 100px; height: 30px;">수정</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<!-- detailClassInfo end -->

		<script>
		$(function(){
			$(".classInfoTable td").mouseenter(function(){
				$(this).parent().css("cursor","pointer");
			}).click(function(){
				<%-- var num = $(this).parent().children().eq(0).text();
				
				location.href="<%=request.getContextPath()%>/selectOne.at?num=" + num; --%>
				
				var modal = document.getElementById("detailClassInfo");
				modal.style.display = "block";
				
				var closeBtn = document.getElementById('xBtn');
				var deleteBtn = document.getElementById('deleteBtn');
				var updateBtn = document.getElementById('updateBtn');
				closeBtn.onclick = function() {
					modal.style.display = "none";
				}
				deleteBtn.onclick = function() {
					var form = document.getElementById("classInfo");
			
					swal({
						title: "강좌 삭제",
						text: "강좌 정보를 영구적으로 삭제하시겠습니까?",
						icon: "warning",
			    		buttons : [ "취소", "삭제" ],
			    		dangerMode: true,
			    	}).then(function(isConfirm) {
			    		if(isConfirm) {
			    			console.log("삭제가 먼저 되고 swal 떠야돼");
			    			//딜리트 서블릿으로 이동 후 결과에 따라 페이지 요청
			    			swal ({
			    				title: "삭제되었습니다.",
			    				icon: "success"
			    			})
			    		}else {
			    			swal ("강좌 삭제가 취소되었습니다.");
			    		}
			    	});
					
					modal.style.display = "none";
					
				}
				updateBtn.onclick = function() {
					//업데이트 서블릿으로 이등 후 결과에 따라 페이지 요청
					/* modal.style.display = "none"; */
					console.log('이동이 안돼요');
					location.href="<%=request.getContextPath()%>/viewAcademy/mngClass/mngClassList/updateClassInfo.jsp";
				}

			});
	
		});
	</script>
	</section>
	<footer></footer>
</body>
</html>