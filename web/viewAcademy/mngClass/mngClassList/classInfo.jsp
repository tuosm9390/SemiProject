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
	#head>button, input {
		float: right;
	}
	
	#head>select {
		float: left;
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
		width: 30%;
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
</style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp" %>
	<div id="head">
		<h2>강좌 정보 관리</h2>
		<select>
			<option value="" selected disabled hidden>기간별 검색</option>
			<option value="year">2019</option>
			<option value="year">2018</option>
		</select>
		<button id="searchClass" style="margin:10px; border:1px solid green; background:white; color:black; display:inline">검색</button>
		<button id="writeClass" style="margin:10px; border:1px solid green; background:white; color:black; display:inline" onclick="location.href='insertClassInfo.jsp'">입력</button>
		<input type="search" id="searchClass" name="searchClass">
				<select style="float:right">
			<option value="" selected disabled hidden>조건별 검색</option>
			<option name="searchClassCondition">과목</option>
			<option name="searchClassCondition">강좌명</option>
			<option name="searchClassCondition">담당 강사</option>
		</select>
		<form>
			<table id="classInfoTable" class="table">
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
					<tr>
						<td class="user-name">주요 이슈</td>
						<td class="user-email" >수학 기초반1</td>
						<td class="user-phone">(398)-332-5385</td>
						<td class="user-mobile">(888)-677-3719</td>
					</tr>
					<tr>
						<td class="user-name">입시</td>
						<td class="user-email" >수학 기초반2</td>
						<td class="user-phone">(293)-873-2247</td>
						<td class="user-mobile">(216)-889-4933</td>
					</tr>
					<tr>
						<td class="user-name">중등</td>
						<td class="user-email" >영어 ABC 클래스-오전</td>
						<td class="user-phone">(957)-213-3499</td>
						<td class="user-mobile">(207)-516-4474</td>
					</tr>
					<tr>
						<td class="user-name">고등</td>
						<td class="user-email" >영어 ABC 클래스-오후</td>
						<td class="user-phone">(897)-762-9782</td>
						<td class="user-mobile">(565)-627-3002</td>
					</tr>
					<tr>
						<td class="user-name">중.고 경시</td>
						<td class="user-email" >여름방학 고2 선행 특강</td>
						<td class="user-phone">(231)-391-6269</td>
						<td class="user-mobile">(790)-838-2130</td>
					</tr>
					<tr>
						<td class="user-name">행사</td>
						<td class="user-email" >고3 수능 직전 벼락치기반</td>
						<td class="user-phone">(204)-488-5204</td>
						<td class="user-mobile">(508)-463-6811</td>
					</tr>
					<tr>
						<td class="user-name"></td>
						<td class="user-email" ></td>
						<td class="user-phone">(436)-578-2946</td>
						<td class="user-mobile">(906)-412-3302</td>
					</tr>
					<tr>
						<td class="user-name"></td>
						<td class="user-email"></td>
						<td class="user-phone">(724)-705-3555</td>
						<td class="user-mobile">(764)-841-2531</td>
					</tr>
					<tr>
						<td class="user-name"></td>
						<td class="user-email" ></td>
						<td class="user-phone">(774)-205-7754</td>
						<td class="user-mobile">(639)-267-9728</td>
					</tr>
					<tr>
						<td class="user-name"></td>
						<td class="user-email" ></td>
						<td class="user-phone">(723)-243-7706</td>
						<td class="user-mobile">(172)-597-3422</td>
					</tr>
				</tbody>
			</table>
		</form>
		<button>강의실 관리</button>
	</div>
	
	<!-- 모달 -->
	<div id="detailClassInfo" class="modal">

		<div class="modal-content" align="center">
			<span id="xBtn">&times;</span>
			<h2 style="margin-left: 15px;">강좌 정보 확인</h2>
			<div class="classDetail" align="center">
				<form>
					<table>
						<tr>
							<td>과목 : </td><td>국어</td>
						</tr>
						<tr>
							<td>강좌명 : </td><td>국어의 숲</td>
						</tr>
						<tr>
							<td>담당 강사 : </td><td>김상찬</td>
						</tr>
						<tr>
							<td>대상 학생 : </td><td>고등국어 / 3학년</td>
						</tr>
						<tr>
							<td>정원 : </td><td>30명</td>
						</tr>
						<tr>
							<td>기간 : </td><td>2019.12.01 ~ 2020.02.28</td>
						</tr>
						<tr>
							<td>강의 시간 : </td><td>15:00 ~ 17:00</td>
						</tr>
						<tr>
							<td>수업료 : </td><td>300,000원</td>
						</tr>
						<tr>
							<td>
							<button id="deleteBtn" style="margin-top:20px; margin-left:60px; width: 100px; height: 30px; float:right;">삭제</button>
							</td>						
							<td>
							<button type="button" id="updateBtn" style="margin-top:20px; width: 100px; height: 30px; float:left;">수정</button>
							</td>
						</tr>
					</table>
				</form>
				
			</div> <!-- classDetail end -->
		</div>
	</div> <!-- detailClassInfo end -->
	
	<script>
		$(function(){
			$("#classInfoTable td").mouseenter(function(){
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
					//딜리트 서블릿으로 이동 후 결과에 따라 페이지 요청
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
</body>
</html>