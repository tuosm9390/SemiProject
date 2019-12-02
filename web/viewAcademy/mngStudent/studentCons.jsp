<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#consilArea table *{
		text-align:center;
		text-align: -webkit-center;
	}
</style>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="container">
	<!-- Top Navigation -->
	<header>

	</header>
			<div class="component" id="consilArea">
				<h2>학생상담 리스트</h2>
				<table id="classlist">
					<thead>
						<tr>
							<th>원생명</th>
							<th>상담횟수</th>
							<th>마지막 상담일자</th>
							<th>상담일지</th>
							<th>상담추가</th>
						</tr>
					</thead>
					<tbody id="consList">
						<tr><td class="user-name">강동원(010-7777-8888)</td><td class="cons-count">1회</td><td class="last-cons">2019.03.02.</td><td class="cons-list"><button onclick="conslist();">상담일지</button></td><td><button>상담추가</button></td></tr>
						<tr><td class="user-name">주지훈(010-7777-8888)</td><td class="cons-count">4회</td><td class="last-cons">2019.03.02.</td><td class="cons-list"><button onclick="conslist();">상담일지</button></td><td><button>상담추가</button></td></tr>
						<tr><td class="user-name">조진웅(010-7777-8888)</td><td class="cons-count">11회</td><td class="last-cons">2019.03.02.</td><td class="cons-list"><button onclick="conslist();">상담일지</button></td><td><button>상담추가</button></td></tr>
						<tr><td class="user-name">정유미(010-7777-8888)</td><td class="cons-count">31회</td><td class="last-cons">2019.03.02.</td><td class="cons-list"><button onclick="conslist();">상담일지</button></td><td><button>상담추가</button></td></tr>
						<tr><td class="user-name">전지현(010-7777-8888)</td><td class="cons-count">3회</td><td class="last-cons">2019.03.02.</td><td class="cons-list"><button onclick="conslist();">상담일지</button></td><td><button>상담추가</button></td></tr>
						<tr><td class="user-name">김지원(010-7777-8888)</td><td class="cons-count">0회</td><td class="last-cons">2019.03.02.</td><td class="cons-list"><button onclick="conslist();">상담일지</button></td><td><button>상담추가</button></td></tr>
					</tbody>
				</table>
			</div>
			<script>
				function conslist(){
					location.href = "<%=request.getContextPath()%>/viewAcademy/mngStudent/studentConsDetail.jsp";					
				};
			</script>
		</div>
		<!-- /container -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script>
		<script src="js/jquery.stickyheader.js"></script>
		<script>
			
		</script>
</body>
</html>