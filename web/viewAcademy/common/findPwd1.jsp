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
      margin-top:140px;
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
   
   table {width:90%}
   td { text-align: left; height: 50px; align-items: center;}
   input { height:30px; width:100%; border: 1px solid lightgray; border-radius: 5px;}
   input:hover { border:2px solid green; }
   input[type=tel] {
   text-align: center;
   width: 56px;
   }
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
      <h1 style="color:green; font-family: 'Do Hyeon';">비밀번호 찾기</h1>
      <form id="middle">
         <table>
            <tr>
               <td width="20%">아이디</td>
               <td colspan="2" width="80%"><input type="password" id="newPwd" name="newPwd" placeholder=" 아이디 입력"></td>
            </tr>
            <tr>
                  <td>전화번호</td>
                  <td style="width:180px; text-align: center;">
                  <input type="tel" maxlength="3"> - 
            <input type="tel" maxlength="4"> -
            <input type="tel" maxlength="4">
            </td>
                  <td style="align-items: center;"><div align="right"><button style="height: 30px;">인증하기</button></div></td>
            </tr>
            <tr>
               <td>인증번호</td>
               <td colspan="2"><input type="text" id="number" name="number" placeholder=" 인증번호 입력"></td>
            </tr>
         </table>
      </form>
      <div id="container-footer">
         <input type="button" id="okBtn" value="확인" action="" method="" style="margin-top: 30px;"
         onclick="location.href='<%=request.getContextPath()%>/viewAcademy/common/findPwd2.jsp'">
      </div>
   </div>
   </div>
</body>
</html>