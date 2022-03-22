<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="P_Dao" class="party.PartyDAO" />
<jsp:useBean id="P_Dto" class="party.PartyDTO"/>
<html>
<%
	String idx = request.getParameter("partyIdx");

	List<String> PartyList = null; 
	PartyList = P_Dao.MeberList(idx);
	int count = 0;
	if(PartyList != null){
		
	for(String s  : PartyList){
		//System.out.println("멤버들 : "+ s);
		count++;
%>	
	<head>
	
	<style type="text/css">
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
  <script src="../js/bootstrap.js"></script>
  <script type="text/javascript">


  </script>
	</head>
	<body>
	<table class ="type09">
		<tr>
			<th><%= count %></th>
			<td><%=  s %></th>
		</tr>
	</table>
	</body>
</html>
		
	<%
		}//for문 종료
	%>
	
	<% 
	}
%>