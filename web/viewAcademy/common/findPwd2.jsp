<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding:400" rel="stylesheet">
<style>
   .background {
      position: absolute;
       top: 48%;
       left: 50%;
       transform: translate(-50%, -50%)
   }
   #container {
      width:450px;
      height:40%;
      align:center;
      border:1px solid gray;
      padding-top:30px;
      padding-bottom:30px;
      margin-top:150px;
      margin-bottom:50px;
      margin-left:auto;
      margin-right:auto;
      border-radius: 10px/10px;
        box-shadow:2px 2px 2px 2px #999;
        font-family:"Nanum Gothic Coding"; */
   }
   
   #container-footer {
      margin-bottom:30px;
   }
   
   ul { list-style:none; margin-right:25px;}
   table {width:80%;}
   td {height:50px;}
   input {height:30px; width:100%; border: 1px solid lightgray; border-radius: 5px;}
   input:hover { border:2px solid green; }
   #okBtn { width:250px; height:40px; background:white; border:1px solid green; border-radius:5px/5px;}
   #okBtn:hover { background:green; color:white; }
</style>
<style type="text/css">
   body {
         font-family: "Nanum Gothic Coding";
   }
</style>
</head>
<body>
   <%@ include file="../../viewAcademy/common/menubar.jsp"%>
   <div class="background">   
   <div align="center" id="container">
      <h1 style="color:green;  font-family: 'Do Hyeon';">비밀번호 변경</h1>
      <form id="middle">
      <table>
         <tr>
            <td width="35%">비밀번호 입력　</td>
            <td width="65%"><input type="password" id="newPwd" name="newPwd" placeholder=" 변경할 비밀번호 입력"></td>   
         </tr>
         <tr>
            <td>비밀번호 확인　</td>
            <td><input type="password" id="newPwd2" name="newPwd2" placeholder=" 비밀번호 확인" ></td>
         
         </tr>
         <tr>
            <td colspan="2"><label id="checkPwd" style="display:none; background:pink; color:red">비밀번호가 일치하지 않습니다.</label></td>
         </tr>
      </table>
   </form>
      <div id="container-footer">
         <ul>
            <li>
            <input type="button" id="okBtn" value="확인" action="" method="">
            </li>
         </ul>
      </div>
   </div>
   </div>
   <script>
      $("input[type='password']").keyup(function(){
         var pwd1 = $("#newPwd").val();
         var pwd2 = $("#newPwd2").val();
         
         if(pwd1 != "" || pwd2 != "") {
            if(pwd1 != pwd2) {
               $("#checkPwd").show();
            }else {
               $("#checkPwd").hide();
               
               $("#okBtn").click(function(){
                  //서블릿으로 변경할 비밀번호 전송 후 결과 성공이면 변경되었다는 팝업, 실패면 실패 팝업..?                                                                                                      
                  //console.log(pwd2);
                  href.location="<%=request.getContextPath()%>/update.me";
               });
            }
         }
      });
      
   </script>
</body>
</html>