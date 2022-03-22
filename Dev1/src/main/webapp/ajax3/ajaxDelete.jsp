<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String departmentId = request.getParameter("departmentId");
	
	
	Connection conn = null;
	PreparedStatement psmt = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "hr";
	String password="1234";
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,user,password);
		
		String sql = "delete from departments where department_id="+departmentId;
		psmt = conn.prepareStatement(sql);
		
		psmt.executeUpdate();
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(conn != null) conn.close();
		if(psmt != null) psmt.close();
	}
%>