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
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div id="head">
		<h2 align="center">강좌 정보 관리</h2>
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
	</div>
</body>
</html>