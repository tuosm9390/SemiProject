<%--
/**
 * <pre>
 * 1. Author      : Hyerin
 * 2. CreateDate  : 2019. 12. 4. 오후 8:48:26
 * 3. ModifyDate  : 2019. 12. 4. 오후 8:48:26
 * 4. FileName    : 
 * 4. Description : 
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객용 메인</title>
<style>
	.upperArea { display:inline; }
	.satisfyArea {
		border:2px solid lightgray;
		width:40%;
		height:400px;
		position:absolute; top:18%;
		margin-right:5px;
	}
	.receiptArea {
		border:2px solid lightgray;
		width:43%;
		height:400px;
		position:absolute; top:18%; left:50%;
	}
	.bottomArea { 
		position:static;
	}
	.classArea {
		border:2px solid lightgray;
		width:86%;
		height:300px;
		position:absolute;
		top:62%;
		left:7%;
		margin-bottom:30px;
	}
</style>
</head>
<body>
	<%@ include file="/viewClient/common/menubar.jsp" %>
	<div class="upperArea">
		<div class="satisfyArea">
			<h3>만족도 조사</h3>
			<ul>
				<li>2019-11-04 만족도 조사</li>
				<li>2019-09-01 하반기 만족도 조사</li>
				<li>2019-03-01 하반기 만족도 조사</li>
				<li>2018-11-01 만족도 조사</li>
				<li>2018-06-01 만족도 조사</li>
			</ul>
		</div>
		<div class="receiptArea">
			<h3>고지서/영수증</h3>
			<ul>
				<li>11월 수강료 납부내역</li>
				<li>10월 수강료 납부내역</li>
				<li>09월 수강료 납부내역</li>
				<li>08월 수강료 납부내역</li>
				<li>07월 수강료 납부내역</li>
			</ul>
		</div>
	</div> <!-- upperArea end -->
	<div class="bottomArea">
		<div class="classArea">
			<h3>개설 예정 강좌</h3>
			<ul>
				<li>2020년 수능 대비 영어 집중반</li>
				<li>중3 수학 정복</li>
				<li>고1 영어 문법반</li>
				<li>중3 과학 기말고사 대비반</li>
			</ul>
		</div>
	</div> <!-- bottomArea end -->
</body>
</html>