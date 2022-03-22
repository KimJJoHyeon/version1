<%@page import="java.io.PrintWriter"%>
<%@page import="party.PartyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="PartyDAO" class ="party.PartyDAO"></jsp:useBean>
<jsp:useBean id="PartyDTO" class ="party.PartyDTO"></jsp:useBean>
<jsp:setProperty property="*" name="PartyDTO"/>


<jsp:useBean id="boardDAO" class ="board.BoardDAO"></jsp:useBean>
<jsp:useBean id="boardDTO" class ="board.BoardDAO"></jsp:useBean>


<% 
	int result = 0;
	int checkResult = 0;
	/* System.out.println("글쓴이"+PartyDTO.getParty_Writer());
	System.out.println("게시판 넘버"+PartyDTO.getParty_BoardIDX());
	System.out.println("세션 ID"+PartyDTO.getParty_User()); */
	
	
	checkResult = PartyDAO.checkParty(PartyDTO); // 중복 아이디 검사
	
	int InserrtResult = 0;
	
	if(checkResult == -1){
	
		
		PrintWriter script = response.getWriter();
		
		script.println("<script>");
		script.println("alert('이미 신청한 사용자입니다.')");
		
		//이전 페이지로 사용자를 돌려보냄
		script.println("history.back()");
		script.println("</script>");
		
	}else{
		PartyDAO.insertParty(PartyDTO);
		InserrtResult = boardDAO.updateCur(PartyDTO.getParty_BoardIDX());
			if(InserrtResult == 1){
				
				PrintWriter script = response.getWriter();
				
				script.println("<script>");
				script.println("alert('파티 신청 완료')");
				
				//이전 페이지로 사용자를 돌려보냄
				script.println("location.href= 'main.jsp'");
				script.println("</script>");
			}else{
				PrintWriter script = response.getWriter();
				
				script.println("<script>");
				script.println("alert('오류 발생')");
				
				//이전 페이지로 사용자를 돌려보냄
				script.println("history.back()");
				script.println("</script>");
			}
			
		}

%>

