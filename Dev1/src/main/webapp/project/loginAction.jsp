<%@page import="user.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="userDAO" class="user.UserDAO" scope="page"></jsp:useBean>
<jsp:useBean id="userDTO" class="user.UserDTO" scope="page"></jsp:useBean>
<jsp:setProperty name ="userDTO" property="*"/>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		//UserDAO userDAO = new UserDAO();
		//UserDTO userDto = new UserDTO();
		
		int result = userDAO.login(userDTO.getUserID(),userDTO.getUserPassword(),userDTO);
		String userID = null;
		
				
		if(result == 1){ // 반환값이 1일 경우 -> 로그인 성공시 main화면으로 넘어감
			PrintWriter script = response.getWriter();
			
			//세션설정 
			session.setAttribute("userID", userDTO.getUserID());
			session.setAttribute("userName",userDTO.getUserName());
			
			script.println("<script>");
			script.println("alert('로그인에 성공하셨습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		else if(result == 0){ // 반환값이 0일 경우 ->비밀번호 틀릴경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			
			//이전 페이지로 사용자를 돌려보냄
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == -1){ // 반환값이 -1일 경우 -> ID가 존재하지 않음
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디 입니다.')");
			
			//이전 페이지로 사용자를 돌려보냄
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == 2){ // 반환값이 2일 경우 ->디비 오류
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생햇습니다.')");
			
			//이전 페이지로 사용자를 돌려보냄
			script.println("history.back()");
			script.println("</script>");
		}
	%>
  
</body>
</html>