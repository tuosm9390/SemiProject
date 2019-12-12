<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
<style>

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
</style>
</head>
<body>
   <header>
      <%@ include file="/viewAcademy/common/menubar.jsp"%>

   </header>
   <section>
      <article> 
         <!--  -->
         <div align="center">
            <fieldset
               style="margin-bottom: -15px; border-left: none; border-right: none; border-bottom: none; border-top-color: black; wnameth: 20%">
               <legend align="center">
                  <h1 align="center" style="font-family: 'Do Hyeon';">　권한부여 관리　</h1>
               </legend>
            </fieldset>
         </div>
         <!--  -->
         <div align="center">
            <form name="menuLevel" action="<%=request.getContextPath()%>/aupdate.level" method="post">
               <table class="table">
                  <tr align="right">
                     <th>&nbsp;</th>
                     <th>&nbsp;</th>
                     <th>전체조회</th>
                     <th>일부등록</th>
                     <th>수정/삭제/</th>
                  </tr>
                  <!-- 공통 -->
                  <tr class="trname">
                     <td class="border">공통</td>
                     <td>개인정보수정</td>
                     <td><select class="modifyInfo"  name="modifyInfo1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                      	   <option value="parent">학부모</option>
                           <option value="student">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" name="modifyInfo2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                        
                     </select></td>
                     <td><select class="modifyInfo" name="modifyInfo3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                          
                     </select></td>
                  </tr>
                  <!-- 관리자 -->
                  <tr class="trname">
               
                     <td class="tdclass" colspan="5">　　관계자</td>

                  </tr>
                  <!-- 학생개인정보 -->
                  <tr>
                     <td rowspan="4" class="border even" style="background:rgba(245,244,242); border-bottom:none !important;">학생관리</td>
                     
                     <td>개인정보</td>
                     <td><select class="info" name="info1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     
                     </select></td>
                     <td><select class="info" name="info2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                       
                     </select></td>
                     <td><select class="info" name="info3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     
                     </select></td>
                  </tr>
                  <!--  -->
                  <tr>
                    
                     <td>수납</td>
                     <td><select class="purchase" name="purchase1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                          
                     </select></td>
                     <td><select class="purchase" name="purchase2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                     <td><select class="purchase" name="purchase3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                  </tr>
                  <!--  -->
                  <tr>
                   
                     <td>상담</td>
                     <td><select class="counseling" name="counsel1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                     <td><select class="counseling" name="counsel2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                     <td><select class="counseling" name="counsel3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                  </tr>
                  <!--  -->
                  <tr>
                     
                     <td>블랙리스트</td>
                     <td><select class="black" name="black1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                     <td><select class="black" name="black2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                     <td><select class="black" name="black3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                  </tr>
                  <!--  -->

                  <tr name="qqtr">
                     <td class="border odd">직원관리</td>
                     <td>직원관리</td>
                     <td><select class="staff" name="staff1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                     <td><select class="staff" name="staff2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                     <td><select class="staff" name="staff3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                  </tr>
                  <!--  -->

                  <!--  -->
                  <tr>
                     <td rowspan="4" class="border even" style="background:rgba(245,244,242)">수업관리</td>
                     <td>수강생관리</td>
                     <td><select class="enroll" name="enroll1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                     <td><select class="enroll" name="enroll2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                     <td><select class="enroll" name="enroll3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                  </tr>
                  <!--  -->
                  <tr>
                     
                     <td>출결관리</td>
                     <td><select class="attend" name="attend1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                     <td><select class="attend" name="attend2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                     <td><select class="attend" name="attend3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                  </tr>
                  <!--  -->
                  <tr>
                   
                     <td>강좌목록관리</td>
                     <td><select class="class" name="class1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                     <td><select class="class" name="class2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                     <td><select class="class" name="class3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                  </tr>
                  <!--  -->
                  <tr>
                    
                     <td>만족도</td>
                     <td><select class="satisfy" name="satisfy1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                     <td><select class="satisfy" name="satisfy2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                     <td><select class="satisfy" name="satisfy3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                  </tr>

                  <tr>
                     <td rowspan="3" class="border odd" style="background:white">관리자</td>
                     <td>학원현황</td>
                     <td><select class="condition" name="condition1" name="condition1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                     <td><select class="condition" name="condition2" name="condition2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                     <td><select class="condition" name="condition3"name="condition3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                  </tr>
                  <tr>
                  
                     <td>메뉴권한관리</td>
                     <td><select class="menu" name="menu1">
                           <option value="master">관리자</option>
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                     <td><select class="menu" name="menu2">
                    		<option value="master">관리자</option>
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                     <td><select class="menu" name="menu3">
                     		<option value="master">관리자</option>
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                  </tr>
                  <tr>
                    
                     <td>연간계획</td>
                     <td><select class="plan" name="plan1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                     <td><select class="plan" name="plan2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                     <td><select class="plan" name="plan3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                     </select></td>
                  </tr>
                  
                  <tr class="trname">
                     <td colspan="5" class="border" name="tst">　　고객</td>
                  </tr>
                  
                  <tr>
                     <td rowspan="4" class="border">학생정보</td>
                     <td>출결정보</td>
                     <td><input type="checkbox" name="pAtt" value="pAtt" >&nbsp;&nbsp;학부모</td>
                     <td><input type="checkbox" name="sAtt" value="sAtt" >&nbsp;&nbsp;학생</td>
                     <td></td>
                  </tr>
                  <tr>
                     <td>성적정보</td>
                     <td><input type="checkbox" name="pScore" value="pScore">&nbsp;&nbsp;학부모</td>
                     <td><input type="checkbox" name="sScore" value="sScore">&nbsp;&nbsp;학생</td>
                     <td></td>
                  </tr>
                  <tr>
                     <td>만족도조사</td>
                     <td><input type="checkbox" name="pSatisfy" value="pSatisfy">&nbsp;&nbsp;학부모</td>
                     <td><input type="checkbox" name="sSatisfy" value="sSatisfy">&nbsp;&nbsp;학생</td>
                     <td></td>
                  </tr>
                  <tr>
                     <td>고지서/영수증</td>
                     <td><input type="checkbox" name="pReceipt" value="pReceipt">&nbsp;&nbsp;학부모</td>
                     <td><input type="checkbox" name="sReceipt" value="sReceipt" >&nbsp;&nbsp;학생</td>
                     <td></td>
                  </tr>
               </table>
               <div class="btndiv">
               <button type="submit" class="btns">적용</button>
               <button type="reset" class="btns">기본값 설정</button>
               </div>
               <br> <br>
            </form>
         </div>
      </article>
   </section>
</body>
</html>