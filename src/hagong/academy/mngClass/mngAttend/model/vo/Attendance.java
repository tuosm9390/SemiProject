package hagong.academy.mngClass.mngAttend.model.vo;

import java.sql.Date;

public class Attendance {
	private int clsNo;
	private Date attDate;
	private String attStatus;
	private String attDetail;
	private int userNo;
	
	public Attendance() {}

	public Attendance(int clsNo, Date attDate, String attStatus, String attDetail, int userNo) {
		super();
		this.clsNo = clsNo;
		this.attDate = attDate;
		this.attStatus = attStatus;
		this.attDetail = attDetail;
		this.userNo = userNo;
	}

	public int getClsNo() {
		return clsNo;
	}

	public void setClsNo(int clsNo) {
		this.clsNo = clsNo;
	}

	public Date getAttDate() {
		return attDate;
	}

	public void setAttDate(Date attDate) {
		this.attDate = attDate;
	}

	public String getAttStatus() {
		return attStatus;
	}

	public void setAttStatus(String attStatus) {
		this.attStatus = attStatus;
	}

	public String getAttDetail() {
		return attDetail;
	}

	public void setAttDetail(String attDetail) {
		this.attDetail = attDetail;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Attendance [clsNo=" + clsNo + ", attDate=" + attDate + ", attStatus=" + attStatus + ", attDetail="
				+ attDetail + ", userNo=" + userNo + "]";
	}
	
	

}
