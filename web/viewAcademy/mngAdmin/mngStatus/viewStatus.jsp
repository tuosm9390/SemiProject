<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="hagong.academy.mngAdmin.mngStatus.model.vo.*,java.util.*"%>
    
   <% ArrayList<MngStatus> list = (ArrayList<MngStatus>) request.getSession().getAttribute("list"); 

   %>
   
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
<title>HAGONG</title>
	<style>

	.outer{
		width:100%;
		margin-left: 5%;
		height:100%;
	}
	.chart{
		display: inline-block;
		width:49%;
		height:600px;
	}
	#chart19{
	margin-left: 25%;
	
	}
	#chart8{
		margin-top: -40px;
	}
	.avgtable{
		width:60% !important;
		margin-left: 30%;
	}
	.text1{
	
		width:30%;
		
	}
	.text2{
		
		width:30%;
	
	}
	.text3{
		margin-top:70px;
		width:50%;
		
	}
	section{
		background: snow;
	}
		*{margin:0;padding:0;}
		div{padding:0px; overflow: hidden; height: auto;}
		.hgroup{padding:20px;background-color:#e9e9e9;}
		.hgroup h1{font-family:Tahoma;}
		.hgroup p{margin:10px 0;font-size:10px}
		
	</style>
	<link rel='stylesheet' href='Nwagon.css' type='text/css'>
	<script src='Nwagon.js'></script>

</head>

<body>
<%
int sum = list.get(6).getInEtc()+ list.get(6).getInFriend()+list.get(6).getInInternet()+list.get(6).getInPcard()+list.get(6).getInPicket();
int internet = (int)Math.round((list.get(6).getInInternet()/(double)sum)*100);
int pcard = (int)Math.round((list.get(6).getInPcard()/(double)sum)*100);
int picket = (int)Math.round((list.get(6).getInPicket()/(double)sum)*100);
int friend = (int)Math.round((list.get(6).getInFriend()/(double)sum)*100);
int etc = (int)Math.round((list.get(6).getInEtc()/(double)sum)*100);
%>

	<header><%@ include file="/viewAcademy/common/menubar.jsp" %></header>
<%-- <%if(loginUser != null && loginUser.getUserId().equals("admin")) {%>/ --%>
	<section>
<div class="outer">
  	 	<div align="center">
            <fieldset
               style="margin-right:100px; margin-bottom: -10px; border-left: none; border-right: none; border-bottom: none; border-top-color: black; width: 16%;">
               <legend align="center">
                  <h1 align="center" style="font-family: 'Do Hyeon';">　학원 현황　</h1>
               </legend>
            </fieldset>
         </div>
	<div class="chart">
	<h3 class="text1"><li>학생수 변동 추이</li></h3>
		<div id="chart19"></div>
		<h3 class="text2"><li>학생 유입 경로 순위</li></h3>
		<div class="avg">
				<table class="table avgtable">
					<tr>
						<th>순위</th>
						<th>경로</th>
						<th>비중</th>
					</tr>
					<tr>	
						<td>1</td>
						<td>친구</td>
						<td><%=friend %>　%</td>
					</tr>
					<tr>	
						<td>2</td>
						<td>전단지</td>
						<td><%=pcard %>　%</td>
					</tr>
					<tr>	
						<td>3</td>
						<td>인터넷</td>
						<td><%=internet %>　%</td>
					</tr>
					<tr>
						<td>4</td>
						<td>광고판</td>
						<td><%=picket %>　%</td>
					</tr>
					<tr>	
						<td>5</td>
						<td>기타</td>
						<td><%=etc %>　%</td>
					</tr>
				</table>
			</div>	
	</div>
	<div class="chart">
	<h3 class="text3"><li>인기 & 비인기 과목 추세</li></h3>
		<div id="chart8"></div>
	</div>
</div><!-- outer end -->
	<script>
		var options = {
			'legend':{
				names: ['2달전', '1달전', '현재'],
				hrefs: []
					},
			'dataset':{
				title:'학생수 변동 추이', 
				values: [[<%=list.get(6).getAllStudent3()%>,<%=list.get(6).getEnrollDate3()%>,<%=list.get(6).getLeaveDate3()%>],
					[<%=list.get(6).getAllStudent2()%>,<%=list.get(6).getEnrollDate2()%>,<%=list.get(6).getLeaveDate2()%>],
					[<%=list.get(6).getAllStudent1()%>,<%=list.get(6).getEnrollDate1()%>,<%=list.get(6).getLeaveDate1()%>]],
				colorset: ['#DC143C','#FF8C00', '#2EB400'],
				fields:['전체학생', '입학', '퇴원']
				},
			'chartDiv' : 'chart19',
			'chartType' : 'multi_column',
			'chartSize' : {width:500, height:300},
			'maxValue' : <%=list.get(6).getAllStudent1()%>,
			'increment' : 10
		};

		Nwagon.chart(options);

	</script>

	
	<script>
		var options = {
			'legend': {
	            names: ['<%=list.get(0).gettName()%>','<%=list.get(1).gettName()%>','<%=list.get(2).gettName()%>','<%=list.get(5).gettName()%>','<%=list.get(4).gettName()%>','<%=list.get(3).gettName()%>'],
	            hrefs: []
	        },
	        'dataset': {
	            title: 'Playing time per day',
	            values: [<%=list.get(0).getCnt()%>,<%=list.get(1).getCnt()%>,<%=list.get(2).getCnt()%>,<%=list.get(5).getCnt()%>,<%=list.get(4).getCnt()%>,<%=list.get(3).getCnt()%>],
	            colorset: ['#FF8C00',"#56b4e9"],
	            fields:['TOP3','LOW3']
	        },
	        'chartDiv': 'chart8',
	        'chartType': 'column',
	        'chartSize': { width: 600, height: 500 },
	        'maxValue': <%=list.get(2).getCnt()%>*2,
	        'increment': 5
		};

		Nwagon.chart(options);

	</script>
	
<%-- 	<% } else{ 
		request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
		request.getRequestDispatcher("../common/errorPage.jsp").forward(request,response);
	}%> --%>
	</section>
</body>
</html>