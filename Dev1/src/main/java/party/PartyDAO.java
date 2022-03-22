package party;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.mysql.cj.xdevapi.JsonArray;

import board.BoardDTO;

public class PartyDAO {

	public Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();//톰캣 자체의 Context정보를 얻어오는 부분
		Context envCtx = (Context)initCtx.lookup("java:comp/env");//java:comp/env: Resource정의 Context까지 접근하는 정해진 이름(JNDI)
		
		DataSource ds = (DataSource)envCtx.lookup("jdbc/OracleDB");//context.xml에 정의한 DataSource객체를 얻어오는 부분
		Connection conn = ds.getConnection();//ConnectionPool에서 Connection객체를 얻어오는 부분
		return conn;
	}
	
	public int insert(BoardDTO board,int seqNum) {
		
		String SEQ = "insert into Party values(party_seq.nextval,?,?,?)";//게시글을 입력하는 SQL문을 작성하시오.
		int result = 0;
		try {
			Connection conn = getConnection();
			PreparedStatement pstmt ;
			pstmt = conn.prepareStatement(SEQ);
			//ResultSet rs= pstmt.executeQuery();
			
			pstmt.setInt(1, seqNum); 
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getWriter()); 
	
//			//업데이트 쿼리 실행
			pstmt.executeQuery();
			result = 1;
			
			}catch (Exception e) {
				e.printStackTrace();
			}
		return result;
	
	}
	
	public List<String> MeberList(String idx){
		List<String> memlist = null;
		String SQL = "select party_user from party where party_BoardIDX = ?";
		try (
			Connection conn = getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL)){
			
			String list = null;

			pstmt.setString(1, idx);
			ResultSet rs= pstmt.executeQuery();
		
			if(rs!=null) {
				memlist = new ArrayList<String>();
				//list = rs.getString("party_user");
				while(rs.next()) {
					
					list = new String();
					list = rs.getString("party_user");
					
					memlist.add(list);
				}
			
			}
			
			}catch (Exception e) {
				e.printStackTrace();
			}
		return memlist;
	}
	public int checkParty(PartyDTO pdto) {
		String SQL = "select party_User from Party where  party_BoardIDX = ?";
		String str = pdto.getParty_User();
		int result = 0;
		try (Connection conn = getConnection();
				PreparedStatement pstmt  = conn.prepareStatement(SQL)){
	
			pstmt.setInt(1, pdto.getParty_BoardIDX()); 
			ResultSet rs = pstmt.executeQuery();
			
			if(rs != null) {
				//result = 0; //중복 아이디 존재
				while(rs.next()) {
				
				if(str.equals(rs.getString("party_User"))){
						System.out.println(rs.getString("party_User"));
						result = -1; // 중복 존재함.
						break;
					}
				}
			}
		
			}catch (Exception e) {
				e.printStackTrace();
			}
		return result;
	}
	
	
	public int insertParty(PartyDTO pdto) {
		String SQL = "insert into Party values(party_seq.nextval,?,?,?)";//게시글을 입력하는 SQL문을 작성하시오.
		
		int result = 0;
		try(Connection conn = getConnection();
				PreparedStatement pstmt  = conn.prepareStatement(SQL)){
			//ResultSet rs= pstmt.executeQuery();
			
			pstmt.setInt(1, pdto.getParty_BoardIDX()); 
			pstmt.setString(2,pdto.getParty_Writer());
			pstmt.setString(3,pdto.getParty_User()); 
	
//			//업데이트 쿼리 실행
			pstmt.executeQuery();
			result = 1;
			
			}catch (Exception e) {
				e.printStackTrace();
			}
		
		return result;
	}
	
	
}
