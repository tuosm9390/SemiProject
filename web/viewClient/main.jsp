<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.util.*, hagong.academy.mngClass.mngClassList.model.vo.Class"%>
<%
	ArrayList<Class> list = (ArrayList<Class>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객용 메인</title>
<style>
body {
   background: url("/hagong/images/mainImage.jpg") no-repeat top;
   background-size: 86%;
   font-family: "Jua";
}

.classArea {
   text-align: center;
   margin-bottom: 30px;
}

#container {
	border: double gray;
	border-radius: 5px;
	width: 40%;
	margin-right: auto;
	margin-left: auto;
}
</style>
</head>
<body>
   <header>
   <%@ include file="/viewClient/common/menubar.jsp"%>
   </header>
   <section>
   <!-- <div class="upperArea">
      <div class="satisfyArea">
         <h3>만족도 조사</h3>
         <ul>
            <li>2019-11-04 만족도 조사</li>
            <li>2019-09-01 하반기 만족도 조사</li>
            <li>2019-03-01 하반기 만족도 조사</li>
            <li>2018-11-01 만족도 조사</li>
            <li>2018-06-01 만족도 조사</li>
         </ul>
      </div>
      <div class="receiptArea">
         <h3>고지서/영수증</h3>
         <ul>
            <li>11월 수강료 납부내역</li>
            <li>10월 수강료 납부내역</li>
            <li>09월 수강료 납부내역</li>
            <li>08월 수강료 납부내역</li>
            <li>07월 수강료 납부내역</li>
         </ul>
      </div>
   </div> -->
   <!-- upperArea end -->
   <div class="classArea">
      <h2><개설 예정 강좌></h2>
      <div id="container" align="center">
         <ul align="left" style="width: 80%;">
         	<% for(int i=0; i<list.size(); i++) { %>
            <li style="margin:10px"><%=list.get(i).getSubId()%> | <span style="font-weight:bold; font-size:18px;"><%= list.get(i).getClsName() %></span> | <%=list.get(i).getName() %> 강사<br>
            ( <%=list.get(i).getClsStart() %> 개설 예정 )</li>
            <%-- <li><%= list.get(i).getCls %></li>
            <li>고1 영어 문법반</li>
            <li>중3 과학 기말고사 대비반</li> --%>
            <% } %>
         </ul>
      </div>
   </div>
   <!-- bottomArea end -->
   </section>
   <footer></footer>
</body>
</html>