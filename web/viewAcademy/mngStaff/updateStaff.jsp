<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, hagong.academy.mngStaff.model.vo.*"%>
<%
	ArrayList<StaffDetail> staffDetail = (ArrayList<StaffDetail>) request.getAttribute("staffDetail");
 
	String profile = " ";
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
		staffDetail.get(0).setEmail("");
	}
	if(staffDetail.get(0).getAddress() == null) {
		staffDetail.get(0).setAddress("");
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

label {
	color: black;
}

input, select {
	border: 1px solid lightgray;
	border-radius: 5px;
	height: 30px;
}

input[readonly], input[readonly]:focus {
	border: none;
	outline: none;
	background: none;
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

.btnArea {
	display: inline;
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
	radius: 50%;
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

#payBtn, #docBtn {
	background: #f9f3f0;
}

#payBtn:hover, #docBtn:hover {
	background: green;
}

fieldset {
	width: 80%;
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
      		<fieldset style="margin-bottom:-30px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;">
         		<legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">　정보 수정　</h1></legend>
         		<div class="outArea">
					<form action="<%= request.getContextPath() %>/aupdate.staff" method="post" id="updateForm" encType="multipart/form-data">
					<table class="table">
						<tr>
							<input type="hidden" name="userNo" value="<%= staffDetail.get(0).getUserNo() %>">
							<td rowspan="5" width="10%"><div align="center"><img id="profile" src="<%= request.getContextPath() %>/images/user.png" style="border-radius:50%;"></div></td>
							<td width="40%"><li>ID</li></td>
							<td width="40%">
								<input type="text" name="userId" id="userId" value="<%= staffDetail.get(0).getUserId() %>" readonly>
							</td>
							<td width="10%"></td>
						</tr>
						<tr>
							<td><li>이름</li></td>
							<td colspan="2">
								<input type="text" name="userName" id="userName" value="<%= staffDetail.get(0).getName() %>">
								<span id="nameSpan" class="greenText"></span>
							</td>
						</tr>
						<tr>
							<td><li>생년월일</li></td>
							<td colspan="2"><input type="text" name="birth" id="datepicker" value="<%= staffDetail.get(0).getBirth() %>"></td>
						</tr>
						<tr>
							<% String[] tel = staffDetail.get(0).getPhone().split("-"); %>
							<td><li>전화번호</li></td>
							<td colspan="2"><input type="tel" maxlength="3" size="4" name="tel1" value="<%= tel[0] %>"> - 
							    			<input type="tel" maxlength="4" size="4" name="tel2" value="<%= tel[1] %>"> - 
							    			<input type="tel" maxlength="4" size="4" name="tel3" value="<%= tel[2] %>"></td>
						</tr>
						<tr>
							<td><li>담당업무</li></td>
							<td colspan="2">
								<select name="subject">
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
							<td><div align="center"><button type="button" id="imgBtn">사진 선택</button></div><input type="file" id="imgFile" name="imgFile" onchange="loadImg(this)"></td>
							<td><li>이메일</li></td>
							<td colspan="2"><input type="email" name="email" id="email" value="<%= staffDetail.get(0).getEmail() %>">
							<span id="emailSpan" class="redText"></span></td>
						</tr>
						<tr>
							<td></td>
							<td><li>주소</li></td>
							<td colspan="2"><input type="text" name="address" id="address" value="<%= staffDetail.get(0).getAddress() %>"></td>
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
							<td>⦁　급여 계약서&nbsp;<button type="button" id="payBtn" style="display:inline-block; font-size:15px;">파일 추가</button>
								<input type="hidden" id="delPayfile" name="delPayfile" value="">
								<input type="file" id="payFile1" name="payFile1" onchange="loadFile(this, 1)"></td>
							<td colspan="2">
								<% for(int i = 0; i < pay.size(); i++) { %>
								<div class="deletePay" id="deletePay<%= i + 100 %>" display="block">
									<input type="hidden" id="prePayfile<%= i %>" value="<%= payReal.get(i) %>">
									<label id="deletePay<%= i + 100 %>"><%= pay.get(i) %></label>&nbsp;
									<button id="deletePayFile<%= i + 100 %>" type="button" class="deleteFile" onclick="deletePayfile(this, <%= i + 100 %>)">-</button>
								</div>
								<% } %>
								<input type="hidden" id="payFiles">
							</td>
						</tr>
						
						<tr>
							<td></td>
							<td>⦁　경력 등　<br>　기타 서류　<button type="button" id="docBtn" style="display:inline-block; font-size:15px;">파일 추가</button>
								<input type="hidden" id="delDocfile" name="delDocfile" value="">
								<input type="file" id="docFile1" name="docFile1" onchange="loadFile(this, 2)"></td>
							<td colspan="2">
								<% for(int i = 0; i < doc.size(); i++) { %>
								<div id="deleteDoc<%= i + 100 %>" display="block">
									<input type="hidden" id="preDocfile<%= i %>" value="<%= docReal.get(i) %>">
									<label id="deleteDoc<%= i + 100 %>"><%= doc.get(i) %></label>&nbsp;
									<button id="deleteDocFile<%= i + 100 %>" type="button" class="deleteFile" onclick="deleteDocfile(this, <%= i + 100 %>)">-</button>
								</div>
								<% } %>
								<input type="hidden" id="docFiles">
							</td>
						</tr>
						<tr>
							<td></td>
							<td colspan="3">
								<div class="btnArea" style="margin-left:70%;">
									<button type="button" class="bottomBtn" id="deleteBtn">삭제</button>
									<button type="button" class="bottomBtn" onclick="doModify();">수정</button>
									<button type="button" class="bottomBtn" onclick="goList();">취소</button>
								</div> <!-- btnArea end -->
							</td>
						</tr>
					</table>		
					</form>
				</div> <!-- outArea end -->
         		
         	</fieldset>
         </div>
		<script>
			payCnt = 1;
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
			
			function loadFile(value, num) {
				var fileName = $(value).val();
				var last = fileName.lastIndexOf("\\");
				if(value.files && value.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e){
						switch(num) {
						case 1 :
							payCnt++;
							$inputFile = $("<input type='file' name='payFile" + payCnt + "' id='payFile" + payCnt + "' onchange='loadFile(this, 1)'>");
							$("#payFile" + (payCnt - 1)).after($inputFile);
							$("#payFiles").before("<div id=\"deletePay" + (payCnt - 1) + "\" display=\"block\"><label>" + fileName.substr(last + 1, fileName.length) + "　</label><button id=\"deletePayFile" + (payCnt - 1) + "\" type=\"button\" class=\"deleteFile\" onclick=\"deletePayfile(this, " + (payCnt - 1) + ");\">-</button></div>");
							break;
						case 2 :
							docCnt++;
							$inputFile = $("<input type='file' name='docFile" + docCnt + "' id='docFile" + docCnt + "' onchange='loadFile(this, 2)'>");
							$("#docFile" + (docCnt - 1)).after($inputFile);
							$("#docFiles").before("<div id=\"deleteDoc" + (docCnt - 1) + "\" display=\"block\"><label>" + fileName.substr(last + 1, fileName.length) + "　</label><button id=\"deleteDocFile" + (docCnt - 1) + "\" type=\"button\" class=\"deleteFile\" onclick=\"deleteDocfile(this, " + (docCnt - 1) + ");\">-</button></div>");
							break;
						}
					};
				}
				reader.readAsDataURL(value.files[0]);
			}
			
			function deletePayfile(value, num) {
				if(num >= 100) {
					if($("#delPayfile").val() === "") {
						$("#delPayfile").val($("#delPayfile").val().concat($("#prePayfile" + (num - 100)).val()));
					} else {
						$("#delPayfile").val($("#delPayfile").val().concat("," + $("#prePayfile" + (num - 100)).val()));
					}
				}
				$(value).remove();
				$("#deletePay" + num).remove();
				$("#payFile" + num).remove();
			}
			
			function deleteDocfile(value, num) {
				if(num >= 100) {
					if($("#delDocfile").val() === "") {
						$("#delDocfile").val($("#delDocfile").val().concat($("#preDocfile" + (num - 100)).val()));
					} else {
						$("#delDocfile").val($("#delDocfile").val().concat("," + $("#preDocfile" + (num - 100)).val()));
					}
				}
				$(value).remove();
				$("#deleteDoc" + num).remove();
				$("#docFile" + num).remove();
			}
			
			$("#userName").keyup(function(event){
				var userName = $("#userName").val();
				var check = /[\Da-zA-Z가-힣]{2,}/;
				var check2 = /^[^0-9]+$/;
				var check3 = /[~!@#$%^&*()-_=+|<>?:{}\[\]\\\'\"]/;
				if(check.test(userName) && check2.test(userName) && !check3.test(userName)){
					$("#nameSpan").removeClass('redText').addClass('greenText');
					$("#nameSpan").text("");
				} else {
					$("#nameSpan").removeClass('greenText').addClass('redText');
					$("#nameSpan").text("2글자 이상의 문자로 설정해 주세요.");
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
				
				$("#payBtn").click(function(){
					$("#payFile" + payCnt).click();
				});
				
				$("#docBtn").click(function(){
					$("#docFile" + docCnt).click();
				});
				
				$("#deleteBtn").click(function(){
					if(window.confirm("정말로 삭제하시겠습니까?")) {
						location.href = "<%= request.getContextPath() %>/adelete.staff?no=<%= staffDetail.get(0).getUserNo() %>";
					}
				});
				
				$("option").each(function(){
					if($(this).val() === "<%= staffDetail.get(0).getDept() %>") {
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
					var fileCk = $("#payFile" + (payCnt - 1)).val();
					var fileCk2 = $("div").hasClass("deletePay");
					if($("#nameSpan").prop("class") === "redText") {
						alert("이름을 확인해 주세요.");
					} else if($("#datepicker").val() === "") {
						alert("생년월일을 확인해 주세요.");
					} else if($("#tel1").val() === "" || $("#tel2").val() === "" || $("#tel3").val() === "") {
						alert("전화번호를 확인해 주세요.");
					} else if($("#subject").val() === "select") {
						alert("담당 업무를 선택해 주세요.");
					} else if(!fileCk2 && !fileCk) {
						alert("급여 계약서는 반드시 업로드 되어야 합니다!");
					} else {
						$("#updateForm").submit();
					}
				}
			}
			
			function goList(){
				if(window.confirm("수정을 취소하시겠습니까?")) {
					location.href = "<%= request.getContextPath() %>/adetail.staff?type=view&no=<%= staffDetail.get(0).getUserNo() %>";
				}
			}
		</script>
	</section>
	<footer>
	</footer>
</body>
</html> 