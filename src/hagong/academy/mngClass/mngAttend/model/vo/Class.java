package hagong.academy.mngClass.mngAttend.model.vo;

import java.sql.Date;

public class Class {
	private int clsNo;
	private String subId;
	private int userNo;
	private String clsName;
	private String clsStudent;
	private int clsMax;
	private Date clsStart;
	private String clsDay;
	private String clsTime;
	private int clrNo;
	private int tuition;
	private Date clsEnd;
	
	public Class() {}

	public Class(int clsNo, String subId, int userNo, String clsName, String clsStudent, int clsMax, Date clsStart,
			String clsDay, String clsTime, int clrNo, int tuition, Date clsEnd) {
		super();
		this.clsNo = clsNo;
		this.subId = subId;
		this.userNo = userNo;
		this.clsName = clsName;
		this.clsStudent = clsStudent;
		this.clsMax = clsMax;
		this.clsStart = clsStart;
		this.clsDay = clsDay;
		this.clsTime = clsTime;
		this.clrNo = clrNo;
		this.tuition = tuition;
		this.clsEnd = clsEnd;
	}

	public int getClsNo() {
		return clsNo;
	}

	public void setClsNo(int clsNo) {
		this.clsNo = clsNo;
	}

	public String getSubId() {
		return subId;
	}

	public void setSubId(String subId) {
		this.subId = subId;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getClsName() {
		return clsName;
	}

	public void setClsName(String clsName) {
		this.clsName = clsName;
	}

	public String getClsStudent() {
		return clsStudent;
	}

	public void setClsStudent(String clsStudent) {
		this.clsStudent = clsStudent;
	}

	public int getClsMax() {
		return clsMax;
	}

	public void setClsMax(int clsMax) {
		this.clsMax = clsMax;
	}

	public Date getClsStart() {
		return clsStart;
	}

	public void setClsStart(Date clsStart) {
		this.clsStart = clsStart;
	}

	public String getClsDay() {
		return clsDay;
	}

	public void setClsDay(String clsDay) {
		this.clsDay = clsDay;
	}

	public String getClsTime() {
		return clsTime;
	}

	public void setClsTime(String clsTime) {
		this.clsTime = clsTime;
	}

	public int getClrNo() {
		return clrNo;
	}

	public void setClrNo(int clrNo) {
		this.clrNo = clrNo;
	}

	public int getTuition() {
		return tuition;
	}

	public void setTuition(int tuition) {
		this.tuition = tuition;
	}

	public Date getClsEnd() {
		return clsEnd;
	}

	public void setClsEnd(Date clsEnd) {
		this.clsEnd = clsEnd;
	}

	@Override
	public String toString() {
		return "Class [clsNo=" + clsNo + ", subId=" + subId + ", userNo=" + userNo + ", clsName=" + clsName
				+ ", clsStudent=" + clsStudent + ", clsMax=" + clsMax + ", clsStart=" + clsStart + ", clsDay=" + clsDay
				+ ", clsTime=" + clsTime + ", clrNo=" + clrNo + ", tuition=" + tuition + ", clsEnd=" + clsEnd + "]";
	}
	
	
}
