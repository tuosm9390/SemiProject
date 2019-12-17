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
<style>
.bottomBtn {
	width: 100px;
	font-size:18px;
}
input {
	border: none !important;
}
section{
	background: url("/hagong/images/satisfy.png") no-repeat center;
	background-size: 100% 100%;
}

section button {
	float: right;
	margin-bottom: 5px;
	margin-left: 1%;
	font-size: 18px;
	font-family: "Nanum Gothic";
	font-weight: bold;
	border: 2px solid green;
}

input[type=button]{
	width: 30px;
	margin-bottom: 5px;
	margin-left: 1%;
	font-size: 18px;
	font-family: "Nanum Gothic";
	font-weight: bold;
	border: 2px solid green;
	border-radius: 5px;
	background: none;
	color: black;
}

input[type=text], select {
	border: 1px solid lightgray;
	border-radius: 5px;
	height: 30px;
}

textarea{
	border: 1px solid lightgray;
	border-radius: 5px;
}
section button:hover {
	cursor: pointer;
	background: green;
	border: 2px solid green;
	color: white;
}

tr, td {
	background: none !important;
	text-align: left !important;
}

.qo li{
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../../common/menubar.jsp"%>
	</header>
	<section>
	<div align="center">
	<fieldset style="border-bottom: none; border-left: none; border-right: none; border-top-color: black;
					width: 80%;">
		<legend align="center"><h1 style="font-family:'Do Hyeon'">　만족도 조사 상세　</h1></legend>
		<form>
			<table class="table" align="center">
				<tr>
					<td><li>만족도 조사 제목</td>
					<td colspan="3"><input type="text" value="<%=list.get(0).get("satTitle")%>" size="50"></td>
				</tr>
				<tr>
					<td><li>만족도 조사 대상</td>
					<td colspan="3"><input type="text" value="<%=list.get(0).get("target") %>" size="50">&emsp;</td>
				</tr>
				<tr>
					<td style="width: 239px;"><li>만족도 조사 날짜</td>
					<td style="width: 384px;">
					<input align="center" type="text" style="width: 100px;" id="start" name="start" value="<%=list.get(0).get("start") %>" readonly>
					&nbsp; ~ &emsp;<input align="center" type="text" style="width: 100px;" id="end" name="end" value="<%=list.get(0).get("end") %>" readonly>
					</td>
					<td style="text-align: center !important; width: 177px;"><label><li>혜택</li></label></td>
					<td colspan="3">
					<select disabled>
						<option><%=list.get(0).get("benCondition") + "" + list.get(0).get("benType") + " " + list.get(0).get("benRate")%></option>
					</select>
					</td>
				</tr>
				<tr>
					<td colspan="4"><li>문항 및 결과</td>
				</tr>
				<tr>
					<td colspan="4" class="question">
						<ol class="qo" style="color:black;">
						<% for(int i = 0; i < list.size(); i++) {
							//첫번째 문항
							if(i == 0) { %>
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
							<%	} else { %>
								</li>
							</ol>
								<br>
								<li>&emsp;
								<%= list.get(i).get("queContent") %>
								<br><br>
							<ol>
								<li><%= list.get(i).get("ansContent") %>
							<% } } }%>
							</ol>
						</ol>
					</td>
				</tr>
			</table>
		</form>
		<button class="bottomBtn" style="margin-right: 5%;"
			onclick="location.href='<%=request.getContextPath()%>/viewAcademy/mngClass/mngSatisfy/updateSatisfaction.jsp'">수정</button>
		<button class="bottomBtn" onclick="location.href='<%=request.getContextPath()%>/alist.satis'">취소</button>
		</fieldset>
	</div>
	</section>
	<script>n
		$("input").attr("readonly", true);
	</script>
</body>
</html>