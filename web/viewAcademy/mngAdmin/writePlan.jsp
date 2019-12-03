<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Table Style</title>
<meta name="viewport"
	content="initial-scale=1.0; maximum-scale=1.0; width=device-width;">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding:400" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
body {
	font-size: 16px;
	font-weight: 400;
	text-rendering: optimizeLegibility;
}
.background {		
		overflow: auto;	
		width:85%;
		height:90%;
		margin-top:10%;
		margin-bottom:10%;
		text-align: center;
		position: absolute;
    	top: 50%;
    	left: 50%;
    	transform: translate(-50%, -50%)
	}
.tableDiv {
	display:inline-block;
}
/*** Table Styles **/
.table-fill {
	width:100%;
	background: white;
	border-radius: 3px;
	border-collapse: collapse;
	/* height: 320px;
	margin: auto; */
	padding: 5px;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
	animation: float 5s infinite;
}

th {
	color: white;
	background: green;
	border-right: 1px solid #343a45;
	font-size: 15px;
	padding-top: 10px;
	padding-bottom:10px;
	padding-left:10px;
	padding-right:10px;
	text-align: left;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
	vertical-align: middle;
}

th:first-child {
	border-top-left-radius: 3px;
}

th:last-child {
	border-top-right-radius: 3px;
	border-right: none;
}

tr {
	border-top: 1px solid #C1C3D1;
	border-bottom-: 1px solid #C1C3D1;
	color: #666B85;
	font-size: 16px;
	font-weight: normal;
	text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
}

tr:hover td {
	background: lightgray;
	color: black;
}

tr:first-child {
	border-top: none;
}

tr:last-child {
	border-bottom: none;
}

tr:nth-child(odd) td {
	background: #EBEBEB;
}

tr:nth-child(odd):hover td {
	background: lightgray;
	color: black;
}

tr:last-child td:first-child {
	border-bottom-left-radius: 3px;
}

tr:last-child td:last-child {
	border-bottom-right-radius: 3px;
}

td {
	background: #FFFFFF;
	padding: 20px;
	text-align: left;
	vertical-align: middle;
	font-weight: 300;
	font-size: 18px;
	text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
	border-right: 1px solid #C1C3D1;
}

td:last-child {
	border-right: 0px;
}

th.text-left {
	text-align: left;
}

th.text-center {
	text-align: center;
}

th.text-right {
	text-align: right;
}

td.text-left {
	text-align: left;
}

td.text-center {
	text-align: center;
}

td.text-right {
	text-align: right;
}

#delete, #write {
	font-size: 18px;
   margin-left: 1%;
   font-family: "Nanum Gothic";
   font-weight: bold;
   border: 2px solid green;
}
</style>
<style type="text/css">
	body {
   		font-family: "Nanum Gothic Coding";
	}
</style>
</head>

<body>
	<div class="background">
	<button id="delete" style="margin:10px; border:1px solid green; background:white; color:black;" onclick="delete();">삭제</button>
	<button id="write" style="margin:10px; border:1px solid green; background:white; color:black;">입력 및 수정</button>
	<div class="tableDiv">
	<table class="table-fill" cellpadding="5" cellspacing="2" align="center" style="table-layout:fixed; word-break:break-all;">
		<thead>
			<tr>
				<th class="text-left">상세 내용</th>
				<th class="text-left">1월</th>
				<th class="text-left">2월</th>
				<th class="text-left">3월</th>
				<th class="text-left">4월</th>			
				<th class="text-left">5월</th>
				<th class="text-left">6월</th>
				<th class="text-left">7월</th>
				<th class="text-left">8월</th>
				<th class="text-left">9월</th>
				<th class="text-left">10월</th>
				<th class="text-left">11월</th>
				<th class="text-left">12월</th>
			</tr>
		</thead>
		<tbody class="table-hover">
			<tr>
				<td class="text-left"></td>
				<td class="text-left" contenteditable="true"></td>
				<td class="text-left"></td>
				<td class="text-left"></td>
				<td class="text-left"></td>
				<td class="text-left"></td>
				<td class="text-left"></td>
				<td class="text-left"></td>
				<td class="text-left"></td>
				<td class="text-left"></td>
				<td class="text-left"></td>
				<td class="text-left"></td>
				<td class="text-left"></td>
			</tr>
			<tr>
				<td class="text-left"></td>
				<td class="text-left"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="text-left"></td>
				<td class="text-left"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="text-left"></td>
				<td class="text-left"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="text-left"></td>
				<td class="text-left"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="text-left"></td>
				<td class="text-left"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="text-left"></td>
				<td class="text-left"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>
	</div>
	</div>
	
	
	<!-- 버튼 클릭 시 스크립트 -->
	<script>
		function delete(){
			window.confirm("삭제?");
		}
	</script>
</body>
</html>