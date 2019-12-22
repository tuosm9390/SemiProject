<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="hagong.academy.mngAdmin.mngLevel.model.vo.*, java.util.*"%>
   
   <% ArrayList<MngLevel> list = (ArrayList<MngLevel>) request.getSession().getAttribute("list"); %>
 
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>

 .tdclass{
 font-weight: bold;
 }
  
select {
	border-radius:5px;
}

#btd {
   border-bottom: none !important;
}

.btns {
   display: inline-block;
   float: right;
   margin-left: 10px;
   font-size: 18px;
  
}

tr {
   height: 50px;
}



.table {
   wnameth: 90% !important;
   border-collapse: collapse;
}

#mtext {
   margin-left: 5%;
}
.btndiv{
	margin-right: 5%;
}
.border{
	font-weight: bold;
	border-right: 1px solname black;
}

.trname{
	border-top: 1px solname black;
	border-bottom:1px solname black;
}
#tst{
border-right: none; 
}

.fixed-header th { position: sticky !important; top: 120px; left:0; }

  #pid{
  float: right;
  margin-top:-30px;
  }
</style>
</head>

<body>
   <header>
    <%@ include file="/viewAcademy/common/menubar.jsp"%>
<% if(loginUser != null && loginUser.getUserId().equals("admin")){ %>
   </header>
   <section>
      <article> 
         <!--  -->
         <div align="center">
            <fieldset
               style="margin-bottom: -15px; border-left: none; border-right: none; border-bottom: none; border-top-color: black; width: 20%;">
               <legend align="center">
                  <h1 align="center" style="font-family: 'Do Hyeon';">　권한부여 관리　</h1>
               </legend>
            </fieldset>
                  <p id="pid">* 모든 메뉴에 대해 원장님만 삭제기능을 가집니다.</p>
         </div>
         <!--  -->
         <div align="center">
          <form name="menuLevel" method="post" id="menuLevel" action="<%=request.getContextPath()%>/aupdate.level">
               <table class="table">
                  <tr align="right" class="fixed-header">
                     <th>&nbsp;</th>
                     <th>&nbsp;</th>
                     <th>전체조회</th>
                     <th>일부조회</th>
                     <th>등록/수정</th>
                  </tr>
                  <!-- 공통 -->
                  <tr class="trname">
                     <td class="border">공통</td>
                     <td>개인정보수정</td>
                     <td><select class="modifyInfo"  name="modifyInfo1" id="modifyInfo1">
                     		<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                      	   <option value="4">학부모</option>
                           <option value="5">학생</option>
                     </select></td>
                     <td></td>
                     <td><select class="modifyInfo" name="modifyInfo3" id="modifyInfo3">
                     
                     			<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                           <option value="4">학부모</option>
                           <option value="5">학생</option>
                          
                     </select></td>
                  </tr>
                  <!-- 원장 -->
                  <tr class="trname">
               
                     <td class="tdclass" colspan="5">　　관계자</td>
 
                  </tr>
                  <!-- 학생개인정보 -->
                  <tr>
                     <td rowspan="4" class="border even" style="background:rgba(245,244,242); border-bottom:none !important;">학생관리</td>
                     
                     <td>개인정보</td>
                     <td><select class="info" name="info1" id="info1">
                     		<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     
                     </select></td>
                     <td><select class="info" name="info2" id="info2">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                       
                     </select></td>
                     <td><select class="info" name="info3" id="info3">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     
                     </select></td>
                  </tr>
                  <!--  -->
                  <tr>
                    
                     <td>수납</td>
                     <td><select class="purchase" name="purchase1" id="purchase1">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                          
                     </select></td>
                     <td><select class="purchase" name="purchase2" id="purchase2">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     </select></td>
                     <td><select class="purchase" name="purchase3" id="purchase3">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     </select></td>
                  </tr>
                  <!--  -->
                  <tr>
                   
                     <td>상담</td>
                     <td><select class="counseling" name="counsel1" id="counsel1">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     </select></td>
                     <td><select class="counseling" name="counsel2" id="counsel2">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     </select></td>
                     <td><select class="counseling" name="counsel3" id="counsel3">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     </select></td>
                  </tr>
                  <!--  -->
                  <tr>
                     
                     <td>블랙리스트</td>
                     <td><select class="black" name="black1" id="black1">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     </select></td>
                     <td><select class="black" name="black2" id="black2">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     </select></td>
                     <td><select class="black" name="black3" id="black3">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     </select></td>
                  </tr>
                  <!--  -->

                  <tr name="qqtr">
                     <td class="border odd">직원관리</td>
                     <td>직원관리</td>
                     <td><select class="staff" name="staff1" id="staff1">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     </select></td>
                     <td><select class="staff" name="staff2" id="staff2">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     </select></td>
                     <td><select class="staff" name="staff3" id="staff3">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     </select></td>
                  </tr>
                  <!--  -->

                  <!--  -->
                  <tr>
                     <td rowspan="4" class="border even" style="background:rgba(245,244,242)">수업관리</td>
                     <td>수강생관리</td>
                     <td><select class="enroll" name="enroll1" id="enroll1">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     </select></td>
                     <td><select class="enroll" name="enroll2" id="enroll2">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     </select></td>
                     <td><select class="enroll" name="enroll3" id="enroll3">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     </select></td>
                  </tr>
                  <!--  -->
                  <tr>
                     
                     <td>출결관리</td>
                     <td><select class="attend" name="attend1" id="attend1">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     </select></td>
                     <td><select class="attend" name="attend2" id="attend2">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     </select></td>
                     <td><select class="attend" name="attend3" id="attend3">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     </select></td>
                  </tr>
                  <!--  -->
                  <tr>
                   
                     <td>강좌목록관리</td>
                     <td><select class="class" name="class1" id="class1">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     </select></td>
                     <td><select class="class" name="class2" id="class2">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     </select></td>
                     <td><select class="class" name="class3" id="class3">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     </select></td>
                  </tr>
                  <!--  -->
                  <tr>
                    
                     <td>만족도</td>
                     <td><select class="satisfy" name="satisfy1" id="satisfy1">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     </select></td>
                     <td><select class="satisfy" name="satisfy2" id="satisfy2">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     </select></td>
                     <td><select class="satisfy" name="satisfy3" id="satisfy3">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     </select></td>
                  </tr>

                  <tr>
                     <td rowspan="3" class="border odd" style="background:white">원장</td>
                     <td>학원현황</td>
                     <td><select class="condition" name="condition1" id="condition1">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     </select></td>
                     <td></td>
                     <td><select class="condition" name="condition3" id="condition3">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     </select></td>
                  </tr>
                  <tr>
                  
                     <td>메뉴권한관리</td>
                     <td><select class="menu" name="menu1" id="menu1"  >
                           <option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     </select></td>
                     <td></td>
                     <td><select class="menu" name="menu3" id="menu3"  >
                     		<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     </select></td>
                  </tr>
                  <tr>
                    
                     <td>연간계획</td>
                     <td><select class="plan" name="plan1" id="plan1">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     </select></td>
                     <td><select class="plan" name="plan2" id="plan2">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     </select></td>
                     <td><select class="plan" name="plan3" id="plan3">
                     	<option value="1">원장</option>
                           <option value="2">행정</option>
                           <option value="3">강사</option>
                     </select></td>
                  </tr>
                  
                  <tr class="trname">
                     <td colspan="5" class="border" name="tst">　　고객</td>
                  </tr>
                  
                  <tr>
                     <td rowspan="4" class="border">학생정보</td>
                     <td>출결정보</td>
                     <td><input type="checkbox" name="pAtt" value="pAtt" id="pAtt">&nbsp;&nbsp;학부모</td>
                     <td><input type="checkbox" name="sAtt" value="sAtt" id="sAtt">&nbsp;&nbsp;학생</td>
                     <td></td>
                  </tr>
                  <tr>
                     <td>성적정보</td>
                     <td><input type="checkbox" name="pScore" value="pScore" id="pScore">&nbsp;&nbsp;학부모</td>
                     <td><input type="checkbox" name="sScore" value="sScore" id="sScore">&nbsp;&nbsp;학생</td>
                     <td></td>
                  </tr>
                  <tr>
                     <td>만족도조사</td>
                     <td><input type="checkbox" name="pSatisfy" value="pSatisfy" id="pSatisfy">&nbsp;&nbsp;학부모</td>
                     <td><input type="checkbox" name="sSatisfy" value="sSatisfy" id="sSatisfy">&nbsp;&nbsp;학생</td>
                     <td></td>
                  </tr>
                  <tr>
                     <td>고지서/영수증</td>
                     <td><input type="checkbox" name="pReceipt" value="pReceipt" id="pReceipt">&nbsp;&nbsp;학부모</td>
                     <td><input type="checkbox" name="sReceipt" value="sReceipt" id="sReceipt">&nbsp;&nbsp;학생</td>
                     <td></td>
                  </tr>
               </table>
               <div class="btndiv">
               <button class="btns" type="button"  onclick="submitt()">적용</button>
               <button class="btns" type="button" onclick="defaultt()">기본값 설정</button>
               </div>
            </form>
               <br> <br>
         </div>
      </article>
   </section>
   <% } else{ 
		request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
		request.getRequestDispatcher("/viewAcademy/common/commonError.jsp").forward(request,response);
	}%>
   <script>
   
   
   
 
   	$(function(){
   		
   		$('#attend1').val(<%=list.get(0).getAttend1()%>);
   		$('#attend2').val(<%=list.get(1).getAttend1()%>);
   		$('#attend3').val(<%=list.get(2).getAttend1()%>);
   		$('#black1').val(<%=list.get(3).getAttend1()%>);
   		$('#black2').val(<%=list.get(4).getAttend1()%>);
   		$('#black3').val(<%=list.get(5).getAttend1()%>);
   		$('#class1').val(<%=list.get(6).getAttend1()%>);
   		$('#class2').val(<%=list.get(7).getAttend1()%>);
   		$('#class3').val(<%=list.get(8).getAttend1()%>);
   		$('#condition1').val(<%=list.get(9).getAttend1()%>);
   		$('#condition3').val(<%=list.get(10).getAttend1()%>);
   		$('#counseling1').val(<%=list.get(11).getAttend1()%>);
   		$('#counseling2').val(<%=list.get(12).getAttend1()%>);
   		$('#counseling3').val(<%=list.get(13).getAttend1()%>);
   		$('#enroll1').val(<%=list.get(14).getAttend1()%>);
   		$('#enroll2').val(<%=list.get(15).getAttend1()%>);
   		$('#enroll3').val(<%=list.get(16).getAttend1()%>);
   		
   		$('#info1').val(<%=list.get(17).getAttend1()%>);
   		$('#info2').val(<%=list.get(18).getAttend1()%>);
   		$('#info3').val(<%=list.get(19).getAttend1()%>);
   		$('#menu1').val(<%=list.get(19).getAttend1()%>);
   		$('#menu3').val(<%=list.get(19).getAttend1()%>);
   		
   		$('#modifyInfo1').val(<%=list.get(22).getAttend1()%>);
   		$('#modifyInfo3').val(<%=list.get(23).getAttend1()%>);
   		$('#pAtt').val(<%=list.get(24).getAttend1()%>);
   		$('#plan1').val(<%=list.get(25).getAttend1()%>);
   		$('#plan2').val(<%=list.get(26).getAttend1()%>);
   		$('#plan3').val(<%=list.get(27).getAttend1()%>);
   		$('#pReceipt').val(<%=list.get(28).getAttend1()%>);
   		$('#pSatisfy').val(<%=list.get(29).getAttend1()%>);
   		$('#pScore').val(<%=list.get(30).getAttend1()%>);
   		$('#purchase1').val(<%=list.get(31).getAttend1()%>);
   		$('#purchase2').val(<%=list.get(32).getAttend1()%>);
   		$('#purchase3').val(<%=list.get(33).getAttend1()%>);
   		$('#satisfy1').val(<%=list.get(34).getAttend1()%>);
   		$('#satisfy2').val(<%=list.get(35).getAttend1()%>);
   		$('#satisfy3').val(<%=list.get(36).getAttend1()%>);
   		$('#sAtt').val(<%=list.get(37).getAttend1()%>);
   		$('#sReceipt').val(<%=list.get(38).getAttend1()%>);
   		$('#sSatisfy').val(<%=list.get(39).getAttend1()%>);
   		$('#sScore').val(<%=list.get(40).getAttend1()%>);
   		$('#staff1').val(<%=list.get(41).getAttend1()%>);
   		$('#staff2').val(<%=list.get(42).getAttend1()%>);
   		$('#staff3').val(<%=list.get(43).getAttend1()%>);
   		
   	    // 학생 체크
   		if(<%=list.get(37).getAttend1()<=5%>){
   		 $("input:checkbox[id='sAtt']").prop("checked", true);
   			}
   		if(<%=list.get(40).getAttend1()<=5%>){
      		 $("input:checkbox[id='sScore']").prop("checked", true);
      		}
   		if(<%=list.get(39).getAttend1()<=5%>){
      		 $("input:checkbox[id='sSatisfy']").prop("checked", true);
      		}
   		if(<%=list.get(38).getAttend1()<=5%>){
      		 $("input:checkbox[id='sReceipt']").prop("checked", true);
      		}
   		
   		// 학부모 체크
   		if(<%=list.get(24).getAttend1()<=5%>){
      		 $("input:checkbox[id='pAtt']").prop("checked", true);
      		}
   		if(<%=list.get(30).getAttend1()<=5%>){
     		 $("input:checkbox[id='pScore']").prop("checked", true);
     		}
   		if(<%=list.get(29).getAttend1()<=5%>){
     		 $("input:checkbox[id='pSatisfy']").prop("checked", true);
     		}
   		if(<%=list.get(28).getAttend1()<=5%>){
     		 $("input:checkbox[id='pReceipt']").prop("checked", true);
     		}
   		
   	});
 	
   </script>
   <script>
   function submitt(){
		swal({
			  text: "제출 하시겠습니까?",
			  buttons: true,
			})
			.then((value) =>{
			  if (value) {
			    swal("제출되었습니다!", {});
			    //ok 눌렀을떄 폼 전송
		
			    
			    $("#menuLevel").submit();
			    console.log("완료");
			  } 
			});
	}
  function defaultt(){
		swal({
			  text: "제출 하시겠습니까?",
			  buttons: true,
			})
			.then((value) =>{
			  if (value) {
			    swal("제출되었습니다!", {});
			    //ok 눌렀을떄 폼 전송
				
			    location.href="<%=request.getContextPath()%>/aupdateDefault.level";
			   
			    console.log("완료");
			  } 
			});
	}

   </script>
</body>
</html>