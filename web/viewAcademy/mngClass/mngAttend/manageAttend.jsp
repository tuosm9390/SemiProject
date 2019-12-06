<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		font-family: "Nanum Gothic";
	}
	#head > button, input{
		float:right;
	}
	#head > select {
		float:left;
	}
	
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<%@ include file="/viewAcademy/common/menubar.jsp" %>
	<%-- <%= if(loginUser.getUserId() == "admin") { %> --%>
	<div id="head">
		<h2>출결 관리</h2>
		<select>
			<option value="" selected disabled hidden>기간별 검색</option>
			<option value="year">2019</option>
			<option value="year">2018</option>
		</select>
		<button id="writeClass" style="margin:10px; border:1px solid green; background:white; color:black; display:inline" onclick="location.href='insertClassInfo.jsp'">입력</button>
		<button id="searchClass" style="margin:10px; border:1px solid green; background:white; color:black; display:inline">검색</button>
		<input type="search" id="searchClass" name="searchClass">
		<select style="float:right">
			<option value="" selected disabled hidden>조건별 검색</option>
			<option name="searchClassCondition">과목</option>
			<option name="searchClassCondition">강좌명</option>
			<option name="searchClassCondition">담당 강사</option>
		</select>
		<form>
			<table id="classList" class="table">
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
						<td class="user-name">1</td>
						<td>수학</td>
						<td class="user-email" >수학 기초반1</td>
						<td class="user-phone">김상찬</td>
						<td class="user-mobile">고등학교 1학년</td>
						<td>30명</td>
						<td>2019.12.01 ~ 2020.02.28</td>
					</tr>
					<tr>
						<td class="user-name">2</td>
						<td>수학</td>
						<td class="user-email" >수학 기초반2</td>
						<td class="user-phone">남윤진</td>
						<td class="user-mobile">고등학교 1학년</td>
						<td>30명</td>
						<td>2019.12.01 ~ 2020.02.28</td>
					</tr>
					<tr>
						<td class="user-name">3</td>
						<td>영어</td>
						<td class="user-email" >영어 ABC 클래스-오전</td>
						<td class="user-phone">문혜린</td>
						<td class="user-mobile">고등학교 1학년</td>
						<td>30명</td>
						<td>2019.12.01 ~ 2020.02.28</td>
					</tr>
					<tr>
						<td class="user-name">4</td>
						<td>영어</td>
						<td class="user-email" >영어 ABC 클래스-오후</td>
						<td class="user-phone">문혜린</td>
						<td class="user-mobile">고등학교 1학년</td>
						<td>30명</td>
						<td>2019.12.01 ~ 2020.02.28</td>
					</tr>
					<tr>
						<td class="user-name">5</td>
						<td>기타</td>
						<td class="user-email" >여름방학 고2 선행 특강</td>
						<td class="user-phone">박상준</td>
						<td class="user-mobile">고등학교 1학년</td>
						<td>30명</td>
						<td>2019.12.01 ~ 2020.02.28</td>
					</tr>
					<tr>
						<td class="user-name">6</td>
						<td>기타</td>
						<td class="user-email" >고3 수능 직전 벼락치기반</td>
						<td class="user-phone">박재영</td>
						<td class="user-mobile">고등학교 1학년</td>
						<td>30명</td>
						<td>2019.12.01 ~ 2020.02.28</td>
					</tr>
					<tr>
						<td class="user-name">7</td>
						<td>과학</td>
						<td class="user-email">과학 내신 대비반</td>
						<td class="user-phone">서범수</td>
						<td class="user-mobile">고등학교 1학년</td>
						<td>30명</td>
						<td>2019.12.01 ~ 2020.02.28</td>
					</tr>
					<tr>
						<td class="user-name">8</td>
						<td class="user-email" ></td>
						<td class="user-phone">(724)-705-3555</td>
						<td class="user-mobile">고등학교 1학년</td>
						<td>30명</td>
						<td>2019.12.01 ~ 2020.02.28</td>
					</tr>
					<tr>
						<td class="user-name">9</td>
						<td class="user-email" ></td>
						<td class="user-phone">(774)-205-7754</td>
						<td class="user-mobile">고등학교 1학년</td>
						<td>30명</td>
						<td>2019.12.01 ~ 2020.02.28</td>
					</tr>
					<tr>
						<td class="user-name">10</td>
						<td class="user-email" ></td>
						<td class="user-phone">(723)-243-7706</td>
						<td class="user-mobile">고등학교 1학년</td>
						<td>30명</td>
						<td>2019.12.01 ~ 2020.02.28</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div> <!-- head end -->
	<%-- <% }else { %>
	<!-- 로그인 유저가 강사일 경우 -->
	<div id="head">
		<h2 align="center">출결 관리</h2>
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
			<table>
				<thead>
					<tr>
						<th>No.</th>
						<th>과목</th>
						<th>강좌명</th>
						<th>기간</th>
						<th>강의실</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td class="user-name">1</td>
						<td class="user-email">고등 입시 국어</td>
						<td class="user-phone">2019.11.10~2020.03.21</td>
						<td class="user-mobile">2층 C클래스</td>
					</tr>
					<tr>
						<td class="user-name">2</td>
						<td class="user-email">중등 영어</td>
						<td class="user-phone">2019.11.02~2020.03.21</td>
						<td class="user-mobile">1층 B클래스</td>
					</tr>
					<tr>
						<td class="user-name">3</td>
						<td class="user-email">김상찬 수학교실</td>
						<td class="user-phone">2019.09.01~2020.03.21</td>
						<td class="user-mobile">3층 A클래스</td>
					</tr>
					<tr>
						<td class="user-name">4</td>
						<td class="user-email"></td>
						<td class="user-phone"></td>
						<td class="user-mobile"></td>
					</tr>
					<tr>
						<td class="user-name">5</td>
						<td class="user-email"></td>
						<td class="user-phone"></td>
						<td class="user-mobile"></td>
					</tr>
					<tr>
						<td class="user-name"></td>
						<td class="user-email"></td>
						<td class="user-phone"></td>
						<td class="user-mobile"></td>
					</tr>
					<tr>
						<td class="user-name"></td>
						<td class="user-email"></td>
						<td class="user-phone"></td>
						<td class="user-mobile"></td>
					</tr>
					<tr>
						<td class="user-name"></td>
						<td class="user-email" ></td>
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
	</div> <!-- head end -->
	<% } %> --%>
	<script>
		$(function(){
			$("#classList td").mouseenter(function(){
				$(this).parent().css("cursor","pointer");
			}).click(function(){
				<%-- var num = $(this).parent().children().eq(0).text();
				
				location.href="<%=request.getContextPath()%>/selectOne.at?num=" + num; --%>
				location.href="<%=request.getContextPath()%>/viewAcademy/mngClass/mngAttend/attendDetail.jsp";
			})
		});
	</script>
</body>
</html>