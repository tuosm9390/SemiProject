<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, hagong.academy.commonMenu.info.model.vo.*"%>
<% 
	ArrayList<UserDetail> userDetail = (ArrayList<UserDetail>) request.getAttribute("userDetail");
	System.out.println(userDetail);
	String profile = " ";
	ArrayList<String> pay = new ArrayList<>(); ArrayList<Integer> payReal = new ArrayList<>();
	ArrayList<String> doc = new ArrayList<>(); ArrayList<Integer> docReal = new ArrayList<>();
	for(int i = 0; i < userDetail.size(); i++) {
		if(userDetail.get(i).getFileType().equals("PROFILE")) {
			profile = userDetail.get(i).getChangeName();
		} else if(userDetail.get(i).getFileType().equals("ASSIGN")) {
			pay.add(userDetail.get(i).getOriginName());
			payReal.add(userDetail.get(i).getFileNo());
		} else {
			doc.add(userDetail.get(i).getOriginName());
			docReal.add(userDetail.get(i).getFileNo());
		}
	}
	
	if(userDetail.get(0).getEmail() == null) {
		userDetail.get(0).setEmail("(입력 없음)");
	}
	if(userDetail.get(0).getAddress() == null) {
		userDetail.get(0).setAddress("(입력 없음)");
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
section {
	background: url("/hagong/images/backModifySample.png") no-repeat top;
	background-size: cover;
}

tr {
	background: none !important;
}

td {
	text-align: left !important;
}

label, input, select, input:focus, select:focus {
	background: none;
	border: none;
	outline: none;
	border-radius: 5px;
	height: 30px;
	color: black;
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
	height: 30px;
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

.download {
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

fieldset {
	width: 80%;
}

img {
	border-radius:50%;
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
				<legend align="center" style="font-family:'Do Hyeon';"><h1>　<%= userDetail.get(0).getName() %> 님의 개인정보　</h1></legend>
				<div class="outArea">
					<table class="table">
						<tr>
							<td rowspan="5" width="10%"><div align="center"><img id="profile" src="<%= request.getContextPath() %>/images/user.png"></div></td>
							<td width="20%"><li>ID</li></td>
							<td width="50%"><input type="text" name="userId" id="userId" value="<%= userDetail.get(0).getUserId() %>" readonly></td>
							<td width="10%"></td>
						</tr>
						<tr>
							<td><li>이름</li></td>
							<td colspan="2"><input type="text" name="userName" id="userName" value="<%= userDetail.get(0).getName() %>"></td>
						</tr>
						<tr>
							<td><li>생년월일</li></td>
							<td colspan="2"><label><%= userDetail.get(0).getBirth() %></label></td>
						</tr>
						<tr>
							<% String[] tel = userDetail.get(0).getPhone().split("-"); %>
							<td><li>전화번호</li></td>
							<td colspan="2"><input type="text" maxlength="3" size="4" name="tel1" value="<%= tel[0] %>" readonly> - 
							    			<input type="text" maxlength="4" size="4" name="tel2" value="<%= tel[1] %>" readonly> - 
							    			<input type="text" maxlength="4" size="4" name="tel3" value="<%= tel[2] %>" readonly></td>
						</tr>
						<tr>
							<td><li>담당업무</li></td>
							<td colspan="2">
								<select name="subject" disabled>
									<option value="select" hidden>담당업무 선택</option>
									<option value="KOR">국어</option>
									<option value="MATH">수학</option>
									<option value="ENG">영어</option>
									<option value="SOCIAL">사회탐구</option>
									<option value="SCIENCE">과학탐구</option>
									<option value="FOREIGN">제2외국어</option>
									<option value="DESK">행정</option>
									<option value="APPLY">입시</option>
								</select>
							</td>
						</tr>
						<tr>
							<td></td>
							<td><li>이메일</li></td>
							<td colspan="2"><input type="email" name="email" id="email" value="<%= userDetail.get(0).getEmail() %>" readonly></td>
						</tr>
						<tr>
							<td></td>
							<td><li>주소</li></td>
							<td colspan="2"><input type="text" name="address" id="address" value="<%= userDetail.get(0).getAddress() %>" readonly></td>
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
							<td colspan="2">
								<% if(userDetail.get(0).getOriginName() != null) { %>
								<% for(int i = 0; i < pay.size(); i++) { 
								%>
									<label><%= pay.get(i) %></label>&nbsp;
									<button class="download" onclick="location.href='<%=request.getContextPath()%>/down.staff?no=<%=payReal.get(i)%>'">다운로드</button><br>

								<% } %>
							</td>
						</tr>
						<tr>
							<td></td>
							<td><li>경력 등 기타 서류</li></td>
							<td colspan="2">
								<% for(int i = 0; i < doc.size(); i++) { %>
									<label><%= doc.get(i) %></label>&nbsp;
									<button class="download" onclick="location.href='<%=request.getContextPath()%>/down.staff?no=<%=docReal.get(i)%>'">다운로드</button><br>
								<% } %>
								<% } %>
							</td>
						</tr>
						<tr>
							<td></td>
							<td colspan="3">
								<div class="btnArea" align="center">
									<button type="button" class="bottomBtn" onclick="goHome();">메인</button>
									<button type="button" class="bottomBtn" onclick="goModify();">수정</button>
								</div> <!-- btnArea end -->
							</td>
						</tr>
					</table>		
					<br>
				</div> <!-- outArea end -->
			</fieldset>
		</div>
		<script>
			function goModify(){
				location.href = "<%= request.getContextPath() %>/viewAcademy/commonMenu/checkUserPwd.jsp";
			}
			
			function goHome(){
				location.href = "<%=request.getContextPath()%>/allStaff.cm";
			}
			
			$(function(){
				$("select option").each(function(){
					if($(this).val() === "<%= userDetail.get(0).getDept() %>") {
						$(this).attr("selected", true);
					}
				});
				
				if("<%= profile %>" === " ") {
					$("#profile").attr("src", "<%= request.getContextPath() %>/images/user.png");
				} else {
					$("#profile").attr("src", "<%=request.getContextPath()%>/uploadFiles/<%= profile %>");
				}
			});
		</script>
	</section>
	<footer>
	</footer>
</body>
</html> 