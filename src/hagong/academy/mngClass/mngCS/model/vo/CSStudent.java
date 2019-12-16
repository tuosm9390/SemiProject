package hagong.academy.mngClass.mngCS.model.vo;

import java.sql.Date;

public class CSStudent implements java.io.Serializable{
	private int userNo;				//학생의유저번호
	private String stuName;
	private String userId;
	private String school;
	private int grade;
	private String gradeName;
	private int clsNo;				//강좌번호
	private String tchName;			//강사명 (member클래스와 조인)
	private String clsName;			//강좌명
	private String clsStudent;		//대상학생
	private String clsStudentName;  //대상학생명
	private int clsMax;				//수강 정원
	private Date clsStart;			//개강일
	private String clsDay;			//강의 요일
	private String clsTime;			//강의 시간
	private int clrNo;				//강의실
	private String className;		//강의실이름 (classroom과 조인)
	private int tuition;			//수업료
	private Date clsEnd;			//종강일
	
	public CSStudent() {}

	public CSStudent(int userNo, String stuName, String userId, String school, int grade, String gradeName, int clsNo,
			String tchName, String clsName, String clsStudent, String clsStudentName, int clsMax, Date clsStart,
			String clsDay, String clsTime, int clrNo, String className, int tuition, Date clsEnd) {
		super();
		this.userNo = userNo;
		this.stuName = stuName;
		this.userId = userId;
		this.school = school;
		this.grade = grade;
		this.gradeName = gradeName;
		this.clsNo = clsNo;
		this.tchName = tchName;
		this.clsName = clsName;
		this.clsStudent = clsStudent;
		this.clsStudentName = clsStudentName;
		this.clsMax = clsMax;
		this.clsStart = clsStart;
		this.clsDay = clsDay;
		this.clsTime = clsTime;
		this.clrNo = clrNo;
		this.className = className;
		this.tuition = tuition;
		this.clsEnd = clsEnd;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public int getClsNo() {
		return clsNo;
	}

	public void setClsNo(int clsNo) {
		this.clsNo = clsNo;
	}

	public String getTchName() {
		return tchName;
	}

	public void setTchName(String tchName) {
		this.tchName = tchName;
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

	public String getClsStudentName() {
		return clsStudentName;
	}

	public void setClsStudentName(String clsStudentName) {
		this.clsStudentName = clsStudentName;
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

	@Override
	public String toString() {
		return "CSStudent [userNo=" + userNo + ", stuName=" + stuName + ", userId=" + userId + ", school=" + school
				+ ", grade=" + grade + ", gradeName=" + gradeName + ", clsNo=" + clsNo + ", tchName=" + tchName
				+ ", clsName=" + clsName + ", clsStudent=" + clsStudent + ", clsStudentName=" + clsStudentName
				+ ", clsMax=" + clsMax + ", clsStart=" + clsStart + ", clsDay=" + clsDay + ", clsTime=" + clsTime
				+ ", clrNo=" + clrNo + ", className=" + className + ", tuition=" + tuition + ", clsEnd=" + clsEnd + "]";
	}
	
	
	
	
}
