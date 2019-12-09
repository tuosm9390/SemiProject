<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
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
      width: 86%;
      margin-left: auto;
      margin-right: auto;
      height:550px;
      position:absolute;
      display:inline;
      overflow:auto;
   }
   
   .selectArea {
      top:30%;
   }
   
   .bottomArea {
      background:white;
      position:static;
   }
   
   .attendDetailArea {
      width:43%;
      height:400px;
      border:1px solid lightgray;
      border-radius: 5px;
      background:white;
      position:absolute;
      top:105%;
      left:7%;
      margin-bottom:30px;
      overflow:auto;
      visibility:hidden;
   }
   
   .detailReasonArea {
      width:43%;
      height:400px;
      position:absolute;
      top:105%;
      left:50%;
      margin-bottom:30px;
      visibility:hidden;
      background: #f5f5f5;
      border-radius: 5px;
   }
   
   fieldset {
      width:16%;
   }
   
   .attendBtn {
      
      margin-bottom:10px;
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
   	 float:right; 
   	 border:2px solid green; 
   	 background: white; 
   	 border-radius: 5px;
   	 font-size: 18px
   }
   
   #writeBtn:hover {
	background: green;
	color: white;
   }
</style>
</head>
<body>
   <header>
   <%@ include file="/viewAcademy/common/menubar.jsp" %>
   </header>
   <section>
   <div align="center">
            <fieldset style="margin-bottom:-15px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;">
            <legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">&nbsp;출결 상세&nbsp;</h1></legend>
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
   
   <div class="outer">
      <div class="studentListArea">
         <form>
            <table class="studentListTable table">
               <tr class="fixed-header">
                  <th><input type="checkbox" id="checkAll"></th>
                  <th id="stuName">이름</th>
                  <th id="stuInfo" nowrap>정보</th>
                  <% Calendar cal = Calendar.getInstance();
                     int dayOfMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
                        
                     for(int i=0; i<dayOfMonth; i++) {
                  %>
                  <th>12/<%=i+1%></th>
                  <% } %>
               </tr>
                  
               <% for(int j=0; j<20; j++) { %>
               <tr>
                  <td><input type="checkbox" id="checkOne"></td>
                  <td>빛상찬</td>
                  <td id="infoCol">kh중학교<br>4학년<br>010-4444-4444</td>
                  <% for(int k=0; k<dayOfMonth; k++) { %>
                  <td>결석</td>
                  <% } %>
               </tr>
               <% } %>
            </table>
         </form>
      </div>
   <div class="bottomArea">
      <div class="attendDetailArea">
         <ul>
         <li style="font-size:18px;">학생별 출결 상세</li>
         </ul>
         <table class="detailAreaTable table">
            <% for(int i=0; i<dayOfMonth; i++) { %>
            <tr>
               <td>12/<%= i+1 %></td>
               <td>결석</td>
            </tr>
            <% } %>
         </table>
      </div>   <!-- attendDetailArea end -->
         <div class="detailReasonArea">
            <ul>
            <li style="font-size:18px;">출결 상세 사유</li>
            </ul>
            <div class="reasonContent">
               <form action="" method="post">
                  <textarea style="border-radius: 5px; margin-bottom: 1%; width: 677px; height: 282px; resize:none;"></textarea>
                  <br>
                  <button id="writeBtn">수정</button>
               </form>
            </div>
         </div> <!-- detailReasonArea end -->
      </div> <!-- bottomArea end -->
      </div> <!-- outer end -->
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
      
      $(function(){
         $(".studentListTable td").click(function(){
            $(".attendDetailArea").css("visibility","visible");
         });
         
         $(".attendDetailArea").click(function(){
            $(".detailReasonArea").css("visibility","visible");
         })
      });
   </script>
   </section>
   <footer></footer>
</body>
</html>