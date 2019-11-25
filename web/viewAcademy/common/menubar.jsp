<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon:400"
   rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400"
   rel="stylesheet">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
#menuheader {
   position: fixed;
   top: 0px;
   left: 7%;
   right: 7%;
   height: 75px;
   padding-top: 1rem;
   font-weight: bold;
   background: white;
   display: flex;
   justify-content: space-around;
   align-items: center;
   font-family: "Do Hyeon";
}

#mid {
   position: fixed;
   top: 91px;
   left: 7%;
   right: 7%;
   height: 30px;
   font-weight: bold;
   background: lightgray;
   display: flex;
   align-items: center;
}

h2:hover, h2:visited, h2:active {
   cursor: pointer;
   color: orangered;
}

button {
   float: right;
   font-size: 0.8em;
   border: 1px solid green;
   border-radius: 5px;
   background: none;
   color: black;
   display: block;
   position: relative;
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

button:focus{
   outline: none;
}

button:hover {
   cursor: pointer;
   background: green;
   border: 1px solid green;
   color: white;
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
   display: flex;
   float: right;
   right: 7%;
}

a {
   margin-right: 10px;
   color: white;
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
</style>
</head>
<body>
   <!-- 상단 메뉴 바 -->
   <header id="menuheader">
      <a href="hagongmain.jsp"><img src="images/hagong.png"
         style="height: 85px;"></a>
      <h2 id="student">학생관리</h2>
      <h2 id="employee">직원관리</h2>
      <h2 id="class">수업관리</h2>
      <h2 id="admin">관리자</h2>
      &nbsp;
      <h3>공지</h3>
      <h3>SMS</h3>
      <h3>캘린더</h3>
      <button id="logout" style="margin-left: 5px;">로그아웃</button>

      <!-- 하단 회색 바 -->
      <div id="mid">
         <!-- 학생관리 메뉴 -->
         <div class="detailmenu" id="studentdetailmenu">
            <a href="smspage.jsp" class="menu1">개인정보</a> <a>|</a> <a href="#"
               class="menu1">수납</a> <a>|</a> <a href="#" class="menu1">상담</a> <a>|</a>
            <a href="#" class="menu1">블랙리스트</a>
         </div>
         <!-- 수업관리 메뉴 -->
         <div class="detailmenu" id="classdetailmenu">
            <a href="#" class="menu3">수강생 관리</a> <a>|</a> <a href="#"
               class="menu3">출결 관리</a> <a>|</a> <a href="#" class="menu3">강좌목록
               관리</a> <a>|</a> <a href="#" class="menu3">만족도</a>
         </div>
         <!-- 관리자 메뉴 -->
         <div class="detailmenu" id="admindetailmenu">
            <a href="#" class="menu4">학원 현황</a> <a>|</a> <a href="#"
               class="menu4">메뉴 권한 관리</a> <a>|</a> <a href="#" class="menu4">연간
               계획</a>
         </div>

         <div id="member">
            <h3 align="center" style="margin-right: 20px">관리자님</h3>
            <button
               style="margin-right: 5px; background: none; border: none; text-decoration: underline;">내
               정보 수정</button>
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
      //학생 관리 메뉴 클릭 시
      $("#student").click(function() {
         $('#classdetailmenu').hide();
         $('#admindetailmenu').hide();
         if ($(".detailmenu").css("display") == "none") {
            $("#studentdetailmenu").show();
         } else {
            $("#studentdetailmenu").hide();
         }
      });

      //직원 관리 메뉴 클릭 시
      $("#employee").click(function() {
         $(".detailmenu").css("display", "none");
      });

      //수업 관리 메뉴 클릭 시
      $("#class").click(function() {
         $("#studentdetailmenu").hide();
         $('#admindetailmenu').hide();
         if ($("#classdetailmenu").css("display") == "none") {
            $('#classdetailmenu').show();
         } else {
            $('#classdetailmenu').hide();
         }
      });

      //관리자 메뉴 클릭 시
      $("#admin").click(function() {
         $("#studentdetailmenu").hide();
         $('#classdetailmenu').hide();
         if ($("#admindetailmenu").css("display") == "none") {
            $('#admindetailmenu').show();
         } else {
            $('#admindetailmenu').hide();
         }
      });
   </script>
</body>
</html>