<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, hagong.academy.mngAdmin.mngPlan.model.vo.*"%>
<% 	ArrayList<String> title = (ArrayList<String>) request.getAttribute("title");
	ArrayList<ArrayList<Plan>> content = (ArrayList<ArrayList<Plan>>) request.getAttribute("content"); 
%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	.listArea {
		width: 90%;
		margin-left: auto;
		margin-right: auto;
		overflow: auto;
	}
	.btnArea {
		width: 90%;
		margin-left: auto;
		margin-right: auto;
		overflow: auto;
	}
	/* 모달 배경 */
	.modal {
		display: none;
		position: fixed;
		z-index: 1;
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
		overflow: auto; 
		background-color: rgb(0, 0, 0);
		background-color: rgba(0, 0, 0, 0.4);
	}
	
	/* 모달 내부 상자 */
	.modal-content {
		background-color: #fefefe;
		margin: 13% auto;
		padding: 20px;
		border: 1px solid #888;
		width: 30%;
		background-color: #fefefe;	
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
	
	ul {
		list-style:none;
		font-size: 20px;
	}
	
	ul > li {
		display:block;
		padding-bottom: 20px;
	}
	
	.btnArea > button {
		font-size: 18px;
		margin-left: 1%;
		margin-bottom: 1%;
		font-family: "Nanum Gothic";
		font-weight: bold;
		border: 2px solid green;
		display: inline;
	}
	
	#planTableArea th {
		padding-left: 100px;
		padding-right: 100px;
	}
	
	#planTableArea td {
		padding-top: 30px;
		padding-bottom: 30px;
	}
	
	#mainTh {
		padding-left: 60px !important;
		padding-right: 60px !important;
	}
</style>
</head>
<body>			
<header>
<%@ include file="/viewAcademy/common/menubar.jsp" %>
</header>
<section>
	<div align="center">
    	<fieldset style="margin-bottom:-15px;border-left:none; border-right:none; border-bottom:none; border-top-color:black; width: 20%">
        	<legend align="center"><h1 align="center" style="font-family:'Do Hyeon'">　연간계획 관리　</h1></legend>
   	    </fieldset>
    </div>
    <div class="btnArea">
		<button id="addRow" style="float:left">항목 추가</button>
		<button id="deleteRow" style="float:left">항목 삭제</button>
		<button id="writeBtn" style="float:right">저장</button>
	</div> <!-- btnArea end -->
	<div class="listArea">
	<div class="body">
		<form id="planForm" action="<%=request.getContextPath()%>/ainsert.plan" method="post">
			<table id="planTableArea" class="table">
			<thead>
				<tr>
					<th id="mainTh">항목</th>
					<th>1월</th>
					<th>2월</th>
					<th>3월</th>
					<th>4월</th>
					<th>5월</th>
					<th>6월</th>
					<th>7월</th>
					<th>8월</th>
					<th>9월</th>
					<th>10월</th>
					<th>11월</th>
					<th>12월</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<% for(int i=0; i<title.size(); i++) { %>
				<tr>
					<td id="title" style="height:100px; font-weight:bold; color:black"><%= title.get(i) %></td>
							<% for(int k=0; k<content.get(i).size(); k++){ 
								String id = i + "row" + k + "index";
								if((content.get(i).get(k)) != null) { %>
								<td><textarea id='<%=id%>' name='td' style='background:none; border:none; resize:none;'><%= content.get(i).get(k).getCalMemo() %></textarea></td>
								<% }else { %>
								<td><textarea id='<%=id%>' name='td' style='background:none; border:none; resize:none;'></textarea></td>
								<% } %>
							<% } %>
				</tr>
				<% } %>
			</tbody>
			</table>
		</form>
	</div> <!-- body end -->
	</div>

		<!-- 연간계획 삭제 -->
		<div id="deleteArea" class="modal">

			<div class="modal-content" align="center">
				<span id="xBtn">&times;</span>
				<h2 style="margin-left:15px;">연간계획 삭제하기</h2>
				<span>연간계획 삭제를 원하는 달을 선택하세요.</span>
				<div class="monthCheckArea">
					<form>
						<ul>
						<li><input type="checkbox" name="0" id="alls"><label for="1">전체선택</label>
						</li>
							<li>
								<input type="checkbox" name="1" id="jan" class="monthBtn"><label for="1">1월</label>
								<input type="checkbox" name="2" id="feb" class="monthBtn"><label for="2">2월</label>
								<input type="checkbox" name="3" id="mar" class="monthBtn"><label for="3">3월</label>
								<input type="checkbox" name="4" id="apr" class="monthBtn"><label for="4">4월</label>
							</li>
							<li>
								<input type="checkbox" name="5" id="may" class="monthBtn"><label for="5">5월</label>
								<input type="checkbox" name="6" id="jun" class="monthBtn"><label for="6">6월</label>
								<input type="checkbox" name="7" id="jul" class="monthBtn"><label for="7">7월</label>
								<input type="checkbox" name="8" id="aug" class="monthBtn"><label for="8">8월</label>
							</li>
							<li>
								<input type="checkbox" name="9" id="sep" class="monthBtn"><label for="9">9월</label>
								<input type="checkbox" name="10" id="oct" class="monthBtn"><label for="10">10월</label>
								<input type="checkbox" name="11" id="dec" class="monthBtn"><label for="11">11월</label>
								<input type="checkbox" name="12" id="nov" class="monthBtn"><label for="12">12월</label>
							</li>
						</ul>
					</form>
				</div> <!-- monthCheckArea end -->
				<button id="cancelbtn"
					style="margin-left: 100px; width: 100px; height: 30px; float: left; display:inline;">취소</button>
				<button id="okbtn"
					style="margin-right: 100px; float: right; width: 100px; height: 30px; display:inline;">확인</button>
				<br>
			</div>
		</div> <!-- deleteArea end -->
		<script>	
			$(function(){
				var temptitle = '<%=title%>';
				var titleArr = temptitle.substring(1, temptitle.length-1);
				var title = titleArr.split(', ');

				var writeBtn = document.getElementById('writeBtn');
				var addRowBtn = document.getElementById('addRow');
				var deleteRowBtn = document.getElementById('deleteRow');				
				var deleteArea = document.getElementById('deleteArea');
				var deleteOk = document.getElementById('okbtn');
				var cancleDelete = document.getElementById('cancelbtn');
				var closeBtn = document.getElementById('xBtn');
				var addRowName = "";
				
				

				var tbody = document.getElementById('tbody');
				tbody.addEventListener('change', function(event){
					console.log(tbody);
				});
				
				//저장 버튼 클릭 시
				writeBtn.onclick = function() {				

					var arr = [];
					var one = $("#one").val();
					var two = $("#two").val();
					var three = $("#three").val();
					var four = $("#four").val();
					var five = $("#five").val();
					var six = $("#six").val();
					var seven = $("#seven").val();
					var eight = $("#eight").val();
					var nine = $("#nine").val();
					var ten = $("#ten").val();
					var eleven = $("#eleven").val();
					var twelve = $("#twelve").val();
					
					arr.push(one);
					arr.push(two);
					arr.push(three);
					arr.push(four);
					arr.push(five);
					arr.push(six);
					arr.push(seven);
					arr.push(eight);
					arr.push(nine);
					arr.push(ten);
					arr.push(eleven);
					arr.push(twelve);
					
					
					$.ajax({
						url: "<%=request.getContextPath()%>/ainsert.plan",
						data: {
							title:addRowName,
							one:$("#one").val(),
							two:$("#two").val(),
							three:$("#three").val(),
							four:$("#four").val(),
							five:$("#five").val(),
							six:$("#six").val(),
							seven:$("#seven").val(),
							eight:$("#eight").val(),
							nine:$("#nine").val(),
							ten:$("#ten").val(),
							eleven:$("#eleven").val(),
							twelve:$("#twelve").val()
						},
						type: "get",
						success: function(data){
							swal ({
								title: "수정 완료",
								text: "연간계획 수정이 완료되었습니다.",
								icon: "success",
								button: "확인"
							});
							location.href="<%=request.getContextPath()%>/alist.plan";
						},
						error: function(data){
							
						}
					});


			}
				
				
				
				
				
				//행 추가 버튼 클릭 시
				addRowBtn.onclick = function() {
					addRowName = window.prompt('항목 이름 입력');
					
					var check = false;
					for(var i=0; i<title.length; i++)  {
						
						if(addRowName != title[i]) { 
							check = true;							
						}else {
							swal ({
								title: "항목 추가 실패",
								text: "이미 존재하는 항목입니다.",
								icon: "warning",
								button: "확인"
							});
							
						}
					} 
					
					if(check == true) {
						$("#tbody").append("<tr value='" + addRowName + "'><td id='title' name='rowName'>"+ addRowName + "</td>"
								+ "<td><textarea id='one' style='background:none; border:none; resize:none;'></textarea></td>"
								+ "<td><textarea id='two' style='background:none; border:none; resize:none;'></textarea></td>"
								+ "<td><textarea id='three' style='background:none; border:none; resize:none;'></textarea></td>"
								+ "<td><textarea id='four' style='background:none; border:none; resize:none;'></textarea></td>"
								+ "<td><textarea id='five' style='background:none; border:none; resize:none;'></textarea></td>"
								+ "<td><textarea id='six' style='background:none; border:none; resize:none;'></textarea></td>"
								+ "<td><textarea id='seven' style='background:none; border:none; resize:none;'></textarea></td>"
								+ "<td><textarea id='eight' style='background:none; border:none; resize:none;'></textarea></td>"										
								+ "<td><textarea id='nine' style='background:none; border:none; resize:none;'></textarea></td>"
								+ "<td><textarea id='ten' style='background:none; border:none; resize:none;'></textarea></td>"
								+ "<td><textarea id='eleven' style='background:none; border:none; resize:none;'></textarea></td>"
								+ "<td><textarea id='twelve' style='background:none; border:none; resize:none;'></textarea></td></tr>");
					}
				}
				
				deleteRowBtn.onclick = function() {
					var deleteRowName = window.prompt('삭제할 행 이름 입력');
					
					$.ajax({
						url: "alistForDelete.plan",
						data: { title:deleteRowName },
						type: "get",
						success: function(data){
							swal ({
								title: "행 삭제 완료",
								text: "행 삭제가 완료되었습니다.",
								icon: "success",
								button: "확인"
							});
							location.href="<%=request.getContextPath()%>/alistForUpdate.plan";
						},
						error: function(data){
							console.log('실패');
						}
					});
				}
				
				
				
				closeBtn.onclick = function() {
					deleteArea.style.display = "none";
				}
				
				cancleDelete.onclick = function() {
					deleteArea.style.display = "none";
				}
				
				deleteOk.onclick = function() {
					//체크된 월 삭제 기능 실행됨
					
					
					//기능이 다 실행된 후 결과값에 따라 성공 시, 삭제 결과가 반영된 연간계획 페이지 / 실패 시 에러페이지로 이동
					deleteArea.style.display = "none";
				}
			});
		</script>
</section>
<footer></footer>	
</body>
</html>