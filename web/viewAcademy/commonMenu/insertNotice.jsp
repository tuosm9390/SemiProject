<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
<style>
	/* .outer {
		width:900px;
		height:500px;
		color:white;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	} */
	table {
		border:1px solid white;
		
	}
	.tableArea {
		width:700px;
		height:350px;
		margin:0 auto;
	}
	.cancleSubmit > button{
		display:inline;
		
	}
	#cancle{
		margin-right:10px;
		margin-bottom:50px;
	}
	fieldset {
      width:25%
   }
   /* #important{
   	   float:right;
   } */
</style>
</head>
<body>
	<header>
      <%@ include file="/viewAcademy/common/menubar.jsp"%>
   </header>
   <section>
   <div align="center">
      <fieldset style=" margin-bottom:-15px; border-left:none; border-right:none; border-bottom:none; border-top-color:black;">
         <legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">　공지사항 작성　</h1></legend>
      </fieldset>
    </div>
	<div style="width:90%; margin:auto auto;" class="outer">
		<div class="tableArea" align="center">
			<form action="<%=request.getContextPath()%>/ainsert.no" id="insertForm" method="post">
				<table>
					<tr>
						<td>제목</td>
						<td colspan="3" style="padding-bottom:1%;"><input type="text" size="50" name="title" style="border-radius:5px; border:1px solid lightgray;"></td>
					</tr>
					<tr>
						<td>작성자</td>
						<input type="hidden"  name="writer" value="<%= loginUser.getUserNo() %>">
						<td>
							<input style="border-radius:5px; border:1px solid lightgray;" type="text" value="<%= loginUser.getName()%> " readonly>
						</td>
						<td>작성일</td>
						<td><input type="date" name="date" style="border-radius:5px; border:1px solid lightgray;"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="3" style="text-align:right">
							<input type="checkbox"> 중요공지
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea name="content" cols="60" rows="15" style="resize:none; border-radius:5px; border:1px solid lightgray;" ></textarea>
						</td>
					</tr>
					<tr>
						<td style="padding-top:10px" colspan="4">
							<input type="file" style="border-radius:5px; border:1px solid lightgray;">
						</td>
					</tr>
					
				</table>
				<br><br>
				<div class="cancleSubmit" align="center">
					<button type="reset" id="cancle" onclick="location.href='<%=request.getContextPath()%>/alist.no?startPage='" style="margin-right:5px;">취소</button>
					<button id="submit" onclick="insertNotice();" >등록</button>
				</div>
			</form>
		</div> <!-- tableArea end -->
		
		
		<script>
			function insertNotice(){
				swal({
					title:"등록하기",
					text:"등록하시겠습니까?",
					
					buttons:["취소", "등록"]
					
				}).then(function(isConfirm){
					if(isConfirm){
						$("#insertForm").submit();
						swal({
							title:"등록완료",
							icon:"success"
						});
					}
					
				});
			}
		</script>
	</div>
	</section>
	<footer>
	</footer>
</body>
</html>