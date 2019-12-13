<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, hagong.academy.commonMenu.notice.model.vo.*"%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
<link href="https://fonts.googleapis.com/css?family=Jua:400" rel="stylesheet">
<style>
   #write{
      
      margin-left:90%;
   }
   .searchArea{
      display:inline-flex;
      float: right; 
      margin-right: 5%;
      margin-bottom: 10px;
   }
   fieldset {
      width:25%
   }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
   <header>
      <%@ include file="/viewAcademy/common/menubar.jsp"%>
   </header>
   <section>
      <div align="center">
      <fieldset style="margin-bottom:-15px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;">
         <legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">　공지사항 게시판　</h1></legend>
      </fieldset>
      </div>
      <div class="searchArea">
            <select id="searchCondition" name="searchCondition">
               <option value="writer">작성자</option>
               <option value="title">제목</option>
               <option value="content">내용</option>
            </select>&nbsp;&nbsp;
            <input type="search" style="border-radius:5px; border:1px solid lightgray;">&nbsp;&nbsp;
            <button type="submit">검색하기</button>
      </div> <!-- searchArea end -->
      
      <div style="width:90%; margin:auto auto;">
         <table class="table" id="noticeList">
            <tr>
               <th width="10%">번호</th>
               <th width="50%">제목</th>
               <th width="10%">글쓴이</th>
               <th width="20%">날짜</th>
               <th width="10%">조회수</th>
            </tr>
            <% for(int i=0; i < list.size(); i++){ %>
            <tr>
            	<input type="hidden" name="nno" value="<%=list.get(i).getNno() %>">
            	<td><%= i+1 %></td>
            	<td><%= list.get(i).getnTitle() %></td>
            	<td><%= list.get(i).getnAuthor() %></td>
            	<td><%= list.get(i).getnDate() %></td>
            	<td><%= list.get(i).getnCount() %></td>
            </tr>
            
            <% } %> 
         </table>
      </div>
      <div id="write">
         <button type="button" onclick="location.href='<%=request.getContextPath()%>/viewAcademy/commonMenu/insertNotice.jsp'">글쓰기</button>
      </div>
      <script>
      $(function(){
         $("#noticeList td").click(function(){
        	var num = $(this).parent().children().eq(0).val();
        	 
        	 console.log(num);
        	 
           location.href='<%=request.getContextPath()%>/aselectone.no?num=' + num;
         });
      });
   </script>
   </section>
   <footer>
   </footer>
   
</body>
</html>
