package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDTO {
	private String userID;
    private String userPassword;
    private String userName;
    private String userGender;
    private String userEmail;
    
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public void printAll() {
		System.out.println(this.userID);
		System.out.println(this.userPassword);
		System.out.println(this.userName);
		System.out.println(this.userGender);
		System.out.println(this.userEmail);
		
	}
	//1.  데이터베이스에 접근하기 위한 객체
		
//		public UserDTO() {
//			try {
//				/*1. mysql접속 ulr , 2.db아이디 3.db비밀번호 설정*/
//				String dbUrl ="jdbc:mysql://localhost:3306/BBS";
//				String dbID = "root";
//				String dbPassword ="1543";
//				
//				//mysql에 접근하기 위한 드라이버 추가
//				Class.forName("com.mysql.jdbc.Driver");
//				
//				conn = DriverManager.getConnection(dbUrl,dbID,dbPassword);
//				
//			} catch (Exception e) {
//				e.printStackTrace(); // 오류 발생
//			}
//		}
	
}
