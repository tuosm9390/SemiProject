<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* 게시판 리스트 목록 */
.sub_news,.sub_news th,.sub_news td{border:0}
.sub_news a{color:#383838;text-decoration:none}
.sub_news{width:100%;border-bottom:1px solid #999;color:#666;font-size:12px;table-layout:fixed}
.sub_news caption{display:none}
.sub_news th{padding:5px 0 6px;border-top:solid 1px #999;border-bottom:solid 1px #b2b2b2;background-color:#f1f1f4;color:#333;font-weight:bold;line-height:20px;vertical-align:top}
.sub_news td{padding:8px 0 9px;border-bottom:solid 1px #d2d2d2;text-align:center;line-height:18px;}
.sub_news .date,.sub_news .hit{padding:0;font-family:Tahoma;font-size:11px;line-height:normal}
.sub_news .title{text-align:left; padding-left:15px; font-size:13px;}
.sub_news .title .pic,.sub_news .title .new{margin:0 0 2px;vertical-align:middle}
.sub_news .title a.comment{padding:0;background:none;color:#f00;font-size:12px;font-weight:bold}
.sub_news tr.reply .title a{padding-left:16px;background:url(첨부파일/ic_reply.png) 0 1px no-repeat}
/* //게시판 리스트 목록 */

section{
	padding-left: 100px;
	padding-right: 100px;
	
}
</style>
</head>

<body>
	<!-- 리스트 게시판 시작-->
<section>
<table class="sub_news" border="1" cellspacing="0" summary="게시판의 글제목 리스트">
<caption>게시판 리스트</caption>
<colgroup>
<col width="30">
<col>
<col width="110">
<col width="100">
<col width="80">
</colgroup>
<thead>
<tr>

<th scope="col">No.</th>
<th scope="col">제목</th>
<th scope="col">글쓴이</th>
<th scope="col">날짜</th>
<th scope="col">조회수</th>
</tr>
</thead>
<tbody>
<tr>
<td>1</td>
<td class="title">
<a href="#">게시판 제목이 들어갑니다</a>
<img width="13" height="12" class="pic" alt="첨부이미지" src="첨부파일 ic_pic.gif"> <a class="comment" href="#">[5]</a> <img width="10" height="9" class="new" alt="새글" src="첨부파일/ic_new.gif">
</td>
<td class="name">글쓴이이름</td>
<td class="date">2008/02/14</td>
<td class="hit">1234</td>
</tr>
<tr>
<td>2</td>
<td class="title">
<a href="#">게시판 제목이 들어갑니다</a>
<img width="13" height="12" class="pic" alt="첨부이미지" src="첨부파일 ic_pic.gif"> <a class="comment" href="#">[5]</a> <img width="10" height="9" class="new" alt="새글" src="첨부파일/ic_new.gif">
</td>
<td class="name">글쓴이이름</td>
<td class="date">2008/02/14</td>
<td class="hit">1234</td>
</tr>
<tr>
<td>3</td>
<td class="title">
<a href="#">게시판 제목이 들어갑니다</a>
<img width="13" height="12" class="pic" alt="첨부이미지" src="첨부파일 ic_pic.gif"> <a class="comment" href="#">[5]</a> <img width="10" height="9" class="new" alt="새글" src="첨부파일/ic_new.gif">
</td>
<td class="name">글쓴이이름</td>
<td class="date">2008/02/14</td>
<td class="hit">1234</td>
</tr>
<tr>
<td>4</td>
<td class="title">
<a href="#">게시판 제목이 들어갑니다</a>
<img width="13" height="12" class="pic" alt="첨부이미지" src="첨부파일 ic_pic.gif"> <a class="comment" href="#">[5]</a> <img width="10" height="9" class="new" alt="새글" src="첨부파일/ic_new.gif">
</td>
<td class="name">글쓴이이름</td>
<td class="date">2008/02/14</td>
<td class="hit">1234</td>
</tr>
<tr class="reply">
<td>5</td>
<td class="title" style="padding-left:30px;">
<a href="#">블로그 개편 답글</a>
</td>
<td class="name">박상준</td>
<td class="date">2019/09/09</td>
<td class="hit">1234</td>
</tr>

<!-- tr이 제목 1줄입니다 보일 list 갯수만큼 li반복합니다.-->
</tbody>
</table>
<footer>
<div class="text-center">
	<ul class="pagination">
		<li><a href="#">1</a></li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">5</a></li>
	</ul>
</div>
</footer>
<!-- 리스트 게시판 끝-->
</section>
</body>
</html>