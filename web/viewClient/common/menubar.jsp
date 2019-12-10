<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%-- <%
   Member loginMember = (Member) request.getSession().getAttribute("loginMember");
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>HAGONG</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon:400"
   rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400"
   rel="stylesheet">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/css/normalize.css" />
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/css/demo.css" />
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/css/component.css" />
<script
   src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script>
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
#menuheader {
   position: fixed;
   top: 0px;
   left: 7%;
   right: 7%;
   height: 122px;
   font-weight: bold;
   background: white;
   display: flex;
   justify-content: space-around;
   align-items: center;
   font-family: "Do Hyeon";
   z-index: 1;
}

#mid {
   position: fixed;
   top: 93px;
   left: 7%;
   right: 7%;
   height: 30px;
   font-weight: bold;
   background: rgba(211, 211, 211, 0.4);
   display: flex;
   align-items: center;
}

#menuheader>.topmenu:hover, .topmenu:visited, .topmenu:active {
   cursor: pointer;
   color: orangered;
}

#menuheader>h3:hover, h3:visited, h3:active {
   cursor: pointer;
}

button {
   border: 1px solid green;
   border-radius: 5px;
   background: none;
   color: black;
   display: block;
   position: relative;
}

button:focus {
   outline: none;
}

input:focus {
   outline: none;
}

button:hover {
   cursor: pointer;
   background: green;
   border: 1px solid green;
   color: white;
}

#topbutton {
   height: 50px;
   width: 50px;
   background: lightgray;
   border: none;
   border-radius: 50px;
   cursor: pointer;
   float: right;
   position: fixed;
   right: 50px;
   bottom: 50px;
}

/* 학생관리 */
#studentdetailmenu {
   color: black;
   position: absolute;
   left: 13%;
   font-weight: normal;
   display: none;
}

/* 수업관리 */
#classdetailmenu {
   color: black;
   position: absolute;
   left: 30%;
   font-weight: normal;
   display: none;
}

/* 관리자 */
#admindetailmenu {
   color: black;
   position: absolute;
   left: 40%;
   font-weight: normal;
   display: none;
}

#member {
   position: fixed;
   display: inline-flex;
   right: 7%;
   height: 30px;
   width: 13%;
}

a {
   margin-right: 10px;
   color: #333;
   text-decoration: underline;
}
/* 세부메뉴 */
.detailmenu>a {
   text-decoration: none;
}

.detailmenu>a[class]:hover {
   color: black;
}

body {
   margin-top: 150px;
   margin-left: 7%;
   margin-right: 7%;
}

td, th {
   text-align: center;
}

#name:focus, #name:hover {
   outline: none;
   cursor: default;
   color: black;
}

section {
   font-family: "Nanum Gothic" !important;
}
</style>
</head>
<body>

   <!-- 상단 메뉴 바 -->
   <header>
      <div id="menuheader">
         <a href="<%=request.getContextPath()%>/index.jsp"> <img
            src="<%=request.getContextPath()%>/images/hagong.png"
            style="height: 85px;"></a>
         <h2 class="topmenu" id="attendance" onclick="GoAttendance();">출결조회</h2>
         <h2 class="topmenu" id="score" onclick="goScore();">성적조회</h2>
         <h2 class="topmenu" id="satisfy" onclick="goSaisfy();">만족도조사</h2>
         <h2 class="topmenu" id="receipt" onclick="goReceipt();">고지서/영수증</h2>
         &nbsp;
         <%-- <% if(loginMember != null) { %> --%>
         <!-- <button id="logout" style="margin-left: 5px;">로그아웃</button> -->
         <%-- <% }else { %> --%>
         <button id="login" style="margin-left: 5px;">로그인</button>
         <%-- <% } --%>
         <div id="mid">
            <div id="member">
               <button type="button" id="name"
                  style="margin-right: 4%; background: none; border: none; font-size: x-large;">학생</button>
               <button
                  style="margin-left: 15px; background: none; border: none; text-decoration: underline;"
                  onclick="myInfo();">개인정보 관리</button>
            </div>
         </div>
      </div>
   </header>
   <section></section>

   <!-- 하단 메뉴 -->
   <footer>
      <button id="topbutton" onclick="location.href='#'">TOP</button>
   </footer>

   <!-- 스크립트 -->
   <script>
      $("#login").click(function() {
             location.href="<%=request.getContextPath()%>/viewAcademy/common/login.jsp";
        });

      $("#logout").click(function() {
          <%-- location.href="<%=request.getContextPath()%>/logout.me"; --%>
          swal("로그아웃 하시겠습니까?", {
             buttons : [ "취소", "확인" ],
          });
       });

      //내 정보 수정
      function myInfo(){
          location.href = "<%=request.getContextPath()%>/viewAcademy/commonMenu/UserInfo.jsp";
       };
       
       function GoAttendance(){
          location.href = "<%=request.getContextPath()%>/viewAcademy/mngStudent/mngInfo/studentInfo.jsp";
       }
       function goScore(){
          location.href="<%=request.getContextPath()%>/viewAcademy/mngClass/mngSatisfy/satisfactionList.jsp";
       }
       function goSaisfy(){
          location.href="<%=request.getContextPath()%>/viewAcademy/mngClass/mngSatisfy/satisfactionList.jsp";
       }
       function goReceipt(){
          location.href="<%=request.getContextPath()%>/viewClient/mnReceipt/client.jsp";
       }
   </script>

</body>
</html>