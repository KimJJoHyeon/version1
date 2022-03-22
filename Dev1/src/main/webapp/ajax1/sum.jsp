<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");

	Integer num1D = Integer.parseInt(num1);
	Integer num2D = Integer.parseInt(num2);
	
	Integer result = num1D+num2D;
	
	out.print(result);
	
%>