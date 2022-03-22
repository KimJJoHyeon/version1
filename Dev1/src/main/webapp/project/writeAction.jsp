<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="BoardDAO" class="board.BoardDAO" scope="page"></jsp:useBean>
<jsp:useBean id="BoardDTO" class="board.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="BoardDTO"/>

<%
	//String userID = (String)session.getAttribute("userID");
	
	
	//String userID = request.getParameter("writer"); */
	int write_result = 0;
	write_result = BoardDAO.write(BoardDTO);
	
	
		if(write_result == 1 ){
			PrintWriter script = response.getWriter();
			
			
			script.println("<script>");
			script.println("alert('글쓰기 성공')");
			
			//이전 페이지로 사용자를 돌려보냄
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
	
		
	}else if(write_result == 0){
		PrintWriter script = response.getWriter();

		script.println("<script>");
		script.println("alert('글 쓰기 오류')");
		
		//이전 페이지로 사용자를 돌려보냄
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
		
		
	}
%>