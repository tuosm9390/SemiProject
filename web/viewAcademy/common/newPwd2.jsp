<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
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
      font-family:"Nanum Gothic Coding";
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
            <td width="65%"><input type="password" id="newPwd" name="userPwd" placeholder=" 변경할 비밀번호 입력"></td>   
         </tr>
         <tr>
            <td>비밀번호 확인　</td>
            <td><input type="password" id="newPwd2" name="userPwd" placeholder=" 비밀번호 확인" ></td>
         
         </tr>
         <tr>
            <td colspan="2" align="center"><label id="checkPwd" style="display:none; background:pink; color:red">비밀번호가 일치하지 않습니다.</label></td>
         </tr>
      </table>
   </form>
      <div id="container-footer">
         <ul>
            <li>
            <button id="okBtn">확인</button>
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
            	console.log("다름");
               $("#checkPwd").show();
               
               
               $("#okBtn").click(function(){
            	   console.log('다를때 온클릭');
            	  swal ({
	       				text: "비밀번호와 비밀번호 확인이 일치하지 않습니다.",
	       				icon: "warning",
	       				button: "확인"
       				});
       				
               });
            }else {
            	console.log("같음");
               $("#checkPwd").hide();
              	
               $("#okBtn").click(function() {
            	   console.log("온클릭됐음");
            	   //영문,숫자,특수문자 혼합하여 8자리~20자리 이내.(비밀번호 표준)
            	  /* 	var num = pwd1.search(/[0-9]/g);
            	    var eng = pwd1.search(/[a-z]/ig);
            	    var spe = pwd1.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi); */
            	   if((pwd1!='0000' && pwd2!='0000') && (pwd1.length > 8 || pwd1.length < 20)) {
           	 	
	       			$.ajax({
	       				url: "<%=request.getContextPath()%>/firstUpdate2.cm",
	       				data: {
	       					pwd2:pwd2
	       				},
	       				type: "post",
	       				success: function(data) {
	       					swal ({
	    	       				text: "비밀번호 설정이 완료되었습니다.",
	    	       				icon: "success",
	    	       				button: "확인"
	           				}).then(function(){
	           					location.href="<%=request.getContextPath()%>/viewAcademy/main.jsp";
	           				});
	       				},
	       				error: function(data) {	       					
	       				}
	       			});
            	   }else {
            		   swal ({
   	       				text: "변경하실 비밀번호는 영문, 숫자, 특수문자를 혼합하여 8자리 ~ 20자리 이내로 입력해주세요.",
   	       				icon: "warning",
   	       				button: "확인"
          				});
            	   }
       			});
               
               
            
         		}
         	}
      });
      
      
   </script>
</body>
</html>