<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="hagong.academy.commonMenu.notice.model.vo.Notice"%>
<%
	Notice n = (Notice) request.getAttribute("n");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
<style>
	.completeDelete > button{
		display:inline;
	}
	#complete{
		margin-right:10px;
		margin-bottom:30px;
	}
	fieldset {
      width:25%
   }
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<header>
      <%@ include file="/viewAcademy/common/menubar.jsp"%>
   </header>
   <section>
   <div align="center">
      <fieldset style=" margin-bottom:-15px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;">
         <legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">　공지사항 수정　</h1></legend>
      </fieldset>
    </div>
	<div style="width:90%; margin:auto auto;" class="outer">
		<div class="tableArea" align="center">
			<form id="updateForm" method="post">
				<table>
					<tr>
						<td>제목</td>
						<td colspan="3">
						<input type="text" size="50" name="title" style="border-radius:5px; border:1px solid lightgray;" value="<%=n.getnTitle()%>" ></td>
						<input type="hidden" name="nno" value="<%=n.getNno() %>">
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="text" value="<%=n.getnAuthor()%>" name="writer" style="border-radius:5px; border:none;" readonly></td>
						<td>작성일</td>
						<td><input type="date" name="date" value="<%=n.getnDate()%>" style="border-radius:5px; border:1px solid lightgray;" readonly></td>
					</tr>
					<tr>
						<td>내용</td>
					</tr>
					<tr>
						<td colspan="4"><textarea name="content" cols="60" rows="15" style="resize: none; border-radius:5px; border:1px solid lightgray;"><%=n.getnContent()%></textarea></td>
					</tr>
				</table>
				<br>
				<div class="completeDelete" align="center"> 
					<button  id="delete" style="margin-right:5px;">삭제</button>
					<button  id="complete" <%-- "location.href='<%=request.getContextPath()%>/aupdate.no?num=<%=n.getNno()%> --%>>수정</button>
				</div>
			</form>
				<script>
					<%-- function complete() {
						$("#updateForm").attr("action", "<%=request.getContextPath()%>/aupdate.no");
					} --%>
					
					$("#complete").on("click",function(){
						$("#updateForm").attr("action", "<%=request.getContextPath()%>/aupdate.no");
					});
					
					<%-- function deleteNotice() {
						$("#updateForm").attr("action", "<%=request.getContextPath()%>/adelete.no");
					} --%>
					
					
					$("#delete").on("click",function(){
						$("#updateForm").attr("action", "<%=request.getContextPath()%>/adelete.no");
					})
				</script>
		</div> <!-- tableArea end -->
		</div> <!-- outer end -->
		<script>
			function updateNotice(){
				swal({
					title:"삭제하기",
					text:"삭제하시겠습니까?",
					
					buttons:["취소", "삭제"]
					
				}).then(function(isConfirm){
					if(isConfirm){
						swal({
							title:"삭제완료",
							icon:"success"
						}).then(function(){
							location.href='<%=request.getContextPath()%>/alist.no?currentPage=1';
						})
					}
					
				});
			}
		</script>
	</section>
	<footer>
	</footer>
</body>
</html>
