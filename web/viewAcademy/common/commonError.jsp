<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% String errorCode = (String) request.getAttribute("errorCode"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="<%= request.getContextPath() %>/sweetalert-master/docs/assets/sweetalert/sweetalert.min.js"></script>

<title>Insert title here</title>
</head>
<body>
	<% if(errorCode == "loginFail") { %>
	<script>
		$(function(){
			swal ({
				title: "로그인 실패",
				text: "아이디와 비밀번호를 확인하세요.",
				icon: "warning",
				button: "확인"
			}).then(function(){
				location.href="<%=request.getContextPath()%>/allStaff.cm";
			});
		});
	</script> 
	
	<% }else if(errorCode == "pwdUpdateFail") { %>
	<script>
		$(function(){
			swal ({
				title: "비밀번호 변경 실패",
				text: "비밀번호 변경에 실패하셨습니다.",
				icon: "warning",
				button: "확인"
			}).then(function(){
				location.href="<%=request.getContextPath()%>/allStaff.cm";
			});
		});
	</script>
	
	<% }else if(errorCode == "insertStaffFail") { %>
	<script>
		$(function(){
			swal ({
				title: "직원정보 등록 실패",
				text: "직원정보 등록에 실패하셨습니다.",
				icon: "warning",
				button: "확인"
			}).then(function(){
				location.href="<%=request.getContextPath()%>/alist.staff";
			});
		});
	</script>
	
	<% }else if(errorCode == "staffListFail") { %>
	<script>
		$(function(){
			swal ({
				title: "직원정보 목록 조회 실패",
				text: "직원목록 조회에 실패하셨습니다.",
				icon: "warning",
				button: "확인"
			}).then(function(){
				location.href="<%=request.getContextPath()%>/allStaff.cm";
			});
		});
	</script>
	
	<% }else if(errorCode == "staffDetailFail") { %>
	<script>
		$(function(){
			swal ({
				title: "직원 상세정보 조회 실패",
				text: "직원 상세정보 조회에 실패하셨습니다.",
				icon: "warning",
				button: "확인"
			}).then(function(){
				location.href="<%=request.getContextPath()%>/allStaff.cm";
			});
		});
	</script>
	
	<% }else if(errorCode == "staffDeleteError") { %>
	<script>
		$(function(){
			swal ({
				title: "직원 정보 삭제 실패",
				text: "직원 정보 삭제에 실패하셨습니다.",
				icon: "warning",
				button: "확인"
			}).then(function(){
				location.href="<%=request.getContextPath()%>/allStaff.cm";
			});
		});
	</script>
	
	<% }else if(errorCode == "updateStaffFail") { %>
	<script>
		$(function(){
			swal ({
				title: "직원 정보 수정 실패",
				text: "직원 정보 수정에 실패하셨습니다.",
				icon: "warning",
				button: "확인"
			}).then(function(){
				location.href="<%=request.getContextPath()%>/allStaff.cm";
			});
		});
	</script>
	
	<% }else if(errorCode == "userDetailFail") { %>
	<script>
		$(function(){
			swal ({
				title: "개인정보 조회 실패",
				text: "개인정보 조회에 실패하셨습니다.",
				icon: "warning",
				button: "확인"
			}).then(function(){
				location.href="<%=request.getContextPath()%>/allStaff.cm";
			});
		});
	</script>
	
	<% }else if(errorCode == "updateUserFail") { %>
	<script>
		$(function(){
			swal ({
				title: "개인정보 수정 실패",
				text: "개인정보 수정에 실패하셨습니다.",
				icon: "warning",
				button: "확인"
			}).then(function(){
				location.href="<%=request.getContextPath()%>/allStaff.cm";
			});
		});
	</script>
	
	<% }else if(errorCode == "purchaseListViewFail") { %>
	<script>
		$(function(){
			swal ({
				title: "수납내역 조회 실패",
				text: "수납내역 조회에 실패하셨습니다.",
				icon: "warning",
				button: "확인"
			}).then(function(){
				location.href="<%=request.getContextPath()%>/allStaff.cm";
			});
		});
	</script>

	<% } else if(errorCode == "insertStudentFail") { %>
	<script>
		$(function(){
			swal ({
				title: "학생정보 등록 실패",
				text: "학생정보 등록에 실패하셨습니다.",
				icon: "warning",
				button: "확인"
			}).then(function(){
				location.href="<%=request.getContextPath()%>/viewAcademy/mngStudent/mngInfo/studentList.jsp";

			});
		});
	</script>
	<% } else if(errorCode == "NotFoundError") { %>
	<script>
		$(function(){
			swal ({
				title: "접근 권한 제한",
				text: "해당 메뉴에 접근 권한이 없습니다.",
				icon: "warning",
				button: "확인"
			}).then(function(){
				location.href="<%=request.getContextPath()%>/allStaff.cm";

			});
		});
	</script>
	<% } %>
</body>
</html>