package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//데이터베이스에 접근하기위한 클래스 -=>DB접속만함
public class UserDAO {
//	private Connection conn;
//	
//	//2. sql에 접근해서 조작하는 변수
//	private PreparedStatement pstmt;
	
	//3. sql의 결과를 담는 변수 ResultSet 객체
	//private ResultSet rs;
	
	public Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();//톰캣 자체의 Context정보를 얻어오는 부분
		Context envCtx = (Context)initCtx.lookup("java:comp/env");//java:comp/env: Resource정의 Context까지 접근하는 정해진 이름(JNDI)
		
		DataSource ds = (DataSource)envCtx.lookup("jdbc/OracleDB");//context.xml에 정의한 DataSource객체를 얻어오는 부분
		Connection conn = ds.getConnection();//ConnectionPool에서 Connection객체를 얻어오는 부분
		return conn;
	}
	public int login(String userID, String userPassword ,UserDTO dto) {
		String SQL = "SELECT userPassword,userName FROM USERDB WHERE userID = ?";
		try {
			Connection conn = getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt = conn.prepareStatement(SQL);
			
			//?에 해당하는 부분에 매개변수의 userID를 넣어준다.
			pstmt.setString(1, userID); 
			
			//sql 실행한 결과(쿼리를) ResultSet 객체에 담는다.
			ResultSet rs = pstmt.executeQuery();
			
			//userID가 존재하여 Password가 존재한다면?
			if(rs.next()) {
				//그 결과를 뽑아와서 사용자가 입력한 userPassword와 비교한다.
				if(rs.getString(1).equals(userPassword)) {
					System.out.println("로그인 메소드 " +rs.getString(2));
					dto.setUserName(rs.getString(2));
					return 1; //1: 로그인 성공
						
				}else {
					return 0;//0: 비밀번호가 불일치
				}
			}
			return -1; //-1:아이디가 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //-2:데이터베이스 오류
	}
	
	//아이디 중복 확인 메소드
	public int NameCheck(UserDTO user) {
		
		String SQL_ID = "SELECT userID FROM USERDB WHERE userID = ?";
		int result = 0;
		try {
			Connection conn = getConnection();
			PreparedStatement pstmt ;
			pstmt = conn.prepareStatement(SQL_ID);
			
			//?에 해당하는 부분에 매개변수의 userID를 넣어준다.
			pstmt.setString(1, user.getUserID()); 
			
			//sql 실행한 결과(쿼리를) ResultSet 객체에 담는다.
			ResultSet rs = pstmt.executeQuery();
			//userID가 똑같은게 존재한다면? ->> DB 실행 오류
		
			if(rs.next()) {
				//아이디 중복 존재 시
				if(rs.getString(1).equals(user.getUserID())) {
					return -1;
				}
			}
			return 1; // 아이디 중복 없을 시
			}catch (Exception e) {
				e.printStackTrace();
			}
		return -2; // db오류
		
	}
	//회원가입 DB에 쓰기
	public int write(UserDTO user) {
		String SQL = "INSERT INTO USERDB values(?,?,?,?,?)";
		int result = 0;
		try {
			Connection conn = getConnection();
			PreparedStatement pstmt ;
			pstmt = conn.prepareStatement(SQL);
			
			//?에 해당하는 부분에 매개변수의 user getter들 넣어줌
			pstmt.setString(1, user.getUserID()); 
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName()); 
			pstmt.setString(4, user.getUserGender()); 
			pstmt.setString(5, user.getUserEmail()); 
			
			//업데이트 쿼리 실행
			 pstmt.executeUpdate();
			 result = 1;
			
			}catch (Exception e) {
				e.printStackTrace();
			}
		return result;
	}
	
	
//	//1.  데이터베이스에 접근하기 위한 객체
//	private Connection conn;
//	
//	//2. sql에 접근해서 조작하는 변수
//	private PreparedStatement pstmt;
//	
//	//3. sql의 결과를 담는 변수 ResultSet 객체
//	private ResultSet rs;
//	
//	//기본 생성자 -> 실제로 mysql에 접속하는 부분
//	public UserDAO() {
//		try {
//			/*1. mysql접속 ulr , 2.db아이디 3.db비밀번호 설정*/
//			String dbUrl ="jdbc:mysql://localhost:3306/BBS";
//			String dbID = "root";
//			String dbPassword ="1543";
//			
//			//mysql에 접근하기 위한 드라이버 추가
//			Class.forName("com.mysql.jdbc.Driver");
//			
//			conn = DriverManager.getConnection(dbUrl,dbID,dbPassword);
//			
//		} catch (Exception e) {
//			e.printStackTrace(); // 오류 발생
//		}
//	}
//	public int login(String userID, String userPassword) {
//		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
//		try {
//			pstmt = conn.prepareStatement(SQL);
//			
//			//?에 해당하는 부분에 매개변수의 userID를 넣어준다.
//			pstmt.setString(1, userID); 
//			
//			//sql 실행한 결과(쿼리를) ResultSet 객체에 담는다.
//			rs = pstmt.executeQuery();
//			
//			//userID가 존재하여 Password가 존재한다면?
//			if(rs.next()) {
//				//그 결과를 뽑아와서 사용자가 입력한 userPassword와 비교한다.
//				if(rs.getString(1).equals(userPassword)) {
//					return 1; //1: 로그인 성공
//				}else {
//					return 0;//0: 비밀번호가 불일치
//				}
//			}
//			return -1; //-1:아이디가 없음
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return -2; //-2:데이터베이스 오류
//	}
	
	

}
