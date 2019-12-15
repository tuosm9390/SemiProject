package hagong.academy.mngClass.mngClassList.model.vo;

import java.sql.Date;

public class Class implements java.io.Serializable{
	private int clsNo;				//강좌번호
	private String subId;			//과목ID
	private int userNo;				//담당 강사
	private String clsName;			//강좌명
	private String clsStudent;		//대상학생
	private int clsMax;				//수강 정원
	private Date clsStart;			//개강일
	private String clsDay;			//강의 요일
	private String clsTime;			//강의 시간
	private int clrNo;				//강의실
	private int tuition;			//수업료
	private Date clsEnd;			//종강일
	
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
