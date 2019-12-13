package hagong.academy.mngStudent.mngBlack.model.vo;

public class BlacklistInfo {
	private int rnum;
	private String name;
	private String userId;
	private String school;
	private int grade;
	private String gradeName;
	private String phone;
	private int userNo;
	
	public BlacklistInfo() {}

	public BlacklistInfo(int rnum, String name, String userId, String school, int grade, String gradeName, String phone,
			int userNo) {
		super();
		this.rnum = rnum;
		this.name = name;
		this.userId = userId;
		this.school = school;
		this.grade = grade;
		this.gradeName = gradeName;
		this.phone = phone;
		this.userNo = userNo;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "BlacklistInfo [rnum=" + rnum + ", name=" + name + ", userId=" + userId + ", school=" + school
				+ ", grade=" + grade + ", gradeName=" + gradeName + ", phone=" + phone + ", userNo=" + userNo + "]";
	}
	
	
}
