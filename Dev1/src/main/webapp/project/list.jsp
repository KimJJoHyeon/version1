<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import ="java.util.List, board.*, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 목록</title>
<style type="text/css">

.contentDiv{
		position: absolute;
		
	}
#write{
	position: absolute;
	margin-right: 0;
	background-color: gold;
	width: 100px;
	border: 3px solid black;
	border-radius: 5px;
	}
hr{
border-top:10px double gold;
}
	
table.type09 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;

}
table.type09 thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #369;
	border-bottom: 3px solid #036;
}
table.type09 tbody th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
}
table.type09 td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
</style>
<script src="../js/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
					//마감시간 넘어옴
	function secondFn(num, time) {
		   var _second = 1000;
		   var _minute = _second * 60;
		   var _hour = _minute * 60;
		   var _day = _hour * 24;
		   var timer;
		   
			var myDate = new Date();
		   var result = time - myDate;
		  	result = result - 1000;
		function rerload(day){
				
		    	if(result  <= 0){
		    		flag = false;
		    		 document.getElementById("day"+num).innerHTML = "종료되었습니다.";
		    		 document.getElementById("day"+num).style.color = "darkgrey";
		    	}
		    	else{
		    		result = day - 1000;
		    	
		    	 //console.log("시간 : "+result);
				 var days = Math.floor(result / _day);
			      var hours = Math.floor((result % _day) / _hour);
			      var minutes = Math.floor((result % _hour) / _minute);
			      var seconds = Math.floor((result % _minute) / _second); 
			     
		    	 document.getElementById("day"+num).innerHTML = days + '일 ';
			     document.getElementById("hour"+num).innerHTML = hours + '시간 ';
			     document.getElementById("minute"+num).innerHTML = minutes + '분 ';
			     document.getElementById("second"+num).innerHTML = seconds + '초'; 
			     document.getElementById("second"+num).style.color = "red"; 
			     document.getElementById("second"+num).style.fontSize = "15px";
			
		    	}
			}
		rerload(result);    
		timer = setInterval(() => {
			rerload(result)
		}, 1000);
	}
					
	function checkFlag(obj,i) {
		var flag = $(obj).parent().prev().find("span").text();
		var curmem = $(obj).parent().parent().find('td:eq(3)');
		var str = curmem.text();
		
		var curnum = str.substring(0,1);
		var totalnum = str.substr(4,5);
		
		var people = true;
		if(curnum == totalnum){
			people = false;
		}
		
		if(people == false){
			alert('이미 인원이 다 찼습니다..');
		}else{
			if(flag == "종료되었습니다."){
				alert('이미 종료된 게시물 입니다.');
				
			}else{
				location.href = 'info.jsp?bno='+i
			}
			
		}
	} 
				

</script>

</head>
<body>
<jsp:useBean id="dao" class="board.BoardDAO" />
<jsp:useBean id="dto" class="board.BoardDTO"/>

<jsp:useBean id="PDao" class="party.PartyDAO" />
<jsp:useBean id="PDto" class="party.PartyDTO"/>

<% 
String userID = (String)session.getAttribute("userID");
if(userID != null){
%>
<%  
List<BoardDTO> articleList = null;  
articleList = dao.getArticles();

System.out.println(articleList.size());
int startPagenum = 1;
int endNum = (articleList.size() /10);


SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");


	if(articleList.size() == 0){
%>
<form action="write.jsp">
		<div class="contentDiv" >
			<input type="submit" value="글쓰기" id = "write">
		</div>
	</form>

<br>
<h2>게시판에 글이 존재하지 않습니다.</h2>

<% 
}
else{
%>
	<form action="write.jsp">
		<div class="contentDiv">
			<input type="submit" value="글쓰기" id = "write">
		</div>
		
	</form>
	<br>
	<hr> 
	<br>
	<div class = "result">
		<table class="type09">
		<thead>
			<tr>
				<th scope="cols">No</th>
				<th scope="cols">메뉴</th>
				<th scope="cols">작성자</th>
				<th scope="cols">인원</th>
				<th scope="cols">등록 일자</th>
				<th scope="cols">마감 시간</th>
				<th scope="cols">남은 시간</th>
				<th scope="cols"></th>
			</tr>
		</thead>
		<tbody>
		<!--  <form id="frm" action="info.jsp" method="post">-->
		
<% 
for(int i=0; i<articleList.size();i++){
	   dto = (BoardDTO) articleList.get(i);
	   //String reg_date = sdf.format(dto.getReg_date());
	   //2022-03-15 17:04:50
%>
 <% 
 Date date = dto.getReg_date();
 Date date2 = sdf2.parse(dto.getRateDate()+" "+dto.getRateTime()+":00");
 //System.out.println(sdf1.format(date));
 long diffMil = (date2.getTime() - date.getTime());
 long diffSec = (date2.getTime() - date.getTime()) / 1000; //초 차이
 long diffMin = (diffSec) / 60; //분 차이
 long diffHor = (diffMin) / 60; //시 차이
 long diffDays = diffSec / (24*60*60); //일자수 차이


 %>  
 	<tr>
    	<td><%=dto.getBoardIDX()%></td>
    	<td><%=dto.getMenu() %></td>
    	<td><%=dto.getWriter() %></td>
    	<td><%= dto.getCurNumber() %> / <%= dto.getTotalNumber() %></td>
    	<td><%= sdf1.format(dto.getReg_date()) %></td>
    	<td><%= sdf2.format(date2) %></td>
    	<td id="here<%= i%>">
    		<span id="day<%= i%>"></span>
    		<span id="hour<%= i%>"></span>
    		<span id="minute<%= i%>"></span>
    		<span id="second<%= i%>"></span>
    		<script>secondFn(<%=i%>,'<%=date2.getTime()%>')</script>
    	</td>
 	
    	<td>
    		<input type ="button" value="고르기" onclick="checkFlag(this,'<%=dto.getBoardIDX()%>')"> 
    	</td>
    </tr>


<%
	}//for문의 닫힘 괄호
%>
   
			</tbody>
		</table>	
		<!-- <footer>
			<a href=""></a>
		</footer> -->	
	</div>
<%
} 
%>
<%}else { %>
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 먼저 해주세요')");
			
			//이전 페이지로 사용자를 돌려보냄
			script.println("location.href ='login.jsp'");
			script.println("</script>");
<%} %>
</body>
</html>



