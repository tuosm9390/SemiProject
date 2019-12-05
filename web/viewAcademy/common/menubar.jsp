<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%
   Member loginMember = (Member) request.getSession().getAttribute("loginMember");
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon:400"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/normalize.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/demo.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/component.css" />
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
#menuheader {
	position: fixed;
	top: 0px;
	left: 7%;
	right: 7%;
	height: 122px;
	font-weight: bold;
	background: white;
	display: flex;
	justify-content: space-around;
	align-items: center;
	font-family: "Do Hyeon";
	z-index: 1;
}

#mid {
	position: fixed;
	top: 93px;
	left: 7%;
	right: 7%;
	height: 30px;
	font-weight: bold;
	background: rgba(211, 211, 211, 0.4);
	display: flex;
	align-items: center;
}

#menuheader>.topmenu:hover, .topmenu:visited, .topmenu:active {
	cursor: pointer;
	color: orangered;
}

#menuheader>h3:hover, h3:visited, h3:active {
	cursor: pointer;
}

button {
	border: 1px solid green;
	border-radius: 5px;
	background: none;
	color: black;
	display: block;
	position: relative;
}

button:focus {
	outline: none;
}

input:focus {
	outline: none;
}

button:hover {
	cursor: pointer;
	background: green;
	border: 1px solid green;
	color: white;
}

#topbutton {
	height: 50px;
	width: 50px;
	background: lightgray;
	border: none;
	border-radius: 50px;
	cursor: pointer;
	float: right;
	position: fixed;
	right: 50px;
	bottom: 50px;
}

/* 학생관리 */
#studentdetailmenu {
	color: black;
	position: absolute;
	left: 13%;
	font-weight: normal;
	display: none;
}

/* 수업관리 */
#classdetailmenu {
	color: black;
	position: absolute;
	left: 30%;
	font-weight: normal;
	display: none;
}

/* 관리자 */
#admindetailmenu {
	color: black;
	position: absolute;
	left: 40%;
	font-weight: normal;
	display: none;
}

#member {
	position: fixed;
	display: inline-flex;
	right: 7%;
	height: 30px;
	width: 13%;
}

a {
	margin-right: 10px;
	color: #333;
	text-decoration: underline;
}
/* 세부메뉴 */
.detailmenu>a {
	text-decoration: none;
}

.detailmenu>a[class]:hover {
	color: black;
}

body {
	margin-top: 150px;
	margin-left: 7%;
	margin-right: 7%;
}

td, th {
	text-align: center;
}

#name:focus, #name:hover {
	outline: none;
	cursor: default;
	color: black;
}

section{
	font-family: "Nanum Gothic" !important;
}
</style>
</head>
<body>

	<!-- 상단 메뉴 바 -->
	<header>
		<div id="menuheader">
			<a href="<%=request.getContextPath()%>/index.jsp"> <img
				src="<%=request.getContextPath()%>/images/hagong.png"
				style="height: 85px;"></a>
			<h2 class="topmenu" id="student">학생관리</h2>
			<h2 class="topmenu" id="employee">직원관리</h2>
			<h2 class="topmenu" id="class">수업관리</h2>
			<h2 class="topmenu" id="admin">관리자</h2>
			&nbsp;
			<h3 id="notice">
				<img src="<%=request.getContextPath()%>/images/notice.png"
					style="height: 30px;">
			</h3>
			<h3 id="sms"
				onclick="location.href='<%=request.getContextPath()%>/viewAcademy/common/smspage.jsp'">
				<img src="<%=request.getContextPath()%>/images/sms.png"
					style="height: 30px;">
			</h3>
			<h3 id="calendar"
			onclick="location.href='<%=request.getContextPath()%>/viewAcademy/common/calendar.jsp'">
				<img src="<%=request.getContextPath()%>/images/calendar.png"
					style="height: 30px;">
			</h3>
			<%-- <% if(loginMember != null) { %> --%>
			<!-- <button id="logout" style="margin-left: 5px;">로그아웃</button> -->
			<%-- <% }else { %> --%>
      	<button id="login" style="margin-left: 5px;">로그인</button>
      	<%-- <% } --%>
      	
			<!-- 하단 회색 바 -->
			<div id="mid">
				<!-- 학생관리 메뉴 -->
				<div class="detailmenu" id="studentdetailmenu">
					<a href="<%=request.getContextPath()%>/viewAcademy/mngStudent/studentList.jsp"
						class="menu1">개인정보</a> <a>|</a>
					<a href="#" class="menu1">수납</a> <a>|</a>
					<a href="<%=request.getContextPath()%>/viewAcademy/mngStudent/mngCouns/studentCons.jsp"
						class="menu1">상담</a> <a>|</a>
					<a href="<%=request.getContextPath()%>/viewAcademy/mngStudent/mngBlack/blacklist.jsp"
						class="menu1">블랙리스트</a>
				</div>
				<!-- 수업관리 메뉴 -->
				<div class="detailmenu" id="classdetailmenu">
					<a href="<%=request.getContextPath()%>/viewAcademy/mngClass/mngCS/classStudent.jsp"
						class="menu3">수강생 관리</a> <a>|</a>
					<a href="<%=request.getContextPath()%>/viewAcademy/mngClass/mngAttend/manageAttend.jsp"
						class="menu3">출결 관리</a> <a>|</a>
					<a href="<%=request.getContextPath()%>/viewAcademy/mngClass/mngClassList/classInfo.jsp"
						class="menu3">강좌목록 관리</a> <a>|</a>
					<a href="<%=request.getContextPath()%>/viewAcademy/mngClass/mngSatisfy/satisfactionList.jsp"
						class="menu3">만족도</a>
				</div>
				<!-- 관리자 메뉴 -->
				<div class="detailmenu" id="admindetailmenu">
					<a href="<%=request.getContextPath() %>/viewAcademy/mngAdmin/mngStatus/presentCondition.jsp" 
						class="menu4">학원 현황</a> <a>|</a>
					<a href="<%=request.getContextPath() %>/viewAcademy/mngAdmin/mngLevel/menuLevel.jsp"
						class="menu4">메뉴 권한 관리</a> <a>|</a>
					<a href="<%=request.getContextPath()%>/viewAcademy/mngAdmin/mngPlan/plan.jsp"
						class="menu4">연간계획</a>
				</div>

				<div id="member">
					<button type="button" id="name"
						style="margin-right: 4%; background: none; border: none; font-size: x-large;">관리자님</button>
					<button style="margin-left: 15px; background: none; border: none; text-decoration: underline;"
					onclick="location.href='<%= request.getContextPath() %>/viewAcademy/commonMenu/updateStaffInfo.jsp'">내
					정보 수정</button>
				</div>
			</div>
		</div>
	</header>
	<section></section>

	<!-- 하단 메뉴 -->
	<footer>
		<button id="topbutton" onclick="location.href='#'">TOP</button>
	</footer>

	<!-- 스크립트 -->
	<script>
		$("#login").click(function() {
       		location.href="<%=request.getContextPath()%>/viewAcademy/common/login.jsp";
     	});

		$("#logout").click(function() {
	    	<%-- location.href="<%=request.getContextPath()%>/logout.me"; --%>
	    	swal("로그아웃 하시겠습니까?", {
	    		buttons : [ "취소", "확인" ],
	    	});
	    });

		//학생 관리 메뉴 클릭 시
		$("#student").click(function() {
			$('#classdetailmenu').hide();
			$('#admindetailmenu').hide();
			if ($(".detailmenu").css("display") == "none") {
				$("#studentdetailmenu").show();
			} else {
				$("#studentdetailmenu").hide();
			}
		});

		//직원 관리 메뉴 클릭 시
	     $("#employee").click(function() {
	        $(".detailmenu").css("display", "none");
	        location.href="<%= request.getContextPath() %>/viewAcademy/mngStaff/staffList.jsp";
	     });

		//수업 관리 메뉴 클릭 시
		$("#class").click(function() {
			$("#studentdetailmenu").hide();
			$('#admindetailmenu').hide();
			if ($("#classdetailmenu").css("display") == "none") {
				$('#classdetailmenu').show();
			} else {
				$('#classdetailmenu').hide();
			}
		});

		//관리자 메뉴 클릭 시
		$("#admin").click(function() {
			$("#studentdetailmenu").hide();
			$('#classdetailmenu').hide();
			if ($("#admindetailmenu").css("display") == "none") {
				$('#admindetailmenu').show();
			} else {
				$('#admindetailmenu').hide();
			}
		});
	</script>

</body>
</html>