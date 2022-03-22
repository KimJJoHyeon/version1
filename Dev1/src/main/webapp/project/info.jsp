<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="../css/bootstrap.css">
<title>info page</title>

<style>
	.navbar-header{
	background-color: rgb(41, 128, 185);
	}
	span#title{
		/*font-weight: 100px;*/
		text-align:center;
		font-style:italic;
		font-size:30px;
		color:black;
	}
	div#content_div{
		height: 300px;
	}
	div#div_content{
		text-align:center;
	}
	div_discription{
	text-align:left;
	}
	span#Hi{
		color: black;
		font-size: 20px;
		/*border: 1px solid black;*/
		padding: 10px 20px;
	}
	fotter{
	position: relative;
	}
	div#footer-Dis{
		font-size: 15px;
		color: black;
		font-weight: 30px;
	}
	div#footer-fot{
		position:absolute;
		bottom:0;
		text-align:right;
		margin-bottom: 0px;
	}
	section{
	text-align: center;
	}
	article#article{
		width:50%;
		height:500px;
		background-color: white;
		margin: auto;
		display: flex;
		
	}
	#CenterDiv{
		text-align:left;
		border :10px #9E9E9E solid;
		width:80%;
		height:80%;
		background-color: #EEEEEE;
		margin: auto;
	}
	label{
		font-size: 20px;
		margin: 5px;
	}
	span{
		margin:10px;
		font-size: 15px;
	}
	.bnt-class{
		text-align: center;
	}
	.btn{
		 background:#1AAB8A;
		  color:#fff;
		  border:none;
		  position:relative;
		  cursor:pointer;
		  transition:800ms ease all;
		  outline:none;
	}
	
</style>

</head>



<body>
  <nav class="navbar navbar-default">
        <div class="navbar-header">
             <button type="button" class="navbar-toggle collapsed"
             data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
             aria-expanded="false">
             
             <span class="icon-bar"></span>
             <span class="icon-bar"></span>
             <span class="icon-bar"></span>
             
             </button>
             <a class="navbar-brand" href="info.jsp"><span id ="title">상세보기 Page</span></a>
        </div>
        
        <div class ="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        	<ul class ="nav navbar-nav">
        		<li><a href="main.jsp">메인</a></li>
        		<li><a href="logoutAction.jsp">로그아웃</a></li>
        	</ul>
        	<ul class ="nav navbar-right">
        		<li class="dropdown">
        			<a href="#" class ="dropdown-toggle"
        			data-toggle ="dropdown" role="button" 
        			aria-haspopup="true"
        			aria-expanded="false"
        			>메뉴<span class="caret"></span></a>
        				<ul class="dropdown-menu">
			        		<li><a href="userinfo.jsp">마이 페이지</a></li>
			        	</ul>
        		</li>
        	</ul>
        </div>
   </nav>
   
<jsp:useBean id="dao" class="board.BoardDAO" />
<jsp:useBean id="dto" class="board.BoardDTO"/>
   <%
String sessionID = (String)session.getAttribute("userID");
List<BoardDTO> articleList = null;  
SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

String idx = request.getParameter("bno");
dto = dao.getArticles2(idx);


   String menu = dto.getMenu();

   String Writer = dto.getWriter();
   String positon = dto.getLoc();
   String content = dto.getContent();
  Date date2 = sdf2.parse(dto.getRateDate()+" "+dto.getRateTime()+":00");	
   String rateTime = sdf2.format(date2);
   
   %>
  <section>
  	<article id="article">
  		<div id="CenterDiv">
  			<div>
	  			<label>메뉴 : </label>
	  			<span><%= menu %></span>
  			</div>
  			<br>
  			<div>
	  			<label>위치 : </label>
	  			<span><a href="<%= positon %>" target="_blank">위치 보기</a></span>
  			</div>
  			<br>
  			<div>
	  			<label>내용 : </label>
	  			<span><%=content %></span>
  			</div>
  			<br>
  			<div>
	  			<label>작성자 : </label>
	  			<span><%=Writer %></span>
  			</div>
  			<br>
  			<div>
	  			<label>마감시간 : </label>
	  			<span><%=rateTime %></span>
  			</div>
  			<br>
  			<form method="post" id="frmmm" action="partyinsert.jsp">
  				<input type="hidden" name = "hidden_idx" value="<%=idx%>">
  				<input type="hidden" name = "hidden_Name" value="<%=sessionID%>">
  			<div class="bnt-class">
  					<button type="button" class ="btn" onclick="checkID(this)" name="submit">신청하기</button>
  					<button type="button" class ="btn" value="수정하기" name="modify">수정하기</button>
  					<button type="button" class ="btn" value="삭제하기" name="delete">삭제하기</button>
  			</div>
  			</form>
  		</div>
  		
  	</article>
  </section>
  
  <footer>
  <div>
  		<label>멤버 목록</label>
  	</div>
<jsp:include page="memList.jsp" >
  		<jsp:param name="partyIdx" value="<%= idx%>" />
</jsp:include>
  	
  </footer>
	<script type="text/javascript">
		function checkID(obj) {
			var sessonID = '<%= sessionID%>';
			var writerID = '<%= Writer %>';
			var idx = '<%= idx%>';
		
			if(sessonID == writerID){
				alert('작성자 본인은 신청할 수 없습니다.');
			}
			else{
				location.href = 'partyinsert.jsp?party_BoardIDX='+idx+'&party_Writer='+writerID
						+'&party_User='+sessonID;
			}
		}
	
	</script>
   <script src="../js/jquery-3.6.0.min.js"></script>
   <script src="../js/bootstrap.js"></script>
  
</body>
</html>