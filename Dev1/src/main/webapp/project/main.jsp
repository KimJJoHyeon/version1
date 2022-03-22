<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="../css/bootstrap.css">
<title>Main page</title>

<style>
@font-face {
    font-family: 'SANJUGotgam';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2112@1.0/SANJUGotgam.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: '국립박물관문화재단클래식B';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/국립박물관문화재단클래식B.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

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
	#userrrCss{
	font-family: '국립박물관문화재단클래식B';
	}
	div#TitmeD{
		float: right;
	}
	span.tit{
	font-size: 20px;
	font-family: 'SANJUGotgam';
	
	}
	span#tit3{
	font-size: 18px;
	color: red;
	vertical-align: sub;
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
	
</style>

<% 
String userID = null;
String userName = null;
if(session.getAttribute("userID")!= null){
userID = (String)session.getAttribute("userID");
userName = (String)session.getAttribute("userName");

}
%>
</head>


<body>
<% 	//로그인 아직 못해서 세션 아이디를 받지 못했을 때
	if(userID == null)
	{
%>
<nav class="navbar navbar-default">
        <div class="navbar-header">
             <button type="button" class="navbar-toggle collapsed"
             data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
             aria-expanded="false">
             
             <span class="icon-bar"></span>
             <span class="icon-bar"></span>
             <span class="icon-bar"></span>
             
             </button>
             <a class="navbar-brand" href="main.jsp"><span id ="title">Main Page</span></a>
        </div>
        
        <div class ="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        	<ul class ="nav navbar-nav">
        		<li><a href="main.jsp">메인</a></li>
        		
        	</ul>
        	<ul class ="nav navbar-right">
        		<li class="dropdown">
        			<a href="#" class ="dropdown-toggle"
        			data-toggle ="dropdown" role="button" 
        			aria-haspopup="true"
        			aria-expanded="false"
        			>메뉴<span class="caret"></span></a>
        				<ul class="dropdown-menu">
			        		<li class="active"><a href="login.jsp">로그인</a></li>
			        		<li><a href="join.jsp">회원가입</a></li>
			        	</ul>
        		</li>
        	</ul>
        </div>
   </nav>
   <div class="container">
   	<div class="col-g-4"></div>
   		<div class="jumbotron" style="pading-top:20px">
   								<!-- 사용자 입력받은 input들을 form 태그로 넘겨서 loginAction.jsp에서 처리한다. -->
   			<form method="post" action="login.jsp">
   			
   			<input type="submit" class="btn btn-primary form-control" value = "로그인 페이지로 이동" name ="login_check"/>
   			</form>
   		</div>
   </div>
    <footer>
   		<div id="footer_fot">
   			
   		</div>
   </footer>
<%
	}
%>
  <%
//로그인 성공해서 세션 아이디를 받았을 때
if(userID != null){
  %>
  <nav class="navbar navbar-default">
        <div class="navbar-header">
             <button type="button" class="navbar-toggle collapsed"
             data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
             aria-expanded="false">
             
             <span class="icon-bar"></span>
             <span class="icon-bar"></span>
             <span class="icon-bar"></span>
             
             </button>
             <a class="navbar-brand" href="main.jsp"><span id ="title">Main Page</span></a>
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
   <div class="container">
   	<div class="col-g-4"></div>
   		<div class="jumbotron" style="pading-top:20px">
   								<!-- 사용자 입력받은 input들을 form 태그로 넘겨서 loginAction.jsp에서 처리한다. -->
   			<h2><span id="userrrCss">반갑습니다.<%=userID%>님!</span></h2>
   			<div id="TitmeD">
   			<span class="tit" id="tit1">그나저나...</span><span class="tit" id="tit2">오늘 </span><span class="tit" id="tit3"> 뭐 먹지?...</span>
   			</div>
   			</form>
   		</div>
   </div>
    <footer>
   		<div id="footer_fot">
   			<jsp:include page="list.jsp"></jsp:include>
   		</div>
   </footer>
 
  <%
  }
  %>

   <script src="../js/jquery-3.6.0.min.js"></script>
   <script src="../js/bootstrap.js"></script>
  
</body>
</html>