<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.text.*, hagong.academy.mngClass.mngAttend.model.vo.*, hagong.academy.mngStudent.mngPurchase.model.vo.SelectDate"%>
<% 
	String classNum = (String) request.getAttribute("classNum");
	ArrayList<HashMap<String, ArrayList<Attendance>>> attendList = (ArrayList<HashMap<String, ArrayList<Attendance>>>) request.getAttribute("attendList");
	
	ArrayList<HashMap<String, Object>> studentList = (ArrayList<HashMap<String, Object>>) request.getAttribute("studentList");
	Member m = new Member();
	Student s = new Student();
	HashMap<String, Object> map = new HashMap<String, Object>();
	
	for(int i=0; i<studentList.size(); i++){
		m = (Member) studentList.get(i).get("member");
		s = (Student) studentList.get(i).get("student");
		
		map.put("member"+i, m);
		map.put("student"+i, s);
	}
	
	ArrayList<Member> mem = new ArrayList<>();
	ArrayList<Student> stu = new ArrayList<>();
	for(int j=0; j<map.size(); j++) {
		mem.add((Member) map.get("member"+j));
		stu.add((Student) map.get("student"+j));
	}
	
	Calendar cal = Calendar.getInstance();
    int dayOfMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
    int month = cal.get(Calendar.MONTH) + 1;
    
    SelectDate selectDate = (SelectDate) request.getAttribute("selectDate");
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
    
   .studentListArea {
      width: 74%;
      margin-left: 7%;
      height:500px;
      position:absolute;
      display:inline;
      overflow:auto;
   }
   
   .selectArea {
      top:30%;
      margin-left: 8.7%;
   }
   
   .bottomArea {
      background:white;
      position:static;
   }
   
   .detailReasonArea {
      width:74%;
      margin-left: 7%;
      position:absolute;
      top:95%;
      margin-bottom:30px;
      visibility:hidden;
      background: #f5f5f5;
      border-radius: 5px;
   }
   
   fieldset {
      width:16%;
   }
   
   .attendBtn {
      font-size: 18px;
      margin-left: 1%;
      font-family: "Nanum Gothic";
      font-weight: bold;
      border: 2px solid green;
      display: inline;
   }
   
   .attendBtn:hover {
      cursor: pointer;
      background: green;
      border: 2px solid green;
      color: white;
      display: inline;
   }
   
   .fixed-header th { position: sticky; top: -1px; left:0; }
   
   #stuName {
      padding-left:50px;
      padding-right:50px;
   }
   
   #stuInfo {
      padding-left:100px;
      padding-right:100px;
   }
   
   #writeBtn { 
       border:2px solid green; 
       background: white; 
       border-radius: 5px;
       font-size: 18px
   }
   
   #writeBtn:hover {
   background: green;
   color: white;
   }
   
   td.fixed {
      position: relative;
      left: 0;
      z-index: 1;
   }
   
   .fixed {
      position: fixed;
   }
   
   #reasonWrite:hover {
      cursor: pointer;
   }
   
   	/* 모달 닫기 버튼 */
	#xBtn2 {
		color: #aaa;
		/* float: right; */
		font-size: 28px;
		font-weight: bold;
	}
	
	#xBtn2:hover, #xBtn2:focus {
		color: black;
		text-decoration: none;
		cursor: pointer;
	}
	
	.btnArea span {
		margin-left: 85%;
	}
	
	.month {
	display: inline;
	}
	
	.selectMonth {
		border: none;
		font-size: 30px;
		height: 50px;
	}
</style>
</head>
<body>
   <header>
   <%@ include file="/viewAcademy/common/menubar.jsp" %>
   </header>
   <section>
   <div align="center">
            <fieldset style="margin-bottom:-30px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;">
            <legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">　출결 상세　</h1></legend>
            </fieldset>
    </div> <!-- center end -->
    
    
     		<!-- 년/월 선택 부분 -->
			<div align="center" class="monthArea">
				<button class="month nextBtn">◀</button>&nbsp;
				<select id="selectYear" class="month selectMonth" onchange="changeDate();">
					<% for(int i = selectDate.getStartYear(); i <= selectDate.getEndYear(); i++) { %>
					<% if(i == selectDate.getSelectYear()) { %>
					<option selected><%= i %></option>
					<% } else { %>
					<option><%= i %></option>
					<% } } %>
				</select> <label style="font-size:20px">년</label>
				<select id="selectMonth" class="month selectMonth" onchange="changeDate();">
					<% if(selectDate.getStartYear() == selectDate.getEndYear()) { %>
						<% for(int i = selectDate.getStartMonth(); i <= selectDate.getEndMonth(); i++) { %>
							<% if(i == selectDate.getSelectMonth()) { %>
							<option selected><%= i %></option>
							<% } else { %>
							<option><%= i %></option>
							<% } %>
						<% } %>
					<% } else { %>
						<% for(int i = 1; i < 13; i++) { %>
							<% if(i == selectDate.getSelectMonth()) { %>
							<option selected><%= i %></option>
							<% } else { %>
							<option><%= i %></option>
							<% } %>
						<% } %>
					<% } %>
				</select> <label style="font-size:20px">월</label>&nbsp;
				<button class="month nextBtn">▶</button>
			</div> <!-- monthArea end -->
			
			
   <div class="selectArea">
      <select id="selectAttend" style="margin-bottom:1%;">
         <option value="0">출석</option>
         <option value="1">결석</option>
         <option value="2">지각</option>
         <option value="3">조퇴</option>
      </select>
      <button class="attendBtn">적용</button>
   </div>
   
      <div align="center" class="studentListArea">
         <form>
            <table class="studentListTable table">
               <tr class="fixed-header">
                  <th><input type="checkbox" id="checkAll">
                  	  <input type="hidden" id="classNum" value="<%=classNum%>"></th>
                  <th id="stuName">이름</th>
                  <th id="stuInfo" nowrap>정보</th>
                  <% for(int i=0; i<dayOfMonth; i++) {
                    	 String name = "date"+(i+1);  %>
                  <th id="<%=name%>" class="date"><%=month%> / <% if((i+1)<=9) { %>0<%=i+1%><% }else {%><%=i+1%><%} %></th>
                  <% } %>
               </tr>
                     <% for(int i=0; i<attendList.size(); i++) {
                    	String checkboxName = "checkboxName" + i;
                        HashMap<String, ArrayList<Attendance>> hmap = attendList.get(i);                     
                        ArrayList<Attendance> list = null;
                        
                        Iterator<String> iter = hmap.keySet().iterator();
                      %><tr><%  while(iter.hasNext()){
                           String keys = (String) iter.next();
                           list = hmap.get(keys);   %>

                           <td><input type="checkbox" id="checkOne" name="checkboxName"></td>
                           <td style="padding:10px;"><%= keys %></td>
                           <td id="Infocol<%=i%>" style="padding:10px;"><% if(mem.get(i).getName().equals(keys)){ %>
                           					<%=stu.get(i).getSchool()%><br>
                           					<%=stu.get(i).getGrade()%>학년<br>
                           					<%=mem.get(i).getPhone()%>
                           					<input type="hidden" class="hidden" value="<%=mem.get(i).getUserNo()%>">
                           					<% } %></td>
                           
                           <%    
                              ArrayList<String> dateArr = new ArrayList<>();
                              for(int j=0; j<list.size(); j++) {
                                 
                                  if(!(list.get(j).getAttStatus().equals("Y"))){ 
                                    DateFormat sdFormat = new SimpleDateFormat("yyyyMMdd");
                                    Date attendDate = list.get(j).getAttDate();
                                    String tempDate = sdFormat.format(attendDate);
                                    
                                    String tempDate2 = tempDate.substring(tempDate.length()-2, tempDate.length()); 
                                     
                                    String date = "";
                                    if(tempDate2.charAt(0)=='0'){
                                       date = tempDate2.substring(tempDate2.length()-1, tempDate2.length()) + list.get(j).getAttStatus();
                                    }else {
                                       date = tempDate2 + list.get(j).getAttStatus();   
                                    }
                                    
                                    dateArr.add(date);
                                    
                                    }
                                 
                              }                                                          
                              
                              for(int b=0; b<dateArr.size(); b++){                          	  
                            	  String subString = dateArr.get(b).substring(0, 2);                           	  
                              }
                              
                              	
                              
                              //0: 출석(Y), 1: 결석(N), 2:지각(L), 3:조퇴(E)
                              String[] attendCheck = new String[dayOfMonth];
                              
                              for(int x=0; x<attendCheck.length; x++){
                                 attendCheck[x] = "0";	//기본값은 출석(Y)
                              }
                              
                              for(int k=0; k<dateArr.size(); k++) {
                                 for(int q=0; q<dayOfMonth; q++) {
                                	if(dateArr.get(k).length()==2) {	//날짜가 한자리 일때
                                    	if(dateArr.get(k).substring(0, 1).equals(q+1+"")){
                                    		if(dateArr.get(k).substring(dateArr.get(k).length()-1, dateArr.get(k).length()).equals("L")){
                                    			attendCheck[q] = "2"; 
                                    		}else if(dateArr.get(k).substring(dateArr.get(k).length()-1, dateArr.get(k).length()).equals("E")){
                                    			attendCheck[q] = "3";
                                    		}else if(dateArr.get(k).substring(dateArr.get(k).length()-1, dateArr.get(k).length()).equals("N")){
                                    			attendCheck[q] = "1";
                                    		}
                                    	}
                                	}else {	//날짜가 두자리 일때 
                                		if(dateArr.get(k).substring(0, 2).equals(q+1+"")){
                                			if(dateArr.get(k).substring(dateArr.get(k).length()-1, dateArr.get(k).length()).equals("L")){
                                    			attendCheck[q] = "2"; 
                                    		}else if(dateArr.get(k).substring(dateArr.get(k).length()-1, dateArr.get(k).length()).equals("E")){
                                    			attendCheck[q] = "3";
                                    		}else if(dateArr.get(k).substring(dateArr.get(k).length()-1, dateArr.get(k).length()).equals("N")){
                                    			attendCheck[q] = "1";
                                    		}                                                                              
                                    	}
                                	}	
                                 }
                              }
                              
                                                           
                              for(int l=0; l<attendCheck.length; l++) {
                            	  String name = "reasonWrite" + (l+1);
                                 if(attendCheck[l].equals("1")) { %>
                                 <td style="padding:10px"><a id="<%=name%>" class="reasonWrite" value="<%=l+1%>" style="color:red">결석</a></td>
                              <% }else if(attendCheck[l].equals("2")) {  %>
                                 <td style="padding:15px"><a id="<%=name%>" class="reasonWrite" value="<%=l+1%>" style="color:orangered">지각</a></td>
                              <% }else if(attendCheck[l].equals("3")) {	%>
                              	 <td style="padding:15px"><a id="<%=name%>" class="reasonWrite" value="<%=l+1%>" style="color:orangered">조퇴</a></td>
                   			  <% }else if(attendCheck[l].equals("0")) { %>          	
                              	 <td style="padding:15px" id="<%=name%>" class="reasonWrite" value="<%=l+1%>">출석</td>
                              <% }else { %>
                              	<td>X</td>
                              <% } %>
                                                      
                      <%  }
                              
                        } %>  </tr>
                  <%   }  %>
                   
             </table>
         </form>
      </div>
   <div class="bottomArea">
         <div class="detailReasonArea">
            <div class="btnArea" style="display:flex;">
            <ul>
            <li style="font-size:18px;">출결 상세 사유</li>
            </ul>
            
               <button id="writeBtn" style="height:30px; margin:14px">수정</button>
               <!-- <span id="xBtn2">&times;</span> -->
 
            </div>
            <div align="center" class="reasonContent">
               <form action="" method="post">
                  <textarea id="reasonArea" style="border-radius: 5px; margin-bottom: 1%; width: 80%; height: 50px; resize:none;"></textarea>

               </form>
            </div>
         </div> <!-- detailReasonArea end -->
      </div> <!-- bottomArea end -->
   <script>
      $(function(){
         $("input:checkbox[id='checkAll']").change(function(){         
            if(this.checked){
               $("input:checkbox[id='checkOne']").prop("checked",true);            
            }else {
               $("input:checkbox[id='checkOne']").prop("checked",false);
            }
         });
      });
	
      //출결 상세 사유 불러오기 + 수정하기 기능
      $(function() {
         $(document).on("click", ".reasonWrite", function() {
             $(".detailReasonArea").css("visibility","visible");
             var idx = $(this).parent().index()-2;
        	 
        	 var date = $(this).parent().parent().siblings().eq(0).children("th")[idx+2].innerText;
        	 
        	 var userNo = $(this).parent().siblings().eq(2).children("input")[0].value;
        	 
        	 var classNum = $("#classNum").val();
        	 
        	 var result = "";
        	         	 
        	 $.ajax({
        		 url: "aselectAttendReasonDetail.attend",
        		 data: { classNum:classNum, date:date, userNo:userNo },
        		 type: "get",
        		 success: function(data){
        			 var reason = decodeURIComponent(data.reason);
        			 result = reason.replace(/\+/gi, ' ');
        			
        			 $("#reasonArea").text(result);
        		 },
        		 error:function(data){
        			console.log('실패'); 
        		 }
        	 });
         
        		
        	$("#writeBtn").click(function(){       	
        		var content = $("#reasonArea").val();
        		
        		if(result != content) {       			
	        		$.ajax({
	        			url:"aupdateAttendReason.attend",
	        			data:{
	        				classNum:classNum,
	        				date:date,
	        				userNo:userNo,
	        				content:content
	        			 },
	        			 type:"get",
	        			 success:function(data){
	        				 console.log(data);
	        				 alert('수정 완료!');
	        				 
	        			 },
	        			 error:function(data){
	        				console.log("에러.."); 
	        			 }
	        		});
        		}
        	 });
         });
      	
      });
      
      $(function() {
    	 var checkedPerson = [];
 		 var selectAttend = "";
    	  $(document).on("change", "input[name='checkboxName']", function(){
    		  if($("input[name='checkboxName']").prop("checked")) {
    		  		checkedPerson.push($(this).parent().siblings().eq(1).children("input[type=hidden]").val());
    		  		console.log(checkedPerson);
    		  }
    		
    	  });
    	  
    	  $(".attendBtn").click(function(){           	
	    		var selectAttend = $("#selectAttend option:selected").val();
	    		var checkedPersonString = "'"+ checkedPerson + "'";
	    		 var classNum = $("#classNum").val();
	    		console.log("selectAttend : " + selectAttend);
		    	console.log("checkedPersonString : " + checkedPersonString);
		    	console.log("classNum : " + classNum);

		    	
		    	location.href="<%=request.getContextPath()%>/aupdateAttend.attend?selectAttend="+selectAttend+"&checkedPersonString="+checkedPersonString+"&classNum="+classNum;
	      });
      });
      
   </script>
   </section>
   <footer></footer>
</body>
</html>