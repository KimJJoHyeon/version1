<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script>
	function sumget() {
		/*var num1 = $("input[name=num1]").value;
		var num2 = $("input[name=num2]").value;*/
		$.ajax({
			type:"get",
			url: "sum.jsp",
			//데이터 넘길 때 속성임
			data: $("#frm").serialize(), //serialize()사용시 : num1=??&num2=??라고 저절로됨
			success: function(data){
				$("#result").text(data);
			}
		});
	}
	
	function sumpost() {
		/*var num1 = $("input[name=num1]").value;
		var num2 = $("input[name=num2]").value;*/
		$.ajax({
			type:"post",
			url: "sum.jsp",
			//데이터 넘길 때 속성임
			data: $("#frm").serialize(), //serialize()사용시 : num1=??&num2=??라고 저절로됨
			success: function(data){
				$("#result").text(data);
			}
		});
	}
	
</script>
</head>
<body>
	<button onclick="sumget()">get</button>
	<button onclick="sumpost()">post</button>
	<form id="frm">
		<input type="text" name="num1">
		+
		<input type="text" name="num2">
		=
		<span id ="result"></span>
	</form>
</body>
</html>