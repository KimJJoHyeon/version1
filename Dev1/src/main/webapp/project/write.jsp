<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="../css/bootstrap.css">
<title> 글쓰기</title>
<style type="text/css">

button{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:40px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}
label{
text-align: left;
}
button[name="bnt2"]{
background:grey;
}
.btn-group{
	width:100%;
	text-align: center;
}

</style>
<script>
	function usercheck(obj) {
		var checkvalue = obj.value;
		//console.log(checkvalue);
		
		var span = document.createElement("span");
		span.innerHTML = "";
		
		if(checkvalue == null || checkvalue == ""){
	
			var lastchild = obj.parentNode.lastChild;
			//console.log($(lastchild).prop('tagName'));
			var typecheck = $(lastchild).prop('tagName');
			if(typecheck  != "SPAN"){
				span.innerHTML = "* 필수";
				//console.log("if문 실행" +span.innerHTML);
				obj.parentNode.appendChild(span);
			}
		}else{
			var lastchild = obj.parentNode.lastChild;
			var typecheck = $(lastchild).prop('tagName');
			if(typecheck  == "SPAN"){
				obj.parentNode.lastChild.remove();
			}
		}
	}
	function check() {
		var findspan = $("form").find("span");
		var findinput = $("form").find("input");
		/* console.log(findspan.length);
		console.log(findinput.length); */
		var result = true;
		if(findspan.length >0){
			result = false;
		}
		for(var i = 0; i<findinput.length; i++){
			var nullcheck = findinput[i].value;
			//console.log("for문 : "+nullcheck);
			if(nullcheck == "" || nullcheck == null ){
				result = false;
			}
		}
		if(result == false){
			alert("양식이 맞지 않습니다. 확인 부탁드립니다.");
		}else{
			$("form").submit();
			
		}
	}
	function reset_btn() {
	
	$('form').each(function() {
	      this.reset();
	  });
	}
</script>
</head>
<body>
<%
String userID = (String)session.getAttribute("userID"); 
System.out.println("wirte : "+ userID);

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
             <a class="navbar-brand" href="main.jsp">JSP 게시판 웹사이트</a>
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
        			>접속하기<span class="caret"></span></a>
        				<ul class="dropdown-menu">
			        		<li class="active"><a href="logoutAction.jsp">로그아웃</a></li>
			        	</ul>
        		</li>
        	</ul>
        </div>
   </nav>
   <div class="container">
   	<div class="col-g-4"></div>
   		<div class="jumbotron" style="pading-top:20px">
   			<!-- 사용자 입력받은 input들을 form 태그로 넘겨서 loginAction.jsp에서 처리한다. -->
   			
   			<form method="post" action="writeAction.jsp">
   				<input type="hidden" name="writer" value =<%=userID%>>
   				<h3 style="text-align:center">글쓰기</h3>
   				<div class="form-group">
   					<label>메뉴</label>
   					
   					<input type="text" class="form-control" placeholder="메뉴" 
   					name="menu" maxlength="20" onblur="usercheck(this)">
   				</div>
   				<div class="form-group">
   					<label>위치</label>
   					<input type="text" class="form-control" placeholder="네이버 지도로 원하시는 가게를 검색후 url을 붙여넣어주세요" 
   					name="loc"  onblur="usercheck(this)">
   				</div>
   				<div class="form-group">
   					<label>내용</label>
   					<input type="text" class="form-control" placeholder="최대 100자입니다." 
   					name="content" maxlength="100" onblur="usercheck(this)">
   				</div>
   				<div class="form-group">
   					<label>인원수 설정</label>
   					<select name="totalNumber">
   						<option value="2">2명</option>
   						<option value="3">3명</option>
   						<option value="4">4명</option>
   						<option value="5">5명</option>
   						<option value="6">6명</option>
   					</select>
   				</div>
   				<div class="form-group">
   					<label>시간 설정</label>
   					<p><input type="date" name="rateDate"></p>
   					<p><input type="time" name="rateTime"></p>
   					<!-- <input type="text" class="form-control" placeholder="시간" 
   					name="rateTime" maxlength="20" onblur="usercheck(this)"> -->
   				</div>
   				</form>
   			<!--  /form> -->
   		</div>
   </div>
   <div class="btn-group">
   		<button  class="button" onclick="reset_btn()" name="bnt2">취소</button>
   		<button  class="button" onclick="check()" name="bnt1">글쓰기</button>
   	</div>
   <script src="../js/jquery-3.6.0.min.js"></script>
   <script src="../js/bootstrap.js"></script>
</body>
</html>