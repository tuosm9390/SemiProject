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
   .sendMsg {font-size:14px;color:green;display:block;}
   .msgArea{float: left;margin-left: 105px;margin-top: 2px;}
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
      <h1 style="color:green; font-family: 'Do Hyeon';">비밀번호 설정</h1>
      <form id="middle" method="post">
         <table>
            <tr>
               <td width="20%">아이디</td>
               <td colspan="2" width="80%"><input type="text" name="userId" placeholder=" 아이디 입력"></td>
            </tr>
            <tr>
                  <td>전화번호</td>
                  <td style="width:180px; text-align: center;">
	                  <input type="tel" maxlength="3" name="tel"> - 
			          <input type="tel" maxlength="4" name="tel"> -
			          <input type="tel" maxlength="4" name="tel">
          		  </td>
                  <td style="align-items: center;"><div align="right"><button type="button" style="height: 30px;" id="sendMsg">인증하기</button></div></td>
            </tr>
            <tr>
               <td>인증번호</td>
               <td colspan="2"><input type="text" id="number" name="number" placeholder=" 인증번호 입력" disabled></td>
            </tr>
         </table>
      </form>
      <div class="msgArea">
               	
      </div>
      <div id="container-footer">
      	 <input id="smsck" type="hidden" value="false">
         <button type="button" id="okBtn"style="margin-top: 30px;">확인</button>
      </div>
   </div>
   </div>
   <script>
   		$("#okBtn").click(function(){
   			console.log($("#smsck").val());
   			if($("#smsck").val() == "true"){
   				location.href="<%= request.getContextPath() %>/viewAcademy/common/newPwd2.jsp";  				
   			}else{
   				alert("입력하신 정보가 일치하지 않습니다!");
   			}
   		});

   		$("#sendMsg").click(function(){
   			var phone = "";
   			$("input[name = tel]").filter(function(value){
   				phone += this.value;
   			});
   			console.log("phone : " + phone);
   			var userId = $("input[name = userId]").val();
   			
			$.ajax({
				url:"<%= request.getContextPath()%>/sendMsg.cm",
				type:"get",
				data:{
					userId:userId,
					phone:phone
				},
				success:function(data){
					console.log(data);
					$(".msgArea").append('<span class="sendMsg">인증번호를 발송했습니다.</span>');
					$("#number").prop("disabled", false);
				},
				error:function(data){
					console.log("실패!");
				}
			});
   		});
   		
   		$("#number").change(function(){
   			var phoneCk = "";
   			$("input[name = tel]").filter(function(value){
   				phoneCk += this.value;
   			});
   			console.log("phone : " + phoneCk);
   			var userIdCk = $("input[name = userId]").val();
   			
   			$.ajax({
   				url:"<%= request.getContextPath() %>/checkMsg.cm",
   				type:"get",
   				data:{
   					userId:userIdCk,
   					phone:phoneCk
   				},
   				success:function(data){
   		   			if($("#number").val() == data){
   		   				$(".msgArea").text('');
   		   				$(".msgArea").append('<span class="sendMsg">인증번호가 일치합니다</span>');
   		   				$("#number").css("border","1px solid green")
   		   				$("#smsck").val("true");
   		   			}else{
   		   				$(".msgArea").text('');
   		   				$(".msgArea").append('<span class="sendMsg">인증번호가 일치하지 않습니다.</span>');
   		   				$(".sendMsg").css("color","red");
   		   				$("#number").css("border","1px solid red");
   		   				$("#smsck").val("false");
   		   			}
   				},
   				error:function(data){
   					console.log("실패!");
   				}
   			}); 

   		});
   		
   		
   </script>
</body>
</html>