<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, hagong.academy.mngAdmin.mngPlan.model.vo.*"%>
<%
	ArrayList<Plan> list = (ArrayList<Plan>) request.getAttribute("list");
	ArrayList<String> title = (ArrayList<String>) request.getAttribute("title");
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
    	<fieldset style="margin-bottom:-15px;border-left:none; border-right:none; border-bottom:none; border-top-color:black; width: 15%">
        	<legend align="center"><h1 align="center" style="font-family:'Do Hyeon'">　연간계획　</h1></legend>
   	    </fieldset>
    </div>
    <div class="btnArea">
		<button id="writeBtn" style="float:right">입력 및 수정</button>
	</div> <!-- btnArea end -->
	<div class="listArea">
	<div class="body">
		<table id="planTableArea" class="table">
			<thead>
				<tr>
					<th id="mainTh"></th>
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
					<td style="height:100px; font-weight:bold; color:black"><%= title.get(i) %></td>
							<% for(int k=0; k<content.get(i).size(); k++){  
								if((content.get(i).get(k)) != null) { %>
								<td><%= content.get(i).get(k).getCalMemo() %></td>
								<% }else { %>
								<td></td>
								<% } %>
							<% } %>
				</tr>
				<% } %>
			</tbody>
			</table>
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
								<input type="checkbox" name="monthBtn" class="monthBtn" value="1"><label for="1">1월</label>
								<input type="checkbox" name="monthBtn" class="monthBtn" value="2"><label for="2">2월</label>
								<input type="checkbox" name="monthBtn" class="monthBtn" value="3"><label for="3">3월</label>
								<input type="checkbox" name="monthBtn" class="monthBtn" value="4"><label for="4">4월</label>
							</li>
							<li>
								<input type="checkbox" name="monthBtn" class="monthBtn" value="5"><label for="5">5월</label>
								<input type="checkbox" name="monthBtn" class="monthBtn" value="6"><label for="6">6월</label>
								<input type="checkbox" name="monthBtn" class="monthBtn" value="7"><label for="7">7월</label>
								<input type="checkbox" name="monthBtn" class="monthBtn" value="8"><label for="8">8월</label>
							</li>
							<li>
								<input type="checkbox" name="monthBtn" class="monthBtn" value="9"><label for="9">9월</label>
								<input type="checkbox" name="monthBtn" class="monthBtn" value="10"><label for="10">10월</label>
								<input type="checkbox" name="monthBtn" class="monthBtn" value="11"><label for="11">11월</label>
								<input type="checkbox" name="monthBtn" class="monthBtn" value="12"><label for="12">12월</label>
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
				var writeBtn = document.getElementById('writeBtn');
				var deleteByMonth = document.getElementById('deleteByMonth');
				var deleteArea = document.getElementById('deleteArea');
				var deleteOk = document.getElementById('okbtn');
				var cancleDelete = document.getElementById('cancelbtn');
				var closeBtn = document.getElementById('xBtn');
				
				writeBtn.onclick = function() {
					location.href = "<%=request.getContextPath()%>/alistForUpdate.plan";
				}				
				
				closeBtn.onclick = function() {
					deleteArea.style.display = "none";
					$("input[name=monthBtn]").attr("checked", false);
				}
				
				cancleDelete.onclick = function() {
					deleteArea.style.display = "none";
				}
				
				deleteByMonth.onclick = function() {
					deleteArea.style.display = "block";				

				}
				
				$("#selectYear").change(function(){
					var select = $("#selectYear option:selected").val();
					
					$.ajax({
						url: "alistByYear.plan",
						data: { year:select },
						type: "get",
						success: function(data){
							console.log(data);
							$tbody = $("#tbody");
							$tbody.find("tr").remove();
							
							for(var key in data){
								var $tr = $("<tr>");
								var $td = $("<td>");
								$td.val(data[key].calTitle);
								$td.text(data[key].calTitle);
								$tr.append($td);
								$tbody.append($tr);
							}
						},
						error: function(data){
							
						}
					});
				});
				
			});
			
			
		</script>
</section>
<footer></footer>	
</body>
</html>