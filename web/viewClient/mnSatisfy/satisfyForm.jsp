<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
	
		width:80%;
		height:800px;
		margin-left: auto;
		margin-right: auto;
		
	}
	.top{

	}
	.article {
	
	}
	.btns{
		margin-left: 50px;
	}
	.q{
		margin-left: 8%;
		text-align: left;
	}
	.tarea{
		content: center;
		text-align: center;
	}
	input[type="radio"] {
    display:inline-block;
    width:19px;
    height:19px;
    margin:-2px 10px 0 0;
    margin-left:30px;
    vertical-align:middle;
    background:url(check_radio_sheet.png) left top no-repeat;
    cursor:pointer;
}
#botbtn{
	margin-left: 78%;
}
#space{
	margin-top: 10px;
}
#text2{
	text-align : left;
	margin-left: 20%; 
}
#rsetbtn{
	margin-left: 77%;
}
</style>
</head>
<body>
<header>	<%@ include file="/viewAcademy/common/menubar.jsp" %> </header>
<section>
	<div class="outer">
			<div class="top" align="center">
					<h2>2019-2학기 중간 만족도 평가</h2>
				<div id="text2">
						      <p>	● 대상 : 강남고등학교 2 학년 고3대비 선핵 ㅇㅇ</p>
								<p> ● 실시 기간 : 213123123 </p>
			</div>
			<div class="article" align="center">
			<form>
				<button id="rsetbtn" onclick="goList();">닫기</button>
				<div style="overflow:auto; width:850px; height:500px; padding:10px; background-color:lightgray;" align="left">
					
					<h4 class="q">1. 질문 123123123213213</h4>
					<div align="center">
					<input type="radio" value="1" class="btns" width="100px" height="100px"><label>매우만족</label>
					<input type="radio" value="2" class="btns"><label>만족</label>
					<input type="radio" value="3" class="btns"><label>보통</label>
					<input type="radio" value="4" class="btns"><label>불만족</label>
					</div><!-- 질문1 끝 -->
					
					<h4 class="q">2. 질문 123123123213213</h4>
					<div align="center">
					<input type="radio" value="1" class="btns"><label>매우만족</label>
					<input type="radio" value="2" class="btns"><label>만족</label>
					<input type="radio" value="3" class="btns"><label>보통</label>
					<input type="radio" value="4" class="btns"><label>불만족</label>
					</div><!-- 질문1 끝 -->
					
					<h4 class="q">3. 질문 123123123213213</h4>
					<div align="center">
					<input type="radio" value="1" class="btns"><label>매우만족</label>
					<input type="radio" value="2" class="btns"><label>만족</label>
					<input type="radio" value="3" class="btns"><label>보통</label>
					<input type="radio" value="4" class="btns"><label>불만족</label>
					</div><!-- 질문1 끝 -->
					
						<h4 class="q">3. 질문 123123123213213</h4>
					<div align="center">
					<input type="radio" value="1" class="btns"><label>매우만족</label>
					<input type="radio" value="2" class="btns"><label>만족</label>
					<input type="radio" value="3" class="btns"><label>보통</label>
					<input type="radio" value="4" class="btns"><label>불만족</label>
					</div><!-- 질문1 끝 -->
					
						<h4 class="q">3. 질문 123123123213213</h4>
					<div align="center">
					<input type="radio" value="1" class="btns"><label>매우만족</label>
					<input type="radio" value="2" class="btns"><label>만족</label>
					<input type="radio" value="3" class="btns"><label>보통</label>
					<input type="radio" value="4" class="btns"><label>불만족</label>
					</div><!-- 질문1 끝 -->
					
					<div align="center">
					<h4 class="q">4. 수업 및 강사에 대한 개선 의견</h4>
					<textarea placeholder="내용을 입력해 주세요." style="width: 700px; height:100px; resize:none; overflow:auto;" ></textarea>
					</div>
				</div>
					<div id="space">
					<button type="submit" id="botbtn">제출</button>
					</div>
				</form>
			</div>
	</div><!-- outer end -->
	</div>
</section>	
<script>
	function goList(){
		location.href="/viewAcademy/mngClass/mngSatisfy/satisfactionList.jps";
	}
</script>
	
</body>
</html>