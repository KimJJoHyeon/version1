<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="org.json.simple.*" %>
<%
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "hr";
	String password="1234";
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,user,password);
		
		String sql = "select * from departments";
		psmt = conn.prepareStatement(sql);
		
		rs = psmt.executeQuery();
		
		JSONArray jArray = new JSONArray();
		
		while(rs.next()){
			JSONObject jObj = new JSONObject();
			jObj.put("department_id",rs.getInt("department_id"));
			jObj.put("department_name",rs.getString("department_name"));
			
			jArray.add(jObj);
		}
		
		out.print(jArray.toJSONString());
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(conn != null) conn.close();
		if(psmt != null) psmt.close();
		if(rs != null) rs.close();
	}
%>    