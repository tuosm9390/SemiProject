<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
<style>

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
   width: 90% !important;
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
	border-right: 1px solid black;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

.
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
               style="margin-bottom: -15px; border-left: none; border-right: none; border-bottom: none; border-top-color: black; width: 250px;">
               <legend align="center">
                  <h1 align="center" style="font-family: 'Do Hyeon';">　권한부여관리　</h1>
               </legend>
            </fieldset>
         </div>
         <!--  -->
         <div align="center">
            <form>
               <table class="table">
                  <tr align="right">
                     <th>&nbsp;</th>
                     <th>&nbsp;</th>
                     <th>전체조회</th>
                     <th>일부등록</th>
                     <th>수정/삭제/</th>
                  </tr>
                  <!-- 공통 -->
                  <tr class="trid">
                     <td class="border">공통</td>
                     <td>개인정보수정</td>
                     <td><select class="modifyInfo" id="modifyInfo1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient" selected>학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                  </tr>
                  <!-- 관리자 -->
                  <tr class="trid">
               
                     <td class="tdclass" colspan="5">　　관계자</td>

                  </tr>
                  <!-- 학생개인정보 -->
                  <tr>
                     <td rowspan="4" class="border">학생관리</td>
                     <td>개인정보</td>
                     <td><select class="modifyInfo" id="modifyInfo1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                  </tr>
                  <!--  -->
                  <tr>
                    
                     <td>수납</td>
                     <td><select class="modifyInfo" id="modifyInfo1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                  </tr>
                  <!--  -->
                  <tr>
                   
                     <td>상담</td>
                     <td><select class="modifyInfo" id="modifyInfo1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                  </tr>
                  <!--  -->
                  <tr>
                     
                     <td>블랙리스트</td>
                     <td><select class="modifyInfo" id="modifyInfo1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                  </tr>
                  <!--  -->

                  <tr class="trid" id="qqtr">
                     <td class="border" style="background-color:250,250,250;">직원관리</td>
                     <td>직원관리</td>
                     <td><select class="modifyInfo" id="modifyInfo1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                  </tr>
                  <!--  -->

                  <!--  -->
                  <tr>
                     <td rowspan="4" class="border" style="background-color:250,250,250;">수업관리</td>
                     <td>수강생관리</td>
                     <td><select class="modifyInfo" id="modifyInfo1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                  </tr>
                  <!--  -->
                  <tr>
                     
                     <td>출결관리</td>
                     <td><select class="modifyInfo" id="modifyInfo1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                  </tr>
                  <!--  -->
                  <tr>
                   
                     <td>강좌목록관리</td>
                     <td><select class="modifyInfo" id="modifyInfo1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                  </tr>
                  <!--  -->
                  <tr>
                    
                     <td>만족도</td>
                     <td><select class="modifyInfo" id="modifyInfo1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                  </tr>

                  <tr>
                     <td rowspan="3" class="border">관리자</td>
                     <td>학원현황</td>
                     <td><select class="modifyInfo" id="modifyInfo1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                  </tr>
                  <tr>
                  
                     <td>메뉴권한관리</td>
                     <td><select class="modifyInfo" id="modifyInfo1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                  </tr>
                  <tr>
                    
                     <td>연간계획</td>
                     <td><select class="modifyInfo" id="modifyInfo1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                  </tr>
                  <tr class="trid">
                     
                     <td class="tdclass" colspan="5" class="border">　　고객</td>

                  </tr>
                  <tr>
                     <td rowspan="4" class="border">학생정보</td>
                     <td>출결정보</td>
                     <td><input type="checkbox" value="학부모" id="cul">&nbsp;&nbsp;학부모</td>
                     <td><input type="checkbox" value="학생" id="cul">&nbsp;&nbsp;학생</td>
                     <td></td>
                  </tr>
                  <tr>
                   
                     <td>성적정보</td>
                     <td><input type="checkbox" value="학부모" id="cul">&nbsp;&nbsp;학부모</td>
                     <td><input type="checkbox" value="학생" id="cul">&nbsp;&nbsp;학생</td>
                     <td></td>
                  </tr>
                  <tr>
                 
                     <td>만족도조사</td>
                     <td><input type="checkbox" value="학부모" id="cul">&nbsp;&nbsp;학부모</td>
                     <td><input type="checkbox" value="학생" id="cul">&nbsp;&nbsp;학생</td>
                     <td></td>
                  </tr>
                  <tr>
                 
                     <td>고지서/영수증</td>
                     <td><input type="checkbox" value="학부모" id="cul">&nbsp;&nbsp;학부모</td>
                     <td><input type="checkbox" value="학생" id="cul">&nbsp;&nbsp;학생</td>
                     <td></td>
                  </tr>


               </table>
               <div class="btndiv">
               <button type="submit" class="btns">적용하기</button>
               <button type="reset" class="btns">기본값으로 변경</button>
               </div>
               <br> <br>
            </form>
         </div>
      </article>
   </section>
</body>
</html>