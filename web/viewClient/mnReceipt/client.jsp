<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
<title>Insert title here</title>

<link href="woco.accordion.css" rel="stylesheet">
<style>
	html, body { height: 100%; background-color: #fff; }

.wrap { position: absolute; width: 100%; padding: 30px; max-width: 700px; top: 30%; left: 45%; transform: translateX(-50%); }

.accordion {
	display: block;
	position: relative;
	width: 120%; }

.accordion__item {
	display: block;
	width: 100%;
	margin-bottom: 15px;
	
	&:last-child {
		margin-bottom: 0; }}

.accordion__title {
	display: block;
	position: relative;
	height: 40px;
	line-height: 40px;
	padding: 0px 50px 0 20px;
	font-size: .875em;
	font-weight: 500;
	color: #333;
	border-bottom: 1px solid #eee;
	overflow: hidden;
	transition: background-color .2s;

	&:hover {
		background-color: #fafafa; }

	&.active {
		background: hsl(95,70%,90%);
	
		& .x7 {
		transform: rotate(-90deg);
		
		& .btop {
			width: 67%;
			top: 2px;
			transform: translateY(-50%) rotate(-45deg);
			transform-origin: 50% 50%; }
		& .bmid {
			opacity: 0; }
		& .bbot {
			width: 67%;
			bottom: 2px;
			transform: translateY(50%) rotate(45deg);
			transform-origin: 50% 50%; }}}}

.accordion__content {
	display: none;
	position: relative;
	overflow: hidden;
	border: 1px solid #eee;
	border-top: none;
	line-height: 1.65;
	padding: 25px;
	background-color: #fff;
	font-size: .875em; }
.accordion__content2 {
	display: none;
	
	overflow: hidden;
	border: 1px solid #eee;
	border-top: none;
	line-height: 1.65;
	padding: 25px;
	background-color: #fff;
	font-size: .875em; }

// --- Icon ---
.bmenu { 
	width: 26px; 
	height: 16px; 
	display: block; 
	position: absolute;
	right: 15px;
	top: 12px; }

.btop, .bmid, .bbot {
	right: 0;
	width: 100%;
	height: 2px;
	position: absolute;
	background-color: #333;
	border-radius: 1px; }

.btop {
	width: 40%; }

.bmid {
	width: 60%; }

.bbot {
	width: 80%; }

.x7 {
	transition: transform .3s ease-out;
	transform-origin: 60% 75%;
	
	& .btop {
		top: 0;
		transition: width .3s, transform .3s, top .0s;
		transition-timing-function: ease-out; }

	& .bmid {
		top: calc(50% - 1px);
		transform-origin: 100% 50%;
		transition: opacity .1s;
		transition-timing-function: ease-out; }

	& .bbot {
		bottom: 0;
		transition: width .3s, transform .3s, bottom .0s;
		transition-timing-function: ease-out; }}
		
		#md1{
		border:1px solid black;
		heiht:300px;
		width:300px;
		}
		
		   #title {
           
            width: 760px;
            display: inline-flex;
            height: 300px;
        }
        #a,#b{
            width: 380px;
            border: 1px solid lightgray;
        }
       #tablebox{
         border:1px solid black;  
         width: 760px;
         height: 100px;
       }
       .mytable{
       		border-collapse: collapse;
           border:1px solid black;
           width:380px;
           height: 300px;
       }
       th{
           height: 40px;
           text-align: center;
       }
       td{
            border:1px solid black;
       }
       #titlemsg{
       	padding-left: 190px;
       }
</style>

	
	
</head>

<body>
<div id="titlemsg">
	<h3>빛상찬 님의 수강과목</h3>
	<button style="float: left;">현재수강</button>
	<button style="float: left;">과거수강</button>
</div>
<div class="wrap">
	
	<ul class="accordion">
		<li class="accordion__item">
			<a class="accordion__title" href="javascript:void(0)">중1국어 완벽정리
			<div class="bmenu x7"><span class="btop"></span><span class="bmid"></span><span class="bbot"></span></div>
			</a>
			
			
			<div class="accordion__content">
			
			<div id="title">
        <div id="a">
            <table  class="mytable" id="mytable1">
                <tr>
                    <th colspan="3">납입금내역고지서</th>
                </tr>
                <tr>
                    <td>강좌명</td>
                    <td>중1국어어쩌구</td>
                    <td rowspan="3">띄용</td>
                </tr>
                <tr>
                    <td>수업료</td>
                    <td>5000억</td>
                </tr>
                <tr>
                    <td>할인</td>
                    <td>합계</td>
                </tr>
             
            </table>
        </div>

        
        <div id="b">
            <table  class="mytable" id="mytable2">
                <tr>
                    <th colspan="5">영수증</th>
                </tr>
                <tr>
                    <td colspan="3">일련번호 : </td>
                    <td colspan="2">연월(분기) :</td>
                </tr>
                <tr>
                    <td rowspan="2">납부자</td>
                    <td colspan="2">등록(신고)번호:</td>
                    <td colspan="2">성명:</td>
                </tr>
                <tr>
                   
                    <td colspan="2">생년월일:</td>
                    <td colspan="2">교습과목:</td>
                </tr>
                <tr>
                    <td rowspan="3">납부명세</td>
                    <td rowspan="2">교습비:</td>
                    <td colspan="3">기타경비:</td>
                </tr>
                <tr>
                    <td>  a</td>
                    <td>  a</td>
                    <td>  a</td>
                </tr>
                <tr>
                    <td> a </td>
                    <td> a </td>
                    <td> a </td>
                    <td> a </td>
                </tr>
            </table>
        </div>
    </div>
    <div id="tablebox">
      <pre> 		            	                위와  같이 영수하였음을 증명합니다.
        		                           		     2019/ㅁㄴㅇ/ㄴㄴ
        			             	학원설립 운영자 교습자 또는 개인과외 교습자       (서명또는 인) </pre>
    </div>
			
			</div> 
			
			
			
			</li>
		<li class="accordion__item">
			<a class="accordion__title" href="javascript:void(0)">중2국어 정리안함
			<div class="bmenu x7"><span class="btop"></span><span class="bmid"></span><span class="bbot"></span></div>
			</a>
			<p class="accordion__content">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></li>
		<li class="accordion__item">
			<a class="accordion__title" href="javascript:void(0)">중3도 안함
			<div class="bmenu x7"><span class="btop"></span><span class="bmid"></span><span class="bbot"></span></div>
			</a>
			<p class="accordion__content">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></li>
		<li class="accordion__item">
			<a class="accordion__title" href="javascript:void(0)">This is a tittle, simply dummy text
			<div class="bmenu x7"><span class="btop"></span><span class="bmid"></span><span class="bbot"></span></div>
			</a>
			<p class="accordion__content">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></li>
		<li class="accordion__item">
			<a class="accordion__title" href="javascript:void(0)">This is a tittle, simply dummy text
			<div class="bmenu x7"><span class="btop"></span><span class="bmid"></span><span class="bbot"></span></div>
			</a>
			<p class="accordion__content">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></li>
	</ul>
	
</div>
<script>
$(function() {
	$('.accordion').find('.accordion__title').click(function(){
		// Adds active class
		$(this).toggleClass('active');
		// Expand or collapse this panel
		$(this).next().slideToggle('fast');
		// Hide the other panels
		$('.accordion__content').not($(this).next()).slideUp('fast');
		
		// Removes active class from other titles
		$('.accordion__title').not($(this)).removeClass('active');		
	});
});
</script>

</body>
</html>