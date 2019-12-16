<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, hagong.academy.commonMenu.info.model.vo.*"%>
<%
	ArrayList<UserDetail> userDetail = (ArrayList<UserDetail>) request.getAttribute("userDetail");

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
		userDetail.get(0).setEmail("");
	}
	if(userDetail.get(0).getAddress() == null) {
		userDetail.get(0).setAddress("");
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
	background:url("/hagong/images/backModifySample.png") no-repeat top;
	background-size:cover;
}
	
tr {
	background: none !important;
}

td {
	text-align: left !important;
}

label {
	color:black;
}

input, select {
	border: 1px solid lightgray;
	border-radius: 5px;
	height: 30px;
}

input[readonly], input[readonly]:focus {
	background: none;
	border: none;
	outline: none;
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

.delete {
	display: inline;
}

#profile {
	width: 200px;
	height: 200px;
	border-radius: 50%;
}

#userId {
	width: 300px;
}

#address {
	width: 500px;
}

#deleteBtn {
	border-color: red;
}

#deleteBtn:hover {
	background: red;
	color: white;
}

fieldset {
	width: 80%;
}

select {
	border-style: none;
	background: none;
}

.deleteFile {
	display: inline;
}

.redText{display: block;color: red;margin-left:10px;font-family:"Nanum Gothic";}
.greenText{display: block;color: green;margin-left:10px;font-family:"Nanum Gothic";}
</style>
</head>
<body>
	<header>
		<%@ include file="../common/menubar.jsp"%>
	</header>
	<section>
		<div align="center">
			<fieldset style="border-left:none; border-right:none; border-bottom:none; border-top-color:black;">
				<legend align="center" style="font-family:'Do Hyeon';"><h1>　개인정보 수정　</h1></legend>
				<div class="outArea">
					<form id="updateForm" action="<%= request.getContextPath() %>/aupdate.ps" method="post" encType="multipart/form-data">
					<table class="table">
						<tr>
							<td rowspan="5" width="10%"><div align="center"><img id="profile" src="<%= request.getContextPath() %>/images/user.png"></div></td>
							<td width="40%"><li>ID</li></td>
							<td width="40%"><input type="text" name="userId" id="userId" value="<%= userDetail.get(0).getUserId() %>" readonly></td>
							<td width="10%"></td>
						</tr>
						<tr>
							<input type="hidden" name="userNo" value="<%= userDetail.get(0).getUserNo() %>">
							<td><li>이름</li></td>
							<td colspan="2"><input type="text" name="userName" id="userName" value="<%= userDetail.get(0).getName() %>" readonly></td>
						</tr>
						<tr>
							<td><li>비밀번호</li></td>
							<td colspan="2"><input type="password" name="userPwd" id="userPwd">
							<span id="pwdSpan" class="redText"></span></td>
						</tr>
						<tr>
							<td><li>비밀번호 확인</li></td>
							<td colspan="2"><input type="password" name="userPwdCk" id="userPwdCk">
							<span id="pwdCkSpan" class="redText"></span></td>
						</tr>
						<tr>
							<td><li>생년월일</li></td>
							<td colspan="2"><label><%= userDetail.get(0).getBirth() %></label></td>
						</tr>
						<tr>
							<% String[] tel = userDetail.get(0).getPhone().split("-"); %>
							<td><div align="center"><button id="imgBtn" type="button">사진 변경</button></div><input type="file" id="imgFile" name="imgFile" onchange="loadImg(this)"></td>
							<td><li>전화번호</li></td>
							<td colspan="2"><input type="tel" maxlength="3" size="4" name="tel1" value="<%= tel[0] %>"> - 
							    			<input type="tel" maxlength="4" size="4" name="tel2" value="<%= tel[1] %>"> - 
							    			<input type="tel" maxlength="4" size="4" name="tel3" value="<%= tel[2] %>"></td>
						</tr>
						<tr>
							<td></td>
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
							<td colspan="2"><input type="email" name="email" id="email" value="<%= userDetail.get(0).getEmail() %>">
							<span id="emailSpan" class="redText"></span></td>
						</tr>
						<tr>
							<td></td>
							<td><li>주소</li></td>
							<td colspan="2"><input type="text" name="address" id="address" value="<%= userDetail.get(0).getAddress() %>"></td>
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
							<td>⦁　급여 계약서&nbsp;</td>
							<td colspan="2">
								<% for(int i = 0; i < pay.size(); i++) { %>
								<div class="deletePay" id="deletePay<%= i + 100 %>" display="block">
									<input type="hidden" id="prePayfile<%= i %>" value="<%= payReal.get(i) %>">
									<label id="deletePay<%= i + 100 %>"><%= pay.get(i) %></label>&nbsp;
								</div>
								<% } %>
							</td>
						</tr>
						
						<tr>
							<td></td>
							<td>⦁　경력 등　<br>　기타 서류　<button type="button" id="docBtn" style="display:inline-block; font-size:15px;">파일 추가</button>
								<input type="file" id="docFile1" name="docFile1" onchange="loadFile(this)"></td>
							<td colspan="3">
								<% for(int i = 0; i < doc.size(); i++) { %>
								<div id="deleteDoc<%= i + 100 %>" display="block">
									<input type="hidden" id="preDocfile<%= i %>" value="<%= docReal.get(i) %>">
									<label id="deleteDoc<%= i + 100 %>"><%= doc.get(i) %></label>&nbsp;
								</div>
								<% } %>
								<input type="hidden" id="docFiles">
							</td>
						</tr>
						<tr>
							<td></td>
							<td colspan="3">
								<div class="btnArea" align="center">
									<button type="button" class="bottomBtn" onclick="doCancel();">취소</button>
									<button type="button" class="bottomBtn" onclick="doModify();">수정 완료</button>
								</div> <!-- btnArea end -->
							</td>
						</tr>
					</table>		
					</form>
				</div> <!-- outArea end -->
			</fieldset>
		</div>
		<script>
			docCnt = 1;
		
			function loadImg(value) {
				if(value.files && value.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$("#profile").attr("src", e.target.result);
						$("#profile").css({"border-radius":"50%"})
					};
					reader.readAsDataURL(value.files[0]);
				}
			}
			
			function loadFile(value) {
				var fileName = $(value).val();
				var last = fileName.lastIndexOf("\\");
				if(value.files && value.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e){
						docCnt++;
						$inputFile = $("<input type='file' name='docFile" + docCnt + "' id='docFile" + docCnt + "' onchange='loadFile(this)'>");
						$("#docFile" + (docCnt - 1)).after($inputFile);
						$("#docFiles").before("<div id=\"deleteDoc" + (docCnt - 1) + "\" display=\"block\"><label>" + fileName.substr(last + 1, fileName.length) + "　</label><button id=\"deleteDocFile" + (docCnt - 1) + "\" type=\"button\" class=\"deleteFile\" onclick=\"deleteDocfile(this, " + (docCnt - 1) + ");\">-</button></div>");
					};
				}
				reader.readAsDataURL(value.files[0]);
			}
			
			function deleteDocfile(value, num) {
				$(value).remove();
				$("#deleteDoc" + num).remove();
				$("#docFile" + num).remove();
			}
			
			$("#userPwd").keyup(function(event){
				var userPwd = $("#userPwd").val();

				var pw = userPwd;
				var num = pw.search(/[0-9]/g);
				var eng = pw.search(/[a-z]/ig);
				var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
				if(pw.length < 8 || pw.length > 20){
					$("#pwdSpan").removeClass('greenText').addClass('redText');
					$("#pwdSpan").text("비밀번호는 8~20자 사이로 설정해 주세요.");
				} else if(pw.search(/₩s/) != -1){
					$("#pwdSpan").removeClass('greenText').addClass('redText');
					$("#pwdSpan").text("비밀번호는 공백 없이 설정해 주세요.");
				} else if(num < 0 || eng < 0 || spe < 0 ){
					$("#pwdSpan").removeClass('greenText').addClass('redText');
					$("#pwdSpan").text("비밀번호는 영문자,숫자,특수문자를 혼합해 설정해 주세요.");
				} else {
					$("#pwdSpan").removeClass('redText').addClass('greenText');
					$("#pwdSpan").text("");
				}
			});
			
			$("#userPwdCk").keyup(function(event){
				var userPwd = $("#userPwdCk").val();
				var check = $("#userPwd").val();
				if(userPwd === check){
					$("#pwdCkSpan").removeClass('redText').addClass('greenText');
					$("#pwdCkSpan").text("");
				} else {
					$("#pwdCkSpan").removeClass('greenText').addClass('redText');
					$("#pwdCkSpan").text("비밀번호가 일치하지 않습니다.");
				}
			});
			
			$("#email").keyup(function(event){
				var email = $("#email").val();
				var check = /(\w{4,})@(\w{1,})\.(\w{1,3})/ig;
				if(check.test(email)){
					$("#emailSpan").removeClass('redText').addClass('greenText');
					$("#emailSpan").text("");
				} else {
					$("#emailSpan").removeClass('greenText').addClass('redText');
					$("#emailSpan").text("부적합한 Email 입니다. 다시 설정해 주세요!");
				}
			});
				
		    $("input[type='tel']").keyup(function(event) {
		       var inputVal = $(this).val();
		       $(this).val(inputVal.replace(/[^0-9]/gi, ''));
		    });
		
			$(function(){
				$("#imgBtn").click(function(){
					$("#imgFile").click();
				});
				0
				$("#docBtn").click(function(){
					$("#docFile" + docCnt).click();
				});
				
				$("option").each(function(){
					if($(this).val() === "<%= userDetail.get(0).getDept() %>") {
						$(this).attr("selected", true);
					}
				});
				
				if("<%= profile %>" === " ") {
				} else {
					$("#profile").attr("src", "<%=request.getContextPath()%>/uploadFiles/<%= profile %>");
				}
				
				$("#datepicker").datepicker(
						{
							dateFormat : 'yy-mm-dd',
							prevText : '이전 달',
							nextText : '다음 달',
							monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
									'7월', '8월', '9월', '10월', '11월', '12월' ],
							monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
									'7월', '8월', '9월', '10월', '11월', '12월' ],
							dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
							dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
							dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
							showMonthAfterYear : true,
							changeMonth : true,
							changeYear : true,
							constrainInput : false,
							yearSuffix : '년',
							yearRange : 'c-20:c'
						});
			});
			
			function doModify(){
				if(window.confirm("정말로 수정하시겠습니까?")) {
					if($("#pwdSpan").prop("class") === "redText") {
						alert("부적합한 비밀번호 입니다.");
					} else if($("#pwdCkSpan").prop("class") === "redText") {
						alert("비밀번호 확인이 틀렸습니다.");
					} else if($("#tel1").val() === "" || $("#tel2").val() === "" || $("#tel3").val() === "") {
						alert("전화번호를 확인해 주세요.");
					} else {
						$("#updateForm").submit();
					}
				}
			}
			
			function doCancel(){
				if(window.confirm("수정을 취소하시겠습니까?")) {
					location.href = "<%= request.getContextPath() %>/viewAcademy/commonMenu/viewUserInfo.jsp";
				}
			}
		</script>
	</section>
	<footer>
	</footer>
</body>
</html> 