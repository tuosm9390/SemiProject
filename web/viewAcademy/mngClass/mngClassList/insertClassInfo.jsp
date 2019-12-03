<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../common/menubar.jsp" %>
	<div class="header">
		<h2 align="center">수업 정보 등록</h2>		
	</div>	<!-- header end -->
	<div class="body" align="center">
		<form id="classInfo" action="" method="post">
			<table>
				<tr>
					<td>
					<label>과목 : <input type="text" id="subject"></label>
					</td>
				</tr>
				<tr>
					<td>
					<label>담당 강사 : </label>
					<select>
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
					<select id="classroom" name="classroom">
						<option>A</option>
						<option>B</option>
						<option>C</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>
						<label>강의 시간 : </label>
						<select>
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
		</form>
		<input type="reset" value="취소" onclick="location.href='<%=request.getContextPath()%>/viewAcademy/mngClass/classInfo.jsp'">
		<input type="submit" id="insertClassInfoBtn" value="등록">
	</div> <!-- body end -->
</body>
</html>