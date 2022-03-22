package board;

import java.sql.Connection;
import java.util.Date;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import party.PartyDAO;



//데이터베이스에 접근하기위한 클래스 -=>DB접속만함
public class BoardDAO {
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

	
	//게시판 DB에 쓰기
	public int write(BoardDTO board) {
		String SQL = "insert into Board values(user_seq.nextval,?,?,?,?,?,?,sysdate,?,1,?)";//게시글을 입력하는 SQL문을 작성하시오.
		
		String SEQ = "SELECT user_seq.currval FROM dual";
		int result = 0;
		int seq_reesult = 0;
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm");
		try {
			Connection conn = getConnection();
			PreparedStatement pstmt ;
			pstmt = conn.prepareStatement(SQL);
			
			//?에 해당하는 부분에 매개변수의 user getter들 넣어줌
			if(board.getWriter() == null || board.getWriter() == "") {
				result = -1;
			}
		
			
			pstmt.setString(1, board.getMenu()); 
			pstmt.setString(2, board.getLoc());
			pstmt.setString(3, board.getWriter()); 
			pstmt.setString(4, board.getContent()); 
			pstmt.setInt(5, board.getTotalNumber()); 
			board.setUpdateFlag(0);
			//sdf1.parse(board.getRateTime());
			pstmt.setInt(6, board.getUpdateFlag()); 
			pstmt.setString(7, board.getRateTime());
			pstmt.setString(8, board.getRateDate());
			
			//pstmt.setDate(8, (Date) sdf2.parse(board.getRateDate()));
//			pstmt.setString(7,board.getRateTime());
//			pstmt.setDate(8,board.getRateDate());
			
			//업데이트 쿼리 실행
			 pstmt.executeUpdate();
			
			pstmt.close();
			
			PartyDAO p_dao = new PartyDAO();
			
			
			pstmt = conn.prepareStatement(SEQ);
			ResultSet rs= pstmt.executeQuery();
			rs = pstmt.executeQuery();
				if(rs.next()) {
				int checkSEQ = rs.getInt(1);
				seq_reesult = p_dao.insert(board,checkSEQ);
				
				if(seq_reesult == 1) {
					 result = 1;
				}
			}
			}catch (Exception e) {
				e.printStackTrace();
			}
		
		
		
		return result;
	}
								//int start, int end
	public List<BoardDTO> getArticles(){
		List<BoardDTO> articleList=null;
		
		String sql = "SELECT * FROM ("
				+ "	select ROWNUM r, BoardIDX, Menu, Loc, Writer, TotalNumber, reg_date, curNumber, RATEDATE, RATETIME , Content"
				+ "	from Board order by BoardIDX DESC)";
		try(Connection con = getConnection();
			PreparedStatement pstmt	=con.prepareStatement(sql)){

			ResultSet rs= pstmt.executeQuery();
			
			if(rs != null) 
				articleList = new ArrayList<BoardDTO>();
			
			while(rs.next()){
				BoardDTO dto = new BoardDTO();

				/* 구현하시오. */
				dto = new BoardDTO();
				dto.setBoardIDX(rs.getInt("BoardIDX"));
				dto.setMenu(rs.getString("Menu"));
				dto.setLoc(rs.getString("Loc"));
				dto.setWriter(rs.getString("Writer"));
				dto.setTotalNumber(rs.getInt("TotalNumber"));
				dto.setReg_date(rs.getDate("reg_date"));
				
				dto.setRateDate(rs.getString("RATEDATE"));
				dto.setRateTime(rs.getString("rateTime"));
				dto.setCurNumber(rs.getInt("curNumber"));
				dto.setContent(rs.getString("Content"));
		
				articleList.add(dto);
			}
			
			rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return articleList;
	}
	public BoardDTO getArticles2(String idx){
		//List<BoardDTO> articleList=null;
		BoardDTO board = null;
		String sql = "select Menu, Loc, Writer, Content, RATEDATE, RATETIME"
				+ "	from Board"
				+ " where BoardIDX = ?";
		
			
		try(Connection con = getConnection();
			PreparedStatement pstmt	= con.prepareStatement(sql)){
			
			pstmt.setString(1, idx);
			ResultSet rs = pstmt.executeQuery();
				/* 구현하시오. */
				if(rs != null) 
					board = new BoardDTO();
				while(rs.next()){
				board = new BoardDTO();
				board.setMenu(rs.getString("Menu"));
				board.setLoc(rs.getString("Loc"));
				board.setWriter(rs.getString("Writer"));
				board.setContent(rs.getString("Content"));
				board.setRateDate(rs.getString("RATEDATE"));
				board.setRateTime(rs.getString("rateTime"));
			
			
				}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return board;
	}
	public int updateCur(int num) {
		int result  = 0;
		//String S_SQL = "select TotalNumber, CurNumber from BOARD where BoardIDX = ?";
		String SQL  = "UPDATE BOARD SET CURNUMBER = "
					  +"(select COUNT(*) from Party WHERE party_BoardIDX = ?)"
					  +"WHERE BoardIDX = ?";
		
		//System.out.println("업데이트 메소드의 num "+num);			

		try(Connection con = getConnection();
				PreparedStatement pstmt	=con.prepareStatement(SQL)){
				pstmt.setInt(1, num);
				pstmt.setInt(2, num);
				pstmt.executeUpdate();
				result = 1;
			}catch(Exception e){
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
