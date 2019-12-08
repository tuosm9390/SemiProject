<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
<style>
.detailArea {display: table-caption;}
.inputCons {resize:none;}
.btnArea {text-align:center;}
.btnArea button{background:white;display:inline-block;margin:0 2px;width: 80px;
    height: 25px;}
.btnArea .updateCons {display:none;}
.updateBtn {display:inline-block;margin:0 2px;width: 80px;
    height: 25px;line-height: 22px;text-decoration: none;border: 1px solid green;border-radius: 5px;background: white;color: black;position: relative;padding: 1px 6px;}
.updateBtn:focus {outline: none;}
.updateBtn:hover {cursor: pointer;background: green;border: 1px solid green;color: white;}
.detailArea{display: block;width: 100%;}
.dArea .dCtn{padding-bottom: 20px;}
.dArea .dCtn .inputCons{padding: 4px;}
.dArea .dCtn.consTitle .inputCons{display: block;width: 100%;}
.dArea .dCtn .consCate{padding: 4px;width: 162px;}
.dArea .dTit{display: block;padding-bottom: 5px;font-weight: bold;font-size: 15px;}
.dArea textarea.inputCons{width: 100%;min-height: 100px;}
.btnArea{padding: 24px 0 13px;}
.bInfo .bDetail{display: inline-flex;}
.bInfo .bDetail .bDate{border:1px solid #333;padding:0 20px 0 20px;margin-right: 25px;border-color: rgb(169, 169, 169);height: fit-content;}
.bInfo .bDetail .bDate p{font-size:18px; margin: 10px 0;color:#333;}
.bInfo .bDetail .bContent{width: 700px;}
.bInfo {text-align:center;}
.bInfo .btitle{text-align:left; font-size:20px;font-weight: bold;}
.bInfo .bDetail .bContent {text-align:left;}
.bInfo .bTable{width:90%;margin:0 auto;}
.bInfo .bTable td{background:snow;}
.bInfo .blacklist_content{}
.btnArea{padding: 24px 0 13px;}
.blacklist_content {background:snow; padding:10px 10px 0 10px;}
</style>
</head>
<body>
	<header>
		<%@ include file="../../common/menubar.jsp" %>	
	</header>
	<section>
		<div class="bInfo">
			<div align="center">
		      <fieldset style="margin-top:-25px; margin-bottom:-15px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;width:25%;">
		         <legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">　블랙리스트 조회　</h1></legend>
		      </fieldset>
	    	</div>
		<div class="bTable">
			<table class="table">
				<tr>
					<th>학생명</th>
					<th>학교</th>
					<th>학년</th>
					<th>연락처</th>
					<th>학부모연락처</th>					
				</tr>
				<tr>
					<td>김지원</td>
					<td>KH중학교</td>
					<td>2학년</td>
					<td>010-5555-5555</td>
					<td>010-7777-7777</td>
				</tr>
			</table>
		</div> <!-- 블랙리스트 정보 end -->
		<div class="bDetail">
			<div class="bDate">
				<p>2019.09.11</p>
				<p>2019.09.13</p>
				<p>2019.09.14</p>
				<p>2019.09.15</p>
				<p>2019.09.16</p>
				<p>2019.09.17</p>
				<p>2019.09.18</p>
				<p>2019.09.19</p>
			</div> <!-- 블랙리스트 상담날짜 end -->
			<div class="bContent">
				<form class="blacklist_content" method="post">
					<div class="detailArea">
						<div class="dArea dArea1">
							<div class="dCtn consTitle">
								<label class="dTit">상담제목</label>
								<input type="text" class="inputCons" value="학원생활 관련 상담(1)" readonly>
							</div>
							<div class="dCtn tName">
								<label class="dTit">상담자 이름</label>
								<input type="text" class="inputCons" value="서범수" readonly>
							</div>
						</div>
						<div class="dArea dArea2">
							<div class="dCtn consDate"> 
								<label class="dTit">상담일자</label>
								<input type="text" class="inputCons" value="2019.11.11" readonly>
							</div>
							<div class="dCtn category">
								<label class="dTit">상담종류</label>
								<select name="consCategory" disabled class="consCate">
									<option value="class">수업</option>
									<option value="life">학원생활</option>
									<option value="atit">태도</option>
									<option value="etc">기타</option>
								</select>
							</div>
						</div>
						<div class="dArea dArea3">
							<div class="dCtn content">
								<label class="dTit">내용</label>
								<textarea class="inputCons" name="consreq" readonly>상담내용입니다.</textarea>
							</div>
							<div class="dCtn answer">
								<label class="dTit">상담자의 대응내용</label>
								<textarea class="inputCons" name="consres" readonly>상담대응내용입니다.</textarea>
							</div>
						</div>
					</div>
					<div class="btnArea">
						<a href="javascript: void(0);" class="updateBtn" onclick="updateCons();">수정하기</a>
						<button class="updateCons">수정완료</button>
						<button>삭제하기</button>
					</div> <!-- btnArea -->
				</form>
			</div> <!-- 블랙리스트 상담내용 end -->
		</div>
		
	</div> <!-- 블랙리스트 전체정보  end-->
	</section>

	
</body>
</html>