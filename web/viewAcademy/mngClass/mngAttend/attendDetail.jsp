<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.text.*, hagong.academy.mngClass.mngAttend.model.vo.*"%>
<% 
	ArrayList<HashMap<String, ArrayList<Attendance>>> attendList = (ArrayList<HashMap<String, ArrayList<Attendance>>>) request.getAttribute("attendList");	

	
	for(int i=0; i<attendList.size(); i++) {
		HashMap<String, ArrayList<Attendance>> hmap = attendList.get(i);
		ArrayList<Attendance> list = null;
		
		Iterator<String> iter = hmap.keySet().iterator();
		while(iter.hasNext()){
			String keys = (String) iter.next();
			System.out.println("keys : " + keys);
			list = hmap.get(keys);
			
		}
		
		
		System.out.println("list : " + list);
		
	} 
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
   <div class="selectArea">
      <select style="margin-bottom:1%;">
         <option>출석</option>
         <option>결석</option>
         <option>지각</option>
         <option>조퇴</option>
      </select>
      <button class="attendBtn">적용</button>
   </div>
   
      <div align="center" class="studentListArea">
         <form>
            <table class="studentListTable table">
               <tr class="fixed-header">
                  <th><input type="checkbox" id="checkAll"></th>
                  <th id="stuName">이름</th>
                  <th id="stuInfo" nowrap>정보</th>
                  <% Calendar cal = Calendar.getInstance();
                     int dayOfMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
                     int month = cal.get(Calendar.MONTH) + 1;
                     
                     System.out.println("dayOfMonth : " + dayOfMonth);
                     System.out.println("month : " + month);
                     int[] index = new int[dayOfMonth];
                     for(int i=0; i<dayOfMonth; i++) {
                    	 
                    	 index[i] = i+1;
                  %>
                  <th><%=month%>/<% if((i+1)<=9) { %>0<%=i+1%><% }else {%><%=i+1%><%} %></th>
                  <% } %>
               </tr>
               		<% 	for(int i=0; i<attendList.size(); i++) {
               			HashMap<String, ArrayList<Attendance>> hmap = attendList.get(i);
               			ArrayList<Attendance> list = null;
               			
               			Iterator<String> iter = hmap.keySet().iterator();
               			while(iter.hasNext()){
               				String keys = (String) iter.next();
               				System.out.println("keys : " + keys);
               				list = hmap.get(keys);	
                   			System.out.println("list : " + list);
               				%>
               			<tr>
               				<td><input type="checkbox" id="checkOne"></td>
               				<td><%= keys %></td>
               				<td id="infoCol">학생정보</td>
               				
               				<% String[] dateArr = new String[list.size()];
               					for(int j=0; j<list.size(); j++) {
               					DateFormat sdFormat = new SimpleDateFormat("yyyyMMdd");
                      			Date attendDate = list.get(j).getAttDate();
                     			String tempDate = sdFormat.format(attendDate);
                     			String date = tempDate.substring(tempDate.length()-2, tempDate.length()); 
               					
                     			System.out.println("date : " + date);
                     			
                     			dateArr[j] = date;
                     			
              					}
               				
                     			for(int k=0; k<dateArr.length; k++) {
                     				for(int q = 0; q < dayOfMonth; q++){
                     					if(dateArr[k].equals(q+1+"")){
                     					%>
                     					
                     					<td>출석</td>
                     					
                     					<%
                     					}//else{%> 
			                     			
                     				<% 
                     				
                     				}
                     				
                     				}
                     			
               				
               		
               			
               			}
               			}
               		%>
                  	<!-- for(int k=0; k<dayOfMonth; k++) { -->
					<%-- <%}else { %>                  
                  <td style="padding:20px"><a id="reasonWrite">결석</a></td>
                  <% }
                  	} %>
               </tr>
               <% } %> --%>
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
 
            </div>
            <div align="center" class="reasonContent">
               <form action="" method="post">
                  <textarea style="border-radius: 5px; margin-bottom: 1%; width: 80%; height: 50px; resize:none;"></textarea>

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
/*       
      $(function(){
         $(".studentListTable td").click(function(){
        	 $(".detailReasonArea").css("visibility","visible");
         });
      });
       */
      $(function() {
    	  $("#reasonWrite").click(function() {
    		  $(".detailReasonArea").css("visibility","visible");
    	  });
      });
      
   </script>
   </section>
   <footer></footer>
</body>
</html>