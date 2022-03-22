<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script>
	function listCall(){
		 $.ajax({
			 type:"get",
			 url:"ajaxList.jsp",
			 success:function(data){
				 var dataJson = JSON.parse(data.trim());
				 
				 var html = "";
				 
				 html ="<table border='1'>";
				 
				 html += "<tr><th>부서번호</th><th>부서명</th><th></th></tr>";
				 for(var i=0; i<dataJson.length;i++){
				 	html += "<tr>";
				 	html += "<td>"+dataJson[i].department_id+"</td>";                                     
				 	html += "<td>"+dataJson[i].department_name+"</td>";
				 	html += "<td><button onclick='modifyFn(this)'>수정</button><button onclick='delFn(this)'>삭제</button></td>";
				 	html += "</tr>";
				 }
				 html += "</table>";
				 
				 $("#list").html(html);
			 }
		 });
	}
	
	function delFn(obj){
		var departmentId = $(obj).parent().prev().prev().text();
		
		$.ajax({
			type:"post",
			url:"ajaxDelete.jsp",
			data: "departmentId="+departmentId,
			success:function(){
				$(obj).parent().parent().remove();
			}
		});
	}
	
	var clickRow;
	
	function modifyFn(obj){
		clickRow = $(obj).parent().parent();
		var departmentName = $(obj).parent().prev().text();
		var departmentId = $(obj).parent().prev().prev().text();
		$("input[name=departmentName]").val(departmentName);
		$("input[name=departmentId]").val(departmentId);
	}
	
	function saveFn(){
		var param = $("form").serialize();
		var departmentName = $("input[name=departmentName]").val();
		$.ajax({
			type:"post",
			url:"ajaxModify.jsp",
			data:param,
			success:function(){
				if(clickRow != undefined && clickRow != null){
					clickRow.find("td").eq(1).text(departmentName);
					clickRow = undefined;
					 $("input[name=departmentName]").val("");
					 $("input[name=departmentId]").val("");
				}
			}
		});
	}
</script>
</head>
<body>
	<h2>ajax를 이용하여 DB 데이터 조작하기 예제</h2>
	<button onclick="listCall()">조회</button>
	<div id="list">
	</div>
	
	<form>
		<input type="hidden" name="departmentId">
		<p>
			부서명 : <input type="text" name="departmentName">
		</p>
		<p>
			<button type="button" onclick="saveFn()">저장</button>
		</p>
	</form>

</body>
</html>