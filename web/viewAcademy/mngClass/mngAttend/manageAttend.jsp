<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
		<h2 align="center">출결 관리</h2>
		<select>
			<option value="" selected disabled hidden>기간별 검색</option>
			<option value="year">2019</option>
			<option value="year">2018</option>
		</select>
		<button id="addColsBtn" style="margin:10px; border:1px solid green; background:white; color:black; display:inline; float:left" !important>행 추가</button>
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
			<table id="classList">
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
						<td class="user-email" contenteditable="true">수학 기초반1</td>
						<td class="user-phone">(398)-332-5385</td>
						<td class="user-mobile">(888)-677-3719</td>
					</tr>
					<tr>
						<td class="user-name">입시</td>
						<td class="user-email" contenteditable="true">수학 기초반2</td>
						<td class="user-phone">(293)-873-2247</td>
						<td class="user-mobile">(216)-889-4933</td>
					</tr>
					<tr>
						<td class="user-name">중등</td>
						<td class="user-email" contenteditable="true">영어 ABC 클래스-오전</td>
						<td class="user-phone">(957)-213-3499</td>
						<td class="user-mobile">(207)-516-4474</td>
					</tr>
					<tr>
						<td class="user-name">고등</td>
						<td class="user-email" contenteditable="true">영어 ABC 클래스-오후</td>
						<td class="user-phone">(897)-762-9782</td>
						<td class="user-mobile">(565)-627-3002</td>
					</tr>
					<tr>
						<td class="user-name">중.고 경시</td>
						<td class="user-email" contenteditable="true">여름방학 고2 선행 특강</td>
						<td class="user-phone">(231)-391-6269</td>
						<td class="user-mobile">(790)-838-2130</td>
					</tr>
					<tr>
						<td class="user-name">행사</td>
						<td class="user-email" contenteditable="true">고3 수능 직전 벼락치기반</td>
						<td class="user-phone">(204)-488-5204</td>
						<td class="user-mobile">(508)-463-6811</td>
					</tr>
					<tr>
						<td class="user-name"></td>
						<td class="user-email" contenteditable="true"></td>
						<td class="user-phone">(436)-578-2946</td>
						<td class="user-mobile">(906)-412-3302</td>
					</tr>
					<tr>
						<td class="user-name"></td>
						<td class="user-email" contenteditable="true"></td>
						<td class="user-phone">(724)-705-3555</td>
						<td class="user-mobile">(764)-841-2531</td>
					</tr>
					<tr>
						<td class="user-name"></td>
						<td class="user-email" contenteditable="true"></td>
						<td class="user-phone">(774)-205-7754</td>
						<td class="user-mobile">(639)-267-9728</td>
					</tr>
					<tr>
						<td class="user-name"></td>
						<td class="user-email" contenteditable="true"></td>
						<td class="user-phone">(723)-243-7706</td>
						<td class="user-mobile">(172)-597-3422</td>
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
		<button id="addColsBtn" style="margin:10px; border:1px solid green; background:white; color:black; display:inline; float:left" !important>행 추가</button>
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
						<td class="user-email" contenteditable="true"></td>
						<td class="user-phone">(724)-705-3555</td>
						<td class="user-mobile">(764)-841-2531</td>
					</tr>
					<tr>
						<td class="user-name"></td>
						<td class="user-email" contenteditable="true"></td>
						<td class="user-phone">(774)-205-7754</td>
						<td class="user-mobile">(639)-267-9728</td>
					</tr>
					<tr>
						<td class="user-name"></td>
						<td class="user-email" contenteditable="true"></td>
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
				$(this).parent().css("cursor":"pointer");
			}).click(function(){
				<%-- var num = $(this).parent().children().eq(0).text();
				
				location.href="<%=request.getContextPath()%>/selectOne.bo?num=" + num; --%>
				location.href="<%=request.getContextPath()%>/viewAcademy/mngClass/mngAttend/attendDetail.jsp";
			})
		});
	</script>
</body>
</html>