<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="../css/bootstrap.css">
<title> JSP 게시판 웹 사이트</title>
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

</script>
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
             <a class="navbar-brand" href="main.jsp">JSP 게시판 웹사이트</a>
        </div>
        
        <div class ="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        	<ul class ="nav navbar-nav">
        		<li><a href="main.jsp">메인</a></li>
        		<li><a href="bbs.jsp">게시판</a></li>
        	</ul>
        	<ul class ="nav navbar-right">
        		<li class="dropdown">
        			<a href="#" class ="dropdown-toggle"
        			data-toggle ="dropdown" role="button" 
        			aria-haspopup="true"
        			aria-expanded="false"
        			>접속하기<span class="caret"></span></a>
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
   			
   			<form method="post" action="joinAction.jsp">
   				<h3 style="text-align:center">회원 가입</h3>
   				<div class="form-group">
   					<input type="text" class="form-control" placeholder="아이디" 
   					name="userID" maxlength="20" onblur="usercheck(this)">
   					
   				</div>
   				<div class="form-group">
   					<input type="password" class="form-control" placeholder="비밀번호" 
   					name="userPassword" maxlength="20" onblur="usercheck(this)">
   				</div>
   				  				<div class="form-group">
   					<input type="text" class="form-control" placeholder="닉네임" 
   					name="userName" maxlength="20" onblur="usercheck(this)">
   				</div>
   				 <div class="form-group" style="text-align:center;">
   				 	<div class="btn-group" data-toggle="buttons">
   				 		<label class="btn btn-primary active">
   				 			<input type="radio" name ="userGender" autocomplete="off" value="남자" checked="checked">남자
   				 		</label>
   				 		<label class="btn btn-primary">
   				 			<input type="radio" name ="userGender" autocomplete="off" value="여자" checked="checked">여자
   				 		</label>
   				 	</div>	
   				</div>

   				<div class="form-group">
   					<input type="email" class="form-control" placeholder="이메일" 
   					name="userEmail" maxlength="20" onblur="usercheck(this)">
   				</div>
   				</form>
   				<button class="btn btn-primary form-control" onclick="check()" name="bnt">회원가입 신청</button>
   			<!--  /form> -->
   		</div>
   </div>
   <script src="../js/jquery-3.6.0.min.js"></script>
   <script src="../js/bootstrap.js"></script>
</body>
</html>