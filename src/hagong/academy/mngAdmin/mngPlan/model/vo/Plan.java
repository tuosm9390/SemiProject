package hagong.academy.mngAdmin.mngPlan.model.vo;

import java.sql.Date;

public class Plan implements java.io.Serializable{
	private int calNo;				//일정번호
	private int userNo;				//회원번호
	private String calTitle;		//일정제목
	private Date calStart;			//시작일시
	private Date calEnd;			//마감일시
	private String calType;			//일정분류
	private String calMemo;			//일정설명
	private String dateType;		//일정구분
	
	public Plan() {}

	public Plan(int calNo, int userNo, String calTitle, Date calStart, Date calEnd, String calType, String calMemo,
			String dateType) {
		super();
		this.calNo = calNo;
		this.userNo = userNo;
		this.calTitle = calTitle;
		this.calStart = calStart;
		this.calEnd = calEnd;
		this.calType = calType;
		this.calMemo = calMemo;
		this.dateType = dateType;
	}

	public int getCalNo() {
		return calNo;
	}

	public void setCalNo(int calNo) {
		this.calNo = calNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getCalTitle() {
		return calTitle;
	}

	public void setCalTitle(String calTitle) {
		this.calTitle = calTitle;
	}

	public Date getCalStart() {
		return calStart;
	}

	public void setCalStart(Date calStart) {
		this.calStart = calStart;
	}

	public Date getCalEnd() {
		return calEnd;
	}

	public void setCalEnd(Date calEnd) {
		this.calEnd = calEnd;
	}

	public String getCalType() {
		return calType;
	}

	public void setCalType(String calType) {
		this.calType = calType;
	}

	public String getCalMemo() {
		return calMemo;
	}

	public void setCalMemo(String calMemo) {
		this.calMemo = calMemo;
	}

	public String getDateType() {
		return dateType;
	}

	public void setDateType(String dateType) {
		this.dateType = dateType;
	}

	@Override
	public String toString() {
		return "Plan [calNo=" + calNo + ", userNo=" + userNo + ", calTitle=" + calTitle + ", calStart=" + calStart
				+ ", calEnd=" + calEnd + ", calType=" + calType + ", calMemo=" + calMemo + ", dateType=" + dateType
				+ "]";
	}
	
	
}
