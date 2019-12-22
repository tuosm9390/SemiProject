<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String clsNo = request.getParameter("clsNo");
	String checkStatus = request.getParameter("checkStatus");
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
      background:url("/hagong/images/classInsert.jpg") no-repeat top;
      background-size:85.9%;
   }
   
   input[type="text"] {
      width: 320px;
      height: 30px;
      border-radius: 5px;
      border: 1px solid lightgray;
   } 
   
    input[type="number"] {
      width: 100px;
      height: 30px;
      border-radius: 5px;
      border: 1px solid lightgray;
   } 
   
   input[type="date"] {
      width: 150px;
      height: 30px;
      border-radius: 5px;
      border: 1px solid lightgray;
   }
   
   input[type="checkbox"] {
      margin-left: 10px;
      width:20px;
      height:30px;
      margin-bottom:20px;
   }
   
   .bottomArea > button {
      display:inline;
      font-size: 18px;
      font-family: "Nanum Gothic";
      width:100px;
   }
   
   .bottomArea > button:hover {
      background:green;
      color:white;
   }
      
   fieldset {
      width:20%;
   }
      
   select {
        margin-bottom: 0 !important;
      height: 30px;
      width: 100px;
      border-radius: 5px;
      border: 1px solid lightgray;
   }
   
   #classTime {
      height: 30px;
      width: 142px;
      margin-bottom: 20px;
      border-radius: 5px;
      border: 1px solid lightgray;
   }
   
   .tableArea {
      background:rgba(268,268,268,50%);
      padding-top: 25px;
      width: 550px;
       border-radius: 5px;
         margin-bottom: 10px;
         padding-bottom: 25px;
   }
   
   td {
         padding-top:10px;
         padding-bottom:10px;
   }
</style>
</head>
<body>
   <header>
   <%@ include file="../../common/menubar.jsp" %>
   </header>
   <section>
   <div align="center">
         <fieldset style="margin-bottom:-30px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;">
            <legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">　수업정보 수정　</h1></legend>
         </fieldset>
    </div>
   <div class="body" align="center">
      <div class="tableArea">
      <form id="classInfo" action="<%=request.getContextPath()%>/aupdate.class" method="post">
         <table class="insertTable">
            <tr>
               <td>과목 : </td>
               <td>
               <select id="selectSubject" name="selectSubject" style="margin-bottom:20px">
               </select>
               </td>
               <td>
               <label for="selectTeacher">담당 강사 : </label>
               </td>
               <td>
               <select id="selectTeacher" name="selectTeacher" style="margin-bottom:20px">
               </select>
               </td>
            </tr>
            <tr>
               <td>
               <label>대상 학년 : </label>
               </td>
               <td>
               <select id="selectStudent" name="selectStudent" style="margin-bottom:20px">                
               </select>
               </td>
               <td>
               <label>정원 : </label>
               </td>
               <td>
               <input type="number" id="numOfClass" name="numOfClass">
               <input type="hidden" id="hidden" name="hidden" value="<%=clsNo%>">
               </td>
            </tr>
            <tr>
               <td>
               <label>강좌명 : </label>
               </td>
               <td colspan="3">
               <input type="text" id="classTitle" name="classTitle">
               </td>
            </tr>
             <tr>
               <td>
               <label for="classroom">강의실 : </label>
               </td>
               <td>
               <select id="classroom" name="classroom" style="margin-bottom:20px">
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
               </select>
               </td>
               <td>
               <label>수업회차 : </label>
               </td>
               <td>
               <input type="number" id="cntOfClass" name="cntOfClass">
               </td>
            </tr>
            <tr>
               <td>
               <label>기간 : </label>
               </td>
               <td colspan="3">
               <% if(checkStatus == "0") { %>
               <input type="date" id="startDate" name="startDate"> ~ <input type="date" id="endDate" name="endDate">
               <% }else { %>
               <input type="text" id="startDate" readonly>
               <% } %>
               </td>
            </tr>
            <tr>
            	<% if(checkStatus.equals("0")) { %>
               <td>
               <label>요일 : </label>
               </td>
               <td colspan="3">
               <input type="checkbox" id="mon" name="day" value="MON"><label for="mon">월</label>
               <input type="checkbox" id="tue" name="day" value="TUE"><label for="tue">화</label>
               <input type="checkbox" id="wed" name="day" value="WED"><label for="wed">수</label>
               <input type="checkbox" id="thur" name="day" value="THU"><label for="thur">목</label>
               <input type="checkbox" id="fri" name="day" value="FRI"><label for="fri">금</label>
               <input type="checkbox" id="sat" name="day" value="SAT"><label for="sat">토</label>
               <input type="checkbox" id="sun" name="day" value="SUN"><label for="sun">일</label>
               </td>
               <% } %>
            </tr>
            <tr>
               <td>
                  <label for="classTime">강의 시간 : </label>
               </td>
               <td colspan="3">
                  <select id="startTime" name="startTime" style="width:150px;">
                  </select> ~
                  <select id="endTime" name="endTime" style="width:150px;">
                  </select>
               </td>
            </tr>    
            <tr>
               <td>
                  <label>수업료 : </label>
               </td>
               <td colspan="3">
                  <input type="number" id="money" name="money" step="1000" style="width:320px;">
               </td>
            </tr>   
         </table>
      </form>
      </div>
      <div class="bottomArea" style="margin-bottom:20px">
         <button onclick="location.href='<%=request.getContextPath()%>/viewAcademy/mngClass/mngClassList/classList.jsp'">취소</button>
         <button id="updateClass">수정</button>
      </div>      
   </div> <!-- body end -->
   <input type="button" id="test">
   </section>
   <footer></footer>
   <script>
      $(function(){    
	
    	  $("#test").on("click", function(){
    		  var cs = '<%=checkStatus%>';
    		  var clsNum = '<%=clsNo%>';
    		  
    		  if(cs=='1'){

    	            $.ajax({
    	               url: '<%=request.getContextPath()%>/adetail.class',
    	               data: {num:clsNum},
    	               type: "get",
    	               success: function(data){
						console.log(data);
						$selectSubject = $("#selectSubject");
						$selectTeacher = $("#selectTeacher");
						$selectStudent = $("#selectStudent");
						$numOfClass = $("#numOfClass");
						$classTitle = $("#classTitle");
						$classroom = $("#classroom");
						$cntOfClass = $("#cntOfClass");
						$startDate = $("#startDate");
						$endDate = $("#endDate");
						$day = $("checkbox[name='day']");
						$startTime = $("#startTime");
						$endTime = $("#endTime");
						$money = $("#money");

		                var $option1 = $("<option>");
		                $option1.val(data.subName);
		                switch(data.subName) {
						case 'KOR' : $option1.text("국어"); break;
						case "MATH" : $option1.text("수학"); break;
						case "ENG" : $option1.text("영어"); break;
						case "SOCIAL" : $option1.text("사회"); break;
						case "SCIENCE" : $option1.text("과학"); break;
						case "FOREIGN" : $option1.text("제2외국어"); break;
						case "ETC" : $option1.text("기타"); break;
						}
		                $selectSubject.append($option1);
		                $selectSubject.attr('disabled', 'true');
		                
		                var $option2 = $("<option>");
		                $option2.val(data.name);
		                $option2.text(data.name);
		                $selectTeacher.append($option2);
		                $selectTeacher.attr('disabled', 'true');
		                
		                var $option3 = $("<option>");
		                $option3.val(data.clsStudent);
		                switch(data.clsStudent) {
						case "MID1" : $option3.text("중학교 1학년"); break;
						case "MID2" : $option3.text("중학교 2학년"); break;
						case "MID3" : $option3.text("중학교 3학년"); break;
						case "HIGH1" : $option3.text("고등학교 1학년"); break;
						case "HIGH2" : $option3.text("고등학교 2학년"); break;
						case "HIGH3" : $option3.text("고등학교 3학년"); break;
						case "ETC" : $option3.text("기타"); break;
						}
		                $selectStudent.append($option3);
		                $selectStudent.attr('disabled', 'true');
						
		                $numOfClass.val(data.clsMax);
						$classTitle.val(data.clsName);
						$cntOfClass.val(data.cntOfClass);						
						
						var y = (data.clsStart).substr(6, 10);
						var m = (data.clsStart).substr(0, 1);
						var d = (data.clsStart).substr(2, 2);
						var y1 = (data.clsEnd).substr(6, 10);
						var m1 = (data.clsEnd).substr(0, 1);
						var d1 = (data.clsEnd).substr(2, 2);
						
						$startDate.val(y+"년 "+m+"월 "+d+"일" + " ~ " + y1+"년 "+m1+"월 "+d1+"일");
						
						var startTime = (data.clsTime).substr(0, 5);
						var endTime = (data.clsTime).substr(6);
						
						var $option4 = $("<option>");
			            $option4.val(startTime);
			            $option4.text(startTime);
			            $startTime.append($option4);
						$startTime.attr('disabled', 'true');
						
						var $option5 = $("<option>");
			            $option5.val(endTime);
			            $option5.text(endTime);
			            $endTime.append($option5);
						$endTime.attr('disabled', 'true');
						
						$money.val(data.tuition);
										
    	               },
    	               error: function(data){
    	                  alert("수업 세부정보 불러오기 실패");
    	               }
    	            }); 
    		  }
    	  });
    	  
    	  $("#test").trigger("click");
      	
         $("#selectSubject").change(function(){
            var subject = $("#selectSubject option:selected").val();

            $.ajax({
               url: "<%=request.getContextPath()%>/alistTeacher.class",
               data: {subject:subject},
               type: "get",
               success: function(data){
                  console.log(data);
                  $select = $("#selectTeacher");
                  $select.find("option").remove();
                  
                  for(var key in data) {
                     var $option = $("<option>");
                     $option.val(data[key].userNo);
                     $option.text(data[key].name);
                     $select.append($option);
                  }
               },
               error: function(data){
                  alert("담당 강사 불러오기 실패");
               }
            });      
         });
         
         $("#updateClass").click(function(){
            $("#classInfo").submit();
            
         });
         
      });
   </script>
</body>
</html>