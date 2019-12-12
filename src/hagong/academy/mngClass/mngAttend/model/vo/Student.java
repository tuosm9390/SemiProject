package hagong.academy.mngClass.mngAttend.model.vo;

public class Student {
	private String school;
	private int grade;
	private String track;
	private int userNo;
	
	public Student() {}

	public Student(String school, int grade, String track, int userNo) {
		super();
		this.school = school;
		this.grade = grade;
		this.track = track;
		this.userNo = userNo;
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

	public String getTrack() {
		return track;
	}

	public void setTrack(String track) {
		this.track = track;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Student [school=" + school + ", grade=" + grade + ", track=" + track + ", userNo=" + userNo + "]";
	}
	
	
}
