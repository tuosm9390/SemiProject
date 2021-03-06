<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="hagong.academy.common.member.model.vo.*, java.text.SimpleDateFormat, java.util.*, hagong.academy.mngAdmin.mngLevel.model.vo.*"%>
<%
	Member loginUser = (Member) session.getAttribute("loginUser");

	SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy-MM");
	String today = dayFormat.format(System.currentTimeMillis());
	String[] todayArr = today.split("-");
	int purYear = Integer.parseInt(todayArr[0]);
	int purMonth = Integer.parseInt(todayArr[1]);

	ArrayList<MenuLevel> menuLevelList = null;
	if(loginUser != null) {
		menuLevelList = (ArrayList<MenuLevel>) request.getSession().getAttribute("menuList");
		System.out.println(menuLevelList);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>HAGONG</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon:400"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="<%= request.getContextPath() %>/sweetalert-master/docs/assets/sweetalert/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/normalize.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/demo.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/component.css" />
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel='stylesheet' href='<%=request.getContextPath()%>/viewAcademy/mngAdmin/mngStatus/Nwagon.css' type='text/css'>
<script src='<%=request.getContextPath()%>/viewAcademy/mngAdmin/mngStatus/Nwagon.js'></script>
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
	border: 2px solid green;
	border-radius: 5px;
	background: none;
	color: black;
	display: block;
	position: relative;
	font-weight: bold;
	background: snow;
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
	margin-top: 120px;
	margin-left: 7%;
	margin-right: 7%;
}

#name:focus, #name:hover {
	outline: none;
	cursor: default;
	color: black;
}

section {
	font-family: "Nanum Gothic" !important;
}

.boder {
	border-right: 1px solid black;
}
</style>
</head>
<body>

	<!-- 상단 메뉴 바 -->
	<header>
		<div id="menuheader">
			<a href="<%=request.getContextPath()%>/allStaff.cm"> <img
				src="<%=request.getContextPath()%>/images/hagong.png"
				style="height: 85px;"></a>
			<h2 class="topmenu" id="student">학생관리</h2>
			<h2 class="topmenu" id="employee">직원관리</h2>
			<h2 class="topmenu" id="class">수업관리</h2>
			<h2 class="topmenu" id="admin">관리자</h2>
			&nbsp;
			<h3 id="notice"
				onclick="location.href='<%=request.getContextPath()%>/alist.no'">
				<img src="<%=request.getContextPath()%>/images/notice.png"
					style="height: 30px;">
			</h3>
			<h3 id="sms">
				<img src="<%=request.getContextPath()%>/images/sms.png"
					style="height: 30px;">
			</h3>
			<h3 id="calendarr"
            onclick="location.href='<%=request.getContextPath()%>/viewAcademy/commonMenu/calendar/calendar.jsp'">
            <img src="<%=request.getContextPath()%>/images/calendar.png"
               style="height: 30px;">
         	</h3>

			<!-- 로그인 버튼 -->
			<% if(loginUser != null) { %>
			<button id="logout" style="margin-left: 5px;">로그아웃</button>
			<% }else { %>
			<button id="login" style="margin-left: 5px;">로그인</button>
			<% } %>

			<!-- 하단 회색 바 -->
			<div id="mid">
				<!-- 학생관리 메뉴 -->
				<div class="detailmenu" id="studentdetailmenu">

					<a href="<%=request.getContextPath()%>/alist.info"
						class="menu1">개인정보</a> <a>|</a>
					<a href="<%=request.getContextPath() %>/alist.pur?year=<%= purYear %>&month=<%= purMonth %>"
						class="menu1">수납</a> <a>|</a>
					<a href="<%=request.getContextPath()%>/alist.couns"
						class="menu1">상담</a> <a>|</a>
					<a href="<%=request.getContextPath()%>/alist.black"

						class="menu1">블랙리스트</a>
				</div>
				<!-- 수업관리 메뉴 -->
				<div class="detailmenu" id="classdetailmenu">
					<a
						href="<%=request.getContextPath()%>/alist.cs"
						class="menu3">수강생 관리</a> <a>|</a> <a
						href="<%=request.getContextPath()%>/classlist.attend"
						class="menu3">출결 관리</a> <a>|</a> <a
						href="<%=request.getContextPath()%>/alistClassList.class"
						class="menu3">강좌목록 관리</a> <a>|</a> <a
                  		href="<%=request.getContextPath()%>/alist.satis"
                 		class="menu3">만족도</a>
				</div>
				<!-- 관리자 메뉴 -->
				<div class="detailmenu" id="admindetailmenu">

					<a href="<%=request.getContextPath() %>/adetail.status" 
						class="menu4">학원 현황</a> <a>|</a>
					<a href="<%=request.getContextPath() %>/viewAcademy/mngAdmin/mngLevel/setLevel.jsp"
						class="menu4">메뉴 권한 관리</a> <a>|</a>
					<a href="<%=request.getContextPath()%>/alist.plan"
						class="menu4">연간계획</a>
				</div>

				<% if(loginUser != null) {  %>
				<div id="member">
					<button type="button" id="name"
						style="margin-right: 4%; background: none; border: none; font-size: large;">
						<%= loginUser.getName() %>님
					</button>
				<% if(!loginUser.getUserId().equals("admin")) {%>
					<button
                  style="margin-left: 15px; background: none; border: none; text-decoration: underline;"
                  onclick="location.href='<%= request.getContextPath() %>/adetail.ps?type=view&no=<%= loginUser.getUserNo()%>'">개인정보 관리</button>
				</div>
				<% } else { %>
					<label
                  style="background: none; border: none; margin-top:2px;"
                  >접속을 환영합니다 : )</label>
				<% } %>
				<% }%>
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
		$("#sms").click(function(){
			var str = "sdfsdkfldfk";
			swal("★ SMS OPEN 예정 ★\n2019년 12월 32일 오픈!\n조금만 기다려 주세요 : )", {
	    		buttons : ["확인"],
	    	})
		});
		
		//로그인 버튼 클릭 시
		$("#login").click(function() {
       		location.href="<%=request.getContextPath()%>/viewAcademy/common/login.jsp";
     	});

		$("#logout").click(function() {
	    	
	    	swal("로그아웃 하시겠습니까?", {
	    		buttons : [ "취소", "확인" ],
	    	}).then(function(isConfirm){
	    		if(isConfirm) {
	    			location.href="<%=request.getContextPath()%>/logout.cm";
	    		}
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
	        location.href="<%= request.getContextPath() %>/alist.staff?how=uName&page=1";
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
		
		//내 정보 수정
		function myInfo(){
	    	location.href = "<%= request.getContextPath() %>/viewAcademy/commonMenu/viewUserInfo.jsp";
		};
	</script>

</body>
</html>