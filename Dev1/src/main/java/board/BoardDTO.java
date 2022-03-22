package board;


import java.util.Date;

public class BoardDTO {
	
	
	private int boardIDX;
	private String menu;
	private String Loc;
	private String writer;
	private String content;
	private int totalNumber;
	private int curNumber;
	private int updateFlag;
	
	private String rateDate;
	private String rateTime;
	private String userID;
	
	//private Date reg_date;
	private Date reg_date;
	
	public int getBoardIDX() {
		return boardIDX;
	}
	public void setBoardIDX(int boardIDX) {
		this.boardIDX = boardIDX;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public String getLoc() {
		return Loc;
	}
	public void setLoc(String loc) {
		Loc = loc;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getTotalNumber() {
		return totalNumber;
	}
	public void setTotalNumber(int totalNumber) {
		this.totalNumber = totalNumber;
	}
	public int getUpdateFlag() {
		return updateFlag;
	}
	public void setUpdateFlag(int updateFlag) {
		this.updateFlag = updateFlag;
	}
	public String getRateTime() {
		return rateTime;
	}
	public void setRateTime(String rateTime) {
		this.rateTime = rateTime;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	public int getCurNumber() {
		return curNumber;
	}
	public void setCurNumber(int curNumber) {
		this.curNumber = curNumber;
	}
	public String getRateDate() {
		return rateDate;
	}
	public void setRateDate(String rateDate) {
		this.rateDate = rateDate;
	}
	
	
	

}
