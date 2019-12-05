<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		border: 1px solid black;
		width:100%;
		height:800px;
	}
	.top{
	border:1px solid black;
	}
	.article {
	border:1px solid black;
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
</style>
</head>
	<%@ include file="/viewAcademy/common/menubar.jsp" %>
<body>
<section>
	<div class="outer">
			<div class="top" align="center">
					<h1>2019-2학기 중간 만족도 평가</h1>
					<p>대상 : 강남고등학교 2 학년 고3대비 선핵 ㅇㅇ</p>
					<p>	실시기간 : 213123123 1</p>
			</div>
			<div class="article" align="center">
				<div style="overflow:auto; width:850px; height:500px; padding:10px; background-color:lightgray;" align="left">
					
					<h4 class="q">1. 질문 123123123213213</h4>
					<div align="center">
					<input type="checkbox" value="1" class="btns"><label>매우만족</label>
					<input type="checkbox" value="2" class="btns"><label>만족</label>
					<input type="checkbox" value="3" class="btns"><label>보통</label>
					<input type="checkbox" value="4" class="btns"><label>불만족</label>
					</div><!-- 질문1 끝 -->
					
					<h4 class="q">2. 질문 123123123213213</h4>
					<div align="center">
					<input type="checkbox" value="1" class="btns"><label>매우만족</label>
					<input type="checkbox" value="2" class="btns"><label>만족</label>
					<input type="checkbox" value="3" class="btns"><label>보통</label>
					<input type="checkbox" value="4" class="btns"><label>불만족</label>
					</div><!-- 질문1 끝 -->
					
					<h4 class="q">3. 질문 123123123213213</h4>
					<div align="center">
					<input type="checkbox" value="1" class="btns"><label>매우만족</label>
					<input type="checkbox" value="2" class="btns"><label>만족</label>
					<input type="checkbox" value="3" class="btns"><label>보통</label>
					<input type="checkbox" value="4" class="btns"><label>불만족</label>
					</div><!-- 질문1 끝 -->
					
						<h4 class="q">3. 질문 123123123213213</h4>
					<div align="center">
					<input type="checkbox" value="1" class="btns"><label>매우만족</label>
					<input type="checkbox" value="2" class="btns"><label>만족</label>
					<input type="checkbox" value="3" class="btns"><label>보통</label>
					<input type="checkbox" value="4" class="btns"><label>불만족</label>
					</div><!-- 질문1 끝 -->
					
						<h4 class="q">3. 질문 123123123213213</h4>
					<div align="center">
					<input type="checkbox" value="1" class="btns"><label>매우만족</label>
					<input type="checkbox" value="2" class="btns"><label>만족</label>
					<input type="checkbox" value="3" class="btns"><label>보통</label>
					<input type="checkbox" value="4" class="btns"><label>불만족</label>
					</div><!-- 질문1 끝 -->
					
					<div align="center">
					<h4 class="q">4. 수업 및 강사에 대한 개선 의견</h4>
					<textarea placeholder="Describe yourself here..." style="width: 700px; height:100px; resize:none; overflow:auto;"> </textarea>
					</div>
					
				</div>
				
			</div>
	</div><!-- outer end -->
</section>	
	
</body>
</html>