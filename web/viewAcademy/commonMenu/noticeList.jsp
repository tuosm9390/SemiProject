<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      <fieldset style="margin-top:-25px; margin-bottom:-15px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;">
         <legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">　공지사항 게시판　</h1></legend>
      </fieldset>
      </div>
      <div class="searchArea">
            <select id="searchCondition" name="searchCondition" style="border-radius:5px;">
               <option value="writer">작성자</option>
               <option value="title">제목</option>
               <option value="content">내용</option>
            </select> &nbsp;&nbsp;
            <input type="search" style="border:1px solid lightgray; border-radius:5px;"> &nbsp;&nbsp;
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
            <tr>
               <td>1</td>
               <td>공지1</td>
               <td>재영</td>
               <td>2019-12-03</td>
               <td>23</td>
            </tr>
            <tr>
               <td>1</td>
               <td>공지1</td>
               <td>재영</td>
               <td>2019-12-03</td>
               <td>23</td>
            </tr>
            <tr>
               <td>1</td>
               <td>공지1</td>
               <td>재영</td>
               <td>2019-12-03</td>
               <td>23</td>
            </tr>
            <tr>
               <td>1</td>
               <td>공지1</td>
               <td>재영</td>
               <td>2019-12-03</td>
               <td>23</td>
            </tr>
         </table>
      </div>
      <div id="write">
         <button type="button" onclick="location.href='noticeInsertForm.jsp'" style="font-size:18px;">글쓰기</button>
      </div>
      <script>
      $(function(){
         $("#noticeList td").click(function(){
            location.href='<%=request.getContextPath()%>/viewAcademy/commonMenu/noticeDetail.jsp';
         });
      });
   </script>
   </section>
   <footer>
   </footer>
   
</body>
</html>