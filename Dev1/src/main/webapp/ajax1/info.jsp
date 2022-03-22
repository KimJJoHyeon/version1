<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
	
	
	String result = "이름 : "+name +"/ 나이 :"+age +"/ 연락처 : "+phone
			+"/ 주소 : "+addr;
	//document.getElement
	

	//out.print(result);
%>
이름 : <%=name %> <br>
나이 : <%=age %> <br>
연락처 : <%=phone %> <br>
주소 : <%=addr %> <br>