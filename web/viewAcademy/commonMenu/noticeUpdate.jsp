<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/viewAcademy/common/menubar.jsp"%>
<style>
	.completeDelete > button{
		display:inline;
	}
	#complete{
		margin-right:10px;
		margin-bottom:30px;
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
      <fieldset style="margin-top:-25px; margin-bottom:-15px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;">
         <legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">　공지사항 수정　</h1></legend>
      </fieldset>
    </div>
	<div style="width:90%; margin:auto auto;" class="outer">
			<div class="tableArea">
			<form id="updateForm" method="post">
				<table class="table">
					<tr>
						<td>제목</td>
						<td colspan="3">
						<input type="text" size="50" name="title" <%-- value="<%=n.getnTitle()%>" --%>></td>
						<input type="hidden" name="nno" <%-- value="<%=n.getNno() %>" --%>>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="text" <%-- value="<%=n.getnWriter()%>" --%> name="writer" readonly></td>
						<td>작성일</td>
						<td><input type="date" name="date" <%-- value="<%=n.getnDate()%>" --%> readonly></td>
					</tr>
					<tr>
						<td>내용</td>
					</tr>
					<tr>
						<td colspan="4"><textarea name="content" cols="60" rows="15" style="resize: none;">수정 내용<%-- <%=n.getnContent()%> --%></textarea></td>
					</tr>
				</table>
				<br>
				<div class="completeDelete" align="center"> 
					<button type="button" id="complete" onclick="location.href='<%=request.getContextPath()%>/viewAcademy/commonMenu/noticeList.jsp'">작성완료</button>
					<button type="button" onclick="updateNotice();">삭제하기</button>
				</div>
				<%-- <script>
					function complete() {
						$("#updateForm").attr("action", "<%=request.getContextPath()%>/update.no");
					}
					
					function deleteNotice() {
						$("#updateForm").attr("action", "<%=request.getContextPath()%>/deleteNotice.no");
					}
				</script> --%>
			</form>
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
							title:"삭제되었습니다",
							icon:"success"
						}).then(function(){
							location.href='<%=request.getContextPath()%>/viewAcademy/commonMenu/noticeList.jsp';
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