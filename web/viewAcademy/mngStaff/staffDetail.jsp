<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, hagong.academy.mngStaff.model.vo.*"%>
<%
	ArrayList<StaffDetail> staffDetail = (ArrayList<StaffDetail>) request.getAttribute("staffDetail");

	String profile = "";
	ArrayList<String> pay = new ArrayList<>(); ArrayList<Integer> payReal = new ArrayList<>();
	ArrayList<String> doc = new ArrayList<>(); ArrayList<Integer> docReal = new ArrayList<>();
	for(int i = 0; i < staffDetail.size(); i++) {
		if(staffDetail.get(i).getFileType().equals("PROFILE")) {
			profile = staffDetail.get(i).getChangeName();
		} else if(staffDetail.get(i).getFileType().equals("ASSIGN")) {
			pay.add(staffDetail.get(i).getOriginName());
			payReal.add(staffDetail.get(i).getFileNo());
		} else {
			doc.add(staffDetail.get(i).getOriginName());
			docReal.add(staffDetail.get(i).getFileNo());
		}
	}
	
	if(staffDetail.get(0).getEmail() == null) {
		staffDetail.get(0).setEmail("(입력 없음)");
	}
	if(staffDetail.get(0).getAddress() == null) {
		staffDetail.get(0).setAddress("(입력 없음)");
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
	background:url("/hagong/images/backInfo.jpg") no-repeat top;
	background-size:cover;
}

tr {
	background: none !important;
}

td {
	text-align: left !important;
}

label, input, select, input:focus, select:focus {
	background:none;
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
</style>
</head>
<body>
	<header>
		<%@ include file="../common/menubar.jsp"%>
	</header>
	<section>
		<div align="center">
      		<fieldset style="margin-bottom:-30px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;">
         		<legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">　상세정보　</h1></legend>
         		<div class="outArea">
					<form action="" method="post">
					<table class="table">
						<tr>
							<td rowspan="5" width="10%"><div align="center"><img id="profile" src="<%= request.getContextPath() %>/images/user.png"></div></td>
							<td width="20%"><li>직원 ID</li></td>
							<td width="50%"><input type="text" name="userId" id="userId" value="<%= staffDetail.get(0).getUserId() %>" readonly></td>
							<td width="10%"></td>
						</tr>
						<tr>
							<td><li>이름</li></td>
							<td colspan="2"><input type="text" name="userName" id="userName" value="<%= staffDetail.get(0).getName() %>"></td>
						</tr>
						<tr>
							<td><li>생년월일</li></td>
							<td colspan="2"><label><%= staffDetail.get(0).getBirth() %>　　　(　<%= staffDetail.get(0).getAge() %> 세　)</label></td>
						</tr>
						<tr>
							<% String[] tel = staffDetail.get(0).getPhone().split("-"); %>
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
							<td colspan="2"><input type="email" name="email" id="email" value="<%= staffDetail.get(0).getEmail() %>" readonly></td>
						</tr>
						<tr>
							<td></td>
							<td><li>주소</li></td>
							<td colspan="2"><input type="text" name="address" id="address" value="<%= staffDetail.get(0).getAddress() %>" readonly></td>
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
								<% for(int i = 0; i < pay.size(); i++) { 
									String pr = payReal.get(i) + "";
								%>
									<label><%= pay.get(i) %></label>&nbsp;
									<%-- <button class="download" onclick="location.href='<%=request.getContextPath()%>/down.staff?num=<%=payReal.get(i)%>'">다운로드</button><br> --%>
									<button class="download" type="button" onclick="downloadFile(<%= pr %>)">다운로드</button><br>
								<% } %>
							</td>
						</tr>
						<tr>
							<td></td>
							<td><li>경력 등 기타 서류</li></td>
							<td colspan="2">
								<% for(int i = 0; i < doc.size(); i++) { %>
									<label><%= doc.get(i) %></label>&nbsp;
									<%-- <button class="download" onclick="location.href='<%=request.getContextPath()%>/down.staff?num=<%=docReal.get(i)%>'">다운로드</button><br> --%>
									<button class="download" onclick="downloadFile(<%=docReal.get(i)%>)">다운로드</button><br>
								<% } %>
							</td>
						</tr>
						<tr>
							<td></td>
							<td colspan="3">
								<div class="btnArea" align="center">
									<button type="button" class="bottomBtn" onclick="goModify();">수정</button>
									<button type="button" class="bottomBtn" onclick="goList();">목록</button>
								</div> <!-- btnArea end -->
							</td>
						</tr>
					</table>		
					</form>
					<br>
				</div> <!-- outArea end -->
      		</fieldset>
      	</div>
		
		<script>
			function goModify(){
				location.href = "<%=request.getContextPath()%>/adetail.staff?type=modify&no=" + <%= staffDetail.get(0).getUserNo() %>;
			}
			
			function goList(){
				location.href = "<%= request.getContextPath() %>/alist.staff";
			}
			
			$(function(){
				$("option").each(function(){
					if($(this).val() === "<%= staffDetail.get(0).getDept() %>") {
						$(this).attr("selected", true);
					}
				});
				
				if("<%= profile %>" === null) {
				} else {
					$("#profile").attr("src", "<%=request.getContextPath()%>/uploadFiles/<%= profile %>");
				}
			});
			
			<%-- function downloadFile(num) {
				$.ajax({
					url: "<%=  request.getContextPath() %>/down.staff",
					type: "post",
					data: {num:num},
					success: function(data){
						console.log("123");
					},
					error: function(data){
						console.log("Failed");
					}
				});
			} --%>
			function downloadFile(num){
				var num = num;
				console.log(num);
			}
		</script>
	</section>
	<footer>
	</footer>
</body>
</html> 