<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, hagong.academy.mngStudent.mngCouns.model.vo.*, hagong.academy.mngStudent.mngBlack.model.vo.*"%>
<% 
	ArrayList<MemberCouns> detailBlacklist = (ArrayList<MemberCouns>) request.getAttribute("detailBlacklist"); 
	BlacklistInfo userInfo = (BlacklistInfo) request.getAttribute("userInfo");

	System.out.println("detailBlacklist : " + detailBlacklist);
	System.out.println("userInfo : " + userInfo);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
<style>
input, select, textarea {
	border-radius:5px;
	border:1px solid lightgray;
}
.detailArea {display: table-caption;}
.inputCons {resize:none;}
.btnArea {text-align:center;}
.btnArea button{background:white;display:inline-block;margin:0 2px;width: 80px;font-size:18px;}
.btnArea .updateCons {display:none;}
.updateBtn:focus {outline: none;}
.updateBtn:hover {cursor: pointer;background: green;border: 1px solid green;color: white;}
.detailArea{display: block;width: 100%;}
.dArea .dCtn{padding-bottom: 20px;}
.dArea .dCtn .inputCons{padding: 4px;}
.dArea .dCtn.consTitle .inputCons{display: block;width: 100%;}
.dArea .dCtn .consCate{padding: 4px;width: 162px;}
.dArea .dTit{display: block;padding-bottom: 5px;font-weight: bold;font-size: 15px;}
.dArea textarea.inputCons{width: 100%;min-height: 100px;}
.btnArea{padding: 24px 0 13px;}
.bInfo .bDetail{display: inline-flex;}
.bInfo .bDetail .bDate{border:1px solid #333;padding:0 20px 0 20px;margin-right: 25px;border-color: rgb(169, 169, 169);height: fit-content;}
.bInfo .bDetail .bDate p{font-size:18px; margin: 10px 0;color:#333;}
.bInfo .bDetail .bContent{width: 700px;}
.bInfo {text-align:center;}
.bInfo .btitle{text-align:left; font-size:20px;font-weight: bold;}
.bInfo .bDetail .bContent {text-align:left;}
.bInfo .bTable{width:90%;margin:0 auto;}
.bInfo .bTable td{background:snow;}
.bInfo .blacklist_content{}
.btnArea{padding: 24px 0 13px;}
.blacklist_content {background:snow; padding:10px 10px 0 10px;}
.names{display:flex;}
.names .dCtn{margin-right:auto;}
.bInfo .bTable{margin-left:auto;margin-right:auto;width:70%;}
</style>
</head>
<body>
	<header>
		<%@ include file="../../common/menubar.jsp" %>	
	</header>
	<section>
		<div class="bInfo">
			<div align="center">
		      <fieldset style="margin-bottom:-15px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;width:23%;">
		         <legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">　블랙리스트 조회　</h1></legend>
		      </fieldset>
	    	</div>
		<div class="bTable">
			<table class="table" style="margin-bottom:5px;">
				<thead>
					<tr>
						<th>학생명</th>
						<th>학생ID</th>
						<th>학교</th>
						<th>학년</th>
						<th>학생 연락처</th>
						<th>학부모 연락처</th>					
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><%= userInfo.getName() %></td>
						<td><%= userInfo.getUserId() %></td>
						<td><%= userInfo.getSchool() %></td>
						<td><%= userInfo.getGradeName() %></td>
						<td><%= userInfo.getPhone() %></td>
						<td><%= userInfo.getParentPhone() %></td>					
					</tr>
				</tbody>
			</table>
		</div> <!-- 블랙리스트 정보 end -->
		<div class="bDetail">
			<div class="bContent">
				<form class="blacklist_content" method="post">
					<div class="detailArea">
						<div class="dArea dArea1">
							<div class="dCtn consDate"> 
								<label class="dTit">상담일자</label>
								<select class="dCtn inputCons" id="detailDate">
								<% for(int i = 0; i < detailBlacklist.size(); i++) {%> <!-- 블랙리스트 상담날짜-->
									<option value="<%= i %>"><%= detailBlacklist.get(i).getCouDate() %></option>
								<%} %>
								</select>
								<input type="text" class="inputCons" id="from" name="from" value="<%= detailBlacklist.get(0).getCouDate() %>" style="display:none;" readonly>
							</div>
							<div class="dCtn consTitle">
								<label class="dTit">상담제목</label>
								<input type="text" class="inputCons" value="<%= detailBlacklist.get(0).getCouTitle() %>" readonly>
							</div>
					<div class="names">
							<div class="dCtn tName">
								<label class="dTit">상담자 이름</label>
								<input type="text" class="inputCons" value="<%= detailBlacklist.get(0).getCouUserNo() %>" readonly>
							</div>

							<div class="dCtn category">
								<label class="dTit">상담종류</label>
								<select name="consCategory" disabled class="consCate">
									<option value="class">수업</option>
									<option value="life">학원생활</option>
									<option value="atit">태도</option>
									<option value="etc">기타</option>
								</select>
							</div>
					</div>

						</div>
						<div class="dArea dArea2">

						</div>
						<div class="dArea dArea3">
							<div class="dCtn content">
								<label class="dTit">내용</label>
								<textarea class="inputCons" name="consreq" readonly><%= detailBlacklist.get(0).getCouContent() %></textarea>
							</div>
							<div class="dCtn answer">
								<label class="dTit">상담자의 대응내용</label>
								<textarea class="inputCons" name="consres" readonly><%= detailBlacklist.get(0).getCouAction() %></textarea>
							</div>
						</div>
					</div>
					<div class="btnArea">
						<button class="updateBtn" onclick="updateCons();">수정</button>
						<button class="updateCons">수정완료</button>
						<button>삭제</button>
					</div> <!-- btnArea -->
				</form>
			</div> <!-- 블랙리스트 상담내용 end -->
		</div>

		
	</div> <!-- 블랙리스트 전체정보  end-->
	</section>
	
	<script>
	//DatePicker
	$.datepicker.setDefaults({
		dateFormat: 'yy-mm-dd',
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		showMonthAfterYear: true,
		changeMonth : true,
		changeYear : true,
		constrainInput: false,
		yearSuffix: '년'
		});
	$(function() {
		$("#from").datepicker();
	});
	$(function() {
		$("#detailDate").change(function(){
			var status = $("#detailDate option:selected").val();
			
			$.ajax({
				url:"test9.do",
				type:"get",
				success:function(data){
					$tableBody = $("#userInfoTable tbody");
					
					$tableBody.html('');
					
					$.each(data, function(index, value){
						var $tr = $("<tr>");
						var $noTd = $("<td>").text(value.userNo);
						var $nameTd = $("<td>").text(decodeURIComponent(value.userName));
						var $nationTd = $("<td>").text(decodeURIComponent(value.userNation));
						
						$tr.append($noTd);
						$tr.append($nameTd);
						$tr.append($nationTd);
						
						$tableBody.append($tr);
					});
				},
				error:function(data){
					console.log("에러!");
				}
			});	
		})
	})
	</script>
	
</body>
</html>