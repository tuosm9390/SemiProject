<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, hagong.academy.mngClass.mngClassList.model.vo.Class, hagong.academy.mngStudent.mngCouns.model.vo.*"%>
<%
	ArrayList<Class> list = (ArrayList<Class>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();		//총 게시글 갯수
	int currentPage = pi.getCurrentPage();	//현재 페이지
	int maxPage = pi.getMaxPage();			//마지막 게시글 페이지 번호 
	int startPage = pi.getStartPage();		//시작 페이지 번호
	int endPage = pi.getEndPage();			//끝 페이지 번호
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>HAGONG</title>
<style>
	body {
		font-family: "Nanum Gothic";
	}
	
	.listArea {
		width: 90%;
		margin-left: auto;
		margin-right: auto;
	}
	
	.classDetailBottom > button {
		display:inline-block;
	}
	
	/* 모달 배경 */
	.modal {
		display: none; /* Hidden by default */
		position: fixed; /* Stay in place */
		z-index: 1; /* Sit on top */
		left: 0;
		top: 0;
		width: 100%; /* Full width */
		height: 100%; /* Full height */
		overflow: auto; /* Enable scroll if needed */
		background-color: rgb(0, 0, 0); /* Fallback color */
		background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	}
	
	/* 모달 내부 상자 */
	.modal-content {
		background-color: #fefefe;
		margin: 13% auto; /* 15% from the top and centered */
		padding: 10px;
		border: 1px solid #888;
		width: 35%;
		background-color: #fefefe;
		border-radius: 5px;
		/* Could be more or less, depending on screen size */
	}
	/* 모달 닫기 버튼 */
	#xBtn, #xBtn2 {
		color: #aaa;
		float: right;
		font-size: 28px;
		font-weight: bold;
	}
	
	#xBtn:hover, #xBtn:focus, #xBtn2:hover, #xBtn2:focus {
		color: black;
		text-decoration: none; 
		cursor: pointer;
	}
	
	#modalTable td {
		padding: 10px;
		border: 1px solid lightgray;
		text-align: center;		
	}
	
	#modalTable td {
		text-weight: bold;
	}
	
	#modalBtnTable {
		margin-top: 20px;
	}
	
	fieldset {
		width:18%;
	}
	
	#writeBtn, #classroomBtn {
		font-size: 18px;
		margin-left: 1%;
		margin-bottom: 1%;
		font-family: "Nanum Gothic";
		font-weight: bold;
		border: 2px solid green;
		display: inline;
		float: right;
	}
	
	#searchBtn {
		margin-bottom: 1%;
		font-family: "Nanum Gothic";
		font-weight: bold;
		border: 2px solid green;
		display: inline;
		align: center;
	}
	
	#searchBtn:hover, #writeBtn:hover, #classroomBtn:hover {
		cursor: pointer;
		background: green;
		border: 2px solid green;
		color: white;
		display: inline;
	}
	
	#mngClass input {
		border-radius: 5px;
		border: 1px solid lightgray;
	}
	
	.pagingArea {margin-bottom:30px;}
	.pagingArea button{display:inline-block;font-family: "Nanum Gothic";}
</style>
</head>
<body>
	<header>
		<%@ include file="../../common/menubar.jsp" %>
	</header>
	<section>
	<div class="listArea">
		<div align="center">
      		<fieldset style="margin-bottom:-30px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;">
         		<legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">　강좌 관리　</h1></legend>
      		</fieldset>
      	</div>
		<!-- <input type="date" style="float:left; width:150px; border-radius:5px; border:1px solid lightgray"> -->
		<button id="writeBtn" onclick="location.href='viewAcademy/mngClass/mngClassList/insertClassInfo.jsp'">강좌 등록</button>
		<button id="classroomBtn">강의실 관리</button>
			<table class="classInfoTable table">
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
					<% for(int i=0; i<list.size(); i++) { %>
					<tr>
						<td><%= i+1 %><input type="hidden" value="<%=list.get(i).getClsNo()%>"></td>
						<td><%=list.get(i).getSubName()%></td>
						<td><%=list.get(i).getClsName()%></td>
						<td><%=list.get(i).getName()%></td>
						<td><%	String grade = "";
								switch(list.get(i).getClsStudent()) { 
								case "MID1" : grade = "중1"; break;
								case "MID2" : grade = "중2"; break;
								case "MID3" : grade = "중3"; break;
								case "HIGH1" : grade = "고1"; break;
								case "HIGH2" : grade = "고2"; break;
								case "HIGH3" : grade = "고3"; break;
								case "ETC" : grade = "기타"; break;
								} %><%=grade%></td>
						<td><%=list.get(i).getClsMax()%>명</td>
						<td><%=list.get(i).getClsStart()%>~<%=list.get(i).getClsEnd()%></td>
					</tr>
					<% } %>
				</tbody>
			</table>
		</form>
		
		<div class="pagingArea" align="center">
			<button onclick="location.href='<%= request.getContextPath()%>/alistClassList.class?currentPage=1'"><<</button>
			<% if(currentPage <= 1) {%>
			<button disabled><</button>
			<%}else{ %>
			<button onclick="location.href='<%=request.getContextPath()%>/alistClassList.class?currentPage=<%=currentPage - 1%>'"><</button>
			<% }%>
			
			<% for(int p = startPage; p <= endPage; p++){ 
				if(p == currentPage){
			%>
				<button disabled><%= p %></button>			
			<% }else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/alistClassList.class?currentPage=<%=p%>'"><%=p %></button>
			<% } 
			}
			%>
			
			<% if(currentPage >= maxPage){ %>
			<button disabled>></button>
			<%} else{ %>
			<button onclick="location.href='<%=request.getContextPath()%>/alistClassList.class?currentPage=<%=currentPage + 1%>'">></button>
			<% } %>
			
			<button onclick="location.href='<%= request.getContextPath()%>/alistClassList.class?currentPage=<%=maxPage%>'">>></button>
		</div> <!-- pagingArea end  -->
	
		<div align="center">
			<select id="searchCondition" style="border-radius:5px;">
				<option value="" selected disabled hidden>검색 조건</option>
				<option name="searchClassCondition">과목</option>
				<option name="searchClassCondition">강좌명</option>
				<option name="searchClassCondition">담당 강사</option>
			</select>
			<input type="search" id="searchClass" name="searchClass" style="border-radius:5px; border:1px solid lightgray;">
			<button id="searchBtn">검색</button>
		</div>
	</div> <!-- listArea end -->

	<!-- 강좌 상세정보 모달 -->
	<div id="detailClassInfo" class="modal">
		<div class="modal-content" align="center">
			<span id="xBtn">&times;</span>
			<h2>강좌 정보 확인</h2>
			<table id="modalTable">
				<tr>
					<td width="100px">과목</td>
					<td id="subjectField" width="250px"></td>
				</tr>
				<tr>
					<td>강좌명</td>
					<td id="classNameField"></td>
				</tr>
				<tr>
					<td>담당 강사</td>
					<td id="teacherField"></td>
				</tr>
				<tr>
					<td>대상 학생</td>
					<td id="studentField"><%-- <%	String school = "";
								switch(classDetail.getClsStudent()) { 
								case "MID1" : school = "중등"; break;
								case "MID2" : school = "중등"; break;
								case "MID3" : school = "중등"; break;
								case "HIGH1" : school = "고등"; break;
								case "HIGH2" : school = "고등"; break;
								case "HIGH3" : school = "고등"; break;
								case "ETC" : school = "기타"; break;
							} %><%=school%><%=classDetail.getSubName()%> / 
					<%	String grade = "";
							switch(classDetail.getClsStudent()) { 
							case "MID1" : grade = "1"; break;
							case "MID2" : grade = "2"; break;
							case "MID3" : grade = "3"; break;
							case "HIGH1" : grade = "1"; break;
							case "HIGH2" : grade = "2"; break;
							case "HIGH3" : grade = "3"; break;
							case "ETC" : grade = "기타"; break;
						} %><%=grade%>학년	 --%>				
					</td>
				</tr>
				<tr>
					<td>정원</td>
					<td id="clsMaxField"></td>
				</tr>
				<tr>
					<td>기간</td>
					<td id="clsDayField"></td>
				</tr>
				<tr>
					<td>강의 시간</td>
					<td id="clsTimeField"></td>
				</tr>
				<tr>
					<td>수업료</td>
					<td id="tuitionField"><input type="hidden" id="clsNoField"></td>
				</tr>
			</table>
			<table id="modalBtnTable">
				<tr>
					<td colspan="2">
						<button id="deleteBtn"
							style="display: inline; margin-left: 20px; width: 100px; height: 30px;">삭제</button>
						<button type="button" id="updateBtn"
							style="display: inline; width: 100px; height: 30px;">수정</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<!-- detailClassInfo end -->
	
	   <!-- 강의실 관리 모달 -->
   <div id="mngClass" class="modal">
      <div class="modal-content" align="center">
         <span id="xBtn2">&times;</span>
         <h2 style="font-style:italic; padding-bottom:10px;">◎ 강의실 관리 ◎</h2>
         <table id="modalTable">
            <tr>
               <td colspan="2">
                  <select id="classroomSelect" style="border:1px solid lightgray; border-radius:5px; height: 30px">
                  	<option value="" selected disabled hidden>강의실 보기</option>
                  </select>
               </td>
            </tr>
            <tr>
               <td width="100px">강의실명</td>
               <td width="250px"><input type="text" id="classroomName"></td>
            </tr>
            <tr>
               <td>수용 인원</td>
               <td><input type="number" id="classroomPeople" min="1"></td>
            </tr>
         </table>
         <table id="modalBtnTable">
            <tr>
               <td colspan="2">
                  <button id="deleteBtn2"
                     style="display: inline; margin-left: 20px; width: 100px; height: 30px;">삭제</button> &nbsp; &nbsp;
                  <button type="button" id="updateBtn2"
                     style="display: inline; width: 100px; height: 30px;">추가</button>
               </td>
            </tr>
         </table>
         <br>
      </div>
   </div> <!-- mngClass end -->


		<script>
		$(function(){
			$(".classInfoTable td").mouseenter(function(){
				$(this).parent().css("cursor","pointer");
			}).click(function(){
				var num = $(this).parent().children().eq(0).children().val();
				var clsNum = "";
				
				$.ajax({
					url: "adetail.class",
					data: {num:num},
					type: "get",
					success: function(data){
						clsNo = data.clsNo;
						
						$subjectField = $("#subjectField");
						$classNameField = $("#classNameField");
						$teacherField = $("#teacherField");
						$studentField = $("#studentField");
						$clsMaxField = $("#clsMaxField");
						$clsDayField = $("#clsDayField");
						$clsTimeField = $("#clsTimeField");
						$tuitionField = $("#tuitionField");
						
						switch(data.subName) {
						case "KOR" : $subjectField.text("국어"); break;
						case "MATH" : $subjectField.text("수학"); break;
						case "ENG" : $subjectField.text("영어"); break;
						case "SOCIAL" : $subjectField.text("사회"); break;
						case "SCIENCE" : $subjectField.text("과학"); break;
						case "FOREIGN" : $subjectField.text("제2외국어"); break;
						case "ETC" : $subjectField.text("기타"); break;
						}
						
						$classNameField.text(data.clsName);
						$teacherField.text(data.name);
						
						switch(data.clsStudent) {
						case "MID1" : $studentField.text("중학교 1학년"); break;
						case "MID2" : $studentField.text("중학교 2학년"); break;
						case "MID3" : $studentField.text("중학교 3학년"); break;
						case "HIGH1" : $studentField.text("고등학교 1학년"); break;
						case "HIGH2" : $studentField.text("고등학교 2학년"); break;
						case "HIGH3" : $studentField.text("고등학교 3학년"); break;
						case "ETC" : $studentField.text("기타"); break;
						}
						
						$clsMaxField.text(data.clsMax+"명");
						$clsDayField.text(data.clsStart + "~" + data.clsEnd);
						$clsTimeField.text(data.clsTime);
						$tuitionField.text(data.tuition + "만원");
						
						updateBtn.onclick = function() {
							//수업정보 등록일 때: checkStatus=0, 수업정보 수정일 때: checkStatus=1
							location.href="<%=request.getContextPath()%>/viewAcademy/mngClass/mngClassList/updateClassInfo.jsp?clsNo="+clsNo+"&checkStatus="+1;
						}
						
					},
					error: function(request, data){
						alert("code:"+request.status+"\n"+"message:"+request.responseText);
					}
				});
				
				var modal = document.getElementById("detailClassInfo");
				modal.style.display = "block";
				
				var closeBtn = document.getElementById('xBtn');
				var deleteBtn = document.getElementById('deleteBtn');
				var updateBtn = document.getElementById('updateBtn');
				closeBtn.onclick = function() {
					modal.style.display = "none";
				}
				deleteBtn.onclick = function() {
					var form = document.getElementById("classInfo");
			
					swal({
						title: "강좌 삭제",
						text: "강좌 정보를 영구적으로 삭제하시겠습니까?",
						icon: "warning",
			    		buttons : [ "취소", "삭제" ],
			    		dangerMode: true,
			    	}).then(function(isConfirm) {
			    		if(isConfirm) {
			    			$.ajax({
			    				url: "adelete.class",
			    				data: {num:num},
			    				type: "get",
			    				success: function(data){			    					
			    					swal ({
					    				title: "삭제되었습니다.",
					    				icon: "success"
					    			})
					    			location.href="<%=request.getContextPath()%>/alistClassList.class";
			    				},
			    				error: function(data){
			    					console.log("실패");	
			    				}
			    			});
			    		}else {
			    			swal ("강좌 삭제가 취소되었습니다.");
			    		}
			    	});
					
					modal.style.display = "none";
					
				}
				<%-- updateBtn.onclick = function() {
					//업데이트 서블릿으로 이등 후 결과에 따라 페이지 요청
					/* modal.style.display = "none"; */
					console.log(clsNo);
					location.href="<%=request.getContextPath()%>/viewAcademy/mngClass/mngClassList/updateClassInfo.jsp?clsNum=";
				}
 --%>
			});
			
			$("#classroomBtn").click(function(){
				$.ajax({
					url: "alistClr.class",
					type: "get",
					success: function(data){
						
						$select = $("#classroomSelect");
						$select.find("option").remove();
						for(var key in data){
							console.log(data[key].clrName);
							var $option = $("<option>");
							$option.val(data[key].clrNo);
							$option.text(data[key].clrName + "반 / " + data[key].capacity + "명");
							$select.append($option);
						}						
					},
					error: function(data){
						console.log('error');
					}
				});
				
				var classroomModal = document.getElementById("mngClass");
				classroomModal.style.display = "block";
				
				var closeBtn2 = document.getElementById('xBtn2');
				
				closeBtn2.onclick = function() {
					classroomModal.style.display = "none";
				}
			});
			
	         $("#classroomBtn").click(function(){
	             var classroomModal = document.getElementById("mngClass");
	             classroomModal.style.display = "block";
	             
	             var closeBtn2 = document.getElementById('xBtn2');
	             var deleteBtn2 = document.getElementById('deleteBtn2');
	             var updateBtn2 = document.getElementById('updateBtn2');
	             
	             closeBtn2.onclick = function() {
	                classroomModal.style.display = "none";
	             }
	             
	             updateBtn2.onclick = function() {
	                var classroomName = $("#classroomName").val();
	                var classroomPeople = $("#classroomPeople").val();
	                
	                //$("#classroomSelect").append("<option value=" + classroomName + ">" + classroomName + " CLASS / " + classroomPeople + "명</option>");
	                $.ajax({
	                	url: "ainsertClr.class",
	                	data: {
	                		clrName:classroomName,
	                		capacity:classroomPeople
	                		},
	                	type: "get",
	                	success: function(data){
	                		alert('강의실 추가 완료');
	                		
	                		$("#classroomSelect").append("<option value=" + classroomName + ">" + classroomName + "반 / " + classroomPeople + "명</option>");
	                		
	                	},
	                	error: function(data){
	                		console.log('error');
	                	}
	                });
	             }
	             
	             deleteBtn2.onclick = function() {
	                var deleteClr = $("#classroomSelect option:selected").val();

					$.ajax({
						url: "adeleteClassroom.class",
						data: { deleteClr:deleteClr },
						type: "get",
						success: function(data){
							console.log(data);
							$("select[id='classroomSelect'] option[value='" + deleteClr + "']").remove();
							alert('강의실 삭제 완료');
						},
						error: function(data){
							console.log(data);
						}
					});
	                
	             }
	             
	             
	          });
	         
	         
	         $("#searchCondition").change(function(){
	        	 
	         });
	
		});
		
	</script>
	</section>
	<footer></footer>
</body>
</html>