<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	.file > button{
		margin-left:10%;
	}
</style>
<%@ include file="/viewAcademy/common/menubar.jsp"%>
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
         <legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">　공지사항 작성　</h1></legend>
      </fieldset>
    </div>
	<div style="width:90%; margin:auto auto;" class="outer">
		<div class="tableArea">
			<form>
				<table class="table">
					<tr>
						<td>제목</td>
						<td colspan="3"><input type="text" size="50" name="title"></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>
							<input type="text" name="writer" readonly>
							<input type="hidden" name="uno"> <!-- 실제 서버로는 uno값이 전달됨(uno값을 이용하여 닉네임을 찾기 위해서), type="hidden"을 사용하면 사용자에게는 보여지지 않음 -->
						</td>
						<td>작성일</td>
						<td><input type="date" name="date"></td>
					</tr>
					<tr>
						<td>내용</td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea name="content" cols="60" rows="15" style="resize:none;"></textarea>
						</td>
					</tr>
				</table>
				<div class="file">
					<button type="file">파일 선택</button>
				</div>
				<div class="cancleSubmit" align="center">
					<button type="reset" id="cancle" onclick="location.href='<%=request.getContextPath()%>/viewAcademy/commonMenu/noticeList.jsp'">취소하기</button>
					<button type="button" id="submit" onclick="insertNotice();" >등록하기</button>
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
						swal({
							title:"등록되었습니다",
							icon:"success"
						}).then(function(){
							location.href='<%= request.getContextPath()%>/viewAcademy/commonMenu/noticeList.jsp';
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