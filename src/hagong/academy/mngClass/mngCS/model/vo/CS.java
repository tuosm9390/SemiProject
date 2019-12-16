package hagong.academy.mngClass.mngCS.model.vo;

import java.sql.Date;

public class CS {
	private int clsNo;				//강좌번호
	private int userNo;				//담당 강사
	private String name;			//강사명 (member클래스와 조인)
	private String clsName;			//강좌명
	private String clsStudent;		//대상학생
	private int clsMax;				//수강 정원
	private Date clsStart;			//개강일
	private String clsDay;			//강의 요일
	private String clsTime;			//강의 시간
	private int clrNo;				//강의실
	private String className;		//강의실이름 (classroom과 조인)
	private int tuition;			//수업료
	private Date clsEnd;			//종강일
	private int rnum;				//인덱스번호
	
	public CS() {}

	public CS(int clsNo, int userNo, String name, String clsName, String clsStudent, int clsMax, Date clsStart,
			String clsDay, String clsTime, int clrNo, String className, int tuition, Date clsEnd, int rnum) {
		super();
		this.clsNo = clsNo;
		this.userNo = userNo;
		this.name = name;
		this.clsName = clsName;
		this.clsStudent = clsStudent;
		this.clsMax = clsMax;
		this.clsStart = clsStart;
		this.clsDay = clsDay;
		this.clsTime = clsTime;
		this.clrNo = clrNo;
		this.className = className;
		this.tuition = tuition;
		this.clsEnd = clsEnd;
		this.rnum = rnum;
	}

	public int getClsNo() {
		return clsNo;
	}

	public void setClsNo(int clsNo) {
		this.clsNo = clsNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
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

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	@Override
	public String toString() {
		return "CS [clsNo=" + clsNo + ", userNo=" + userNo + ", name=" + name + ", clsName=" + clsName + ", clsStudent="
				+ clsStudent + ", clsMax=" + clsMax + ", clsStart=" + clsStart + ", clsDay=" + clsDay + ", clsTime="
				+ clsTime + ", clrNo=" + clrNo + ", className=" + className + ", tuition=" + tuition + ", clsEnd="
				+ clsEnd + ", rnum=" + rnum + "]";
	}
	
	
	
}
