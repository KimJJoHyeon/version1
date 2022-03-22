<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="user.*" %>

    
<% 
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="userDAO" class="user.UserDAO" scope="page"></jsp:useBean>
<jsp:useBean id="userDTO" class="user.UserDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="userDTO"/>

<%
//유효성 체크 부터 해야할 듯
	
	int write_result = 0;
	//userDTO.printAll();
	int result = userDAO.NameCheck(userDTO);

	
	//중복된 아이디 나옴
	if(result == -1){
		PrintWriter script = response.getWriter();
		
		script.println("<script>");
		script.println("alert('아이디가 중복입니다.')");
		
		//이전 페이지로 사용자를 돌려보냄
		script.println("history.back()");
		script.println("</script>");
		
	}
	//중복된 아이디 없음 DB insert로 감
	else if(result == 1){
		write_result =  userDAO.write(userDTO);
		System.out.println("DB INSERT 검사 : "+write_result);
		if(write_result == 0){
			PrintWriter script = response.getWriter();
			
			script.println("<script>");
			script.println("alert('회원가입 오류.')");
			
			//이전 페이지로 사용자를 돌려보냄
			script.println("history.back()");
			script.println("</script>");
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입 성공됨.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
	}	else {
		PrintWriter script = response.getWriter();
		
		script.println("<script>");
		script.println("alert('DB 오류')");
		
		//이전 페이지로 사용자를 돌려보냄
		script.println("history.back()");
		script.println("</script>");
		
	}


%>