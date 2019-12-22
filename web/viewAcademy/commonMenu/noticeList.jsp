<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, hagong.academy.commonMenu.notice.model.vo.*"%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	int limit = pi.getLimit();
	int startRow = listCount - ((currentPage - 1) * limit) + 1;
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
   .pagingArea button{
   		display:inline;
   		border:none;
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
            <button type="submit">검색</button>
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
            	<td><%= startRow-- %></td>
            	<td><%= list.get(i).getnTitle() %></td>
            	<td><%= list.get(i).getName() %></td>
            	<td><%= list.get(i).getnDate() %></td>
            	<td><%= list.get(i).getnCount() %></td>
            </tr>
            
            <% } %> 
         </table>
      </div>
      <div class="pagingArea" align="center">
      	<button onclick="location.href='<%=request.getContextPath() %>/alist.no?currentPage=1'">◀◀</button>
      	
      	<% if(currentPage <= 1) { %>
      	<button disabled>◀</button>
      	<% } else { %>
      	<button onclick="location.href='<%=request.getContextPath() %>/alist.no?currentPage=<%=currentPage - 1 %>'">◀</button>
      	<% } %>
      	
      	<% for(int p = startPage; p <= endPage; p++){
      		if(p == currentPage){
      	%>
      		<button disabled><%= p %></button>
      	<% }else{ %>
      		<button onclick="location.href='<%=request.getContextPath() %>/alist.no?currentPage=<%=p %>'"><%= p %></button>
      	<% }
      	} %>
      	
      	<% if(currentPage >= maxPage){ %>
      	<button disabled>▶</button>
      	<% } else { %>
      	<button onclick="location.href='<%=request.getContextPath() %>/alist.no?currentPage=<%=currentPage + 1 %>'">▶</button>
      	<% } %>
      	
      	<button onclick="location.href='<%=request.getContextPath() %>/alist.no?currentPage=<%=maxPage %>'">▶▶</button>
      	
      </div>
      
      <div id="write">
         <button type="button" onclick="location.href='<%=request.getContextPath()%>/viewAcademy/commonMenu/insertNotice.jsp'" style="margin-bottom:20px;">작성</button>
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





















