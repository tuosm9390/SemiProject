<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, hagong.academy.mngClass.mngSatisfy.model.vo.*"%>
<%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='../../mngAdmin/mngStatus/Nwagon.css'
	type='text/css'>
<script src='../../mngAdmin/mngStatus/Nwagon.js'></script>
<style>
section button {
	float: right;
	margin-bottom: 5px;
	margin-left: 1%;
	font-size: 18px;
	font-family: "Nanum Gothic";
	font-weight: bold;
	border: 2px solid green;
	width:100px;
}

section button:hover {
	cursor: pointer;
	background: green;
	border: 2px solid green;
	color: white;
}

.resultArea {
	position: relative;
	background: rgba(211, 211, 211, .3);
	margin-left: 15%;
	margin-bottom: 5%;
	width: 70%;
	overflow: auto;
	border-radius: 20px;
}

.resultTable tr>td:first-child {
	vertical-align: top;
	text-align: left;
	font-size: large;
	padding-top: 3%;
	padding-left: 2%;
	width: 400px;
}

.resultTable tr:not(:last-child){
	border-bottom: 1px solid black;
}

ul.accessibility{
	height: 0px;
	display: none;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../../common/menubar.jsp"%>
	</header>
	<section>
	<div align="center">
	<fieldset style="border-left:none; border-right:none; border-bottom:none; border-top-color:black;
					width: 38%;">
		<legend align="center"><h1 style="font-family:'Do Hyeon'">　<%=list.get(0).get("satTitle") %>　</h1></legend>
			<div align="left">
				<li>대상 : <%=list.get(0).get("target") %></li>
				<li>실시 기간 : <%=list.get(0).get("start")%> ~ <%=list.get(0).get("end") %></li>
			</div>
		</fieldset>
	</div>
		<button style="margin-right: 20%;"
			onclick="location.href='<%=request.getContextPath()%>/alist.satis'">닫기</button>
		<button>삭제</button>

		<!-- 문항 목록 작성 -->
		<div align="center" class="resultArea">
			<table align="center" class="resultTable">
			<% int n = 0; for(int i = 0; i < list.size(); i++) {
					//첫번째 문항
					if(i == 0) { %>
				<tr>
					<td>
						<li>&emsp;
							<%= list.get(i).get("queContent") %>
							<br><br>
							<ol>
							<li><%= list.get(i).get("ansContent") %>
						<%	} else {
							//두번째 이후 문항 중 두개가 서로 같은 문항일 때
							if(list.get(i).get("queNo") == list.get(i - 1).get("queNo")) { %>
							<li><%= list.get(i).get("ansContent") %>
							<!-- 서로 다른 문항일 때 -->
						<%	} else { 
							n++; %>
							</li>
							</ol>
						</li>
					</td>
					<td>
						<div id="cursatis<%= n%>"></div>
					</td>
				</tr>
				<tr>
					<td>
						<li>&emsp;
							<%= list.get(i).get("queContent") %>
							<br><br>
						<ol>
							<li><%= list.get(i).get("ansContent") %>
						<% } } }%>
						</ol>
					</td>
				</tr>
			</table>
		</div>
	</section>
	<footer></footer>
	<script>
	for(var i = 0; i < <%= n%>; i++){
		
		var options = {
			'dataset' : {
				title : "asd",
				values : [ 25, 3, 10, 7 ],
				colorset : [ '#2EB400', '#2BC8C9', "#666666", '#f09a93' ],
				fields : [ '매우 만족', '만족', '불만족', '매우 불만족' ],
			},
			'donut_width' : 35,
			'core_circle_radius' : 50,
			'chartDiv' : "cursatis" + i,
			'chartType' : 'donut',
			'chartSize' : {
				width : 400,
				height : 200
			}
		};
	}
	Nwagon.chart(options);
	</script>
</body>
</html>