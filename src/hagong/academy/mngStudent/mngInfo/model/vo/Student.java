package hagong.academy.mngStudent.mngInfo.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Student {
	private int scoreNo;
	// 멤버 테이블
	private int userNo; // 회원번호
	private String name; // 이름
	private String userId; // 아이디
	private String userPwd; // 비밀번호
	private Date birth; // 생년월일
	private String phone; // 전화번호
	private String address; // 주소
	private String email; // 이메일
	private String status; // 재원여부
	private String inflowPath; // 유입경로
	private String userType; // 회원구분
	private int age; // 나이

	// 학생 테이블
	private String school; // 학교
	private int grade; // 학년
	private String track; // 계열
	private String college; // 희망대학
	private String major; // 희망학과

	// 학부모 테이블
	private int refUno; // 학부모 회원번호
	private String refName; // 학부모 이름
	private String refId; // 학부모 아이디
	private String refPhone; // 학부모 전화번호

	// 성적 테이블
	private String scoType; // 성적구분
	private int year; // 년도
	private int term; // 학기
	private String subName; // 과목명
	private int subscore; // 과목점수

	public Student() {
	}

	public Student(int scoreNo, int userNo, String name, String userId, String userPwd, Date birth, String phone,
			String address, String email, String status, String inflowPath, String userType, int age, String school,
			int grade, String track, String college, String major, int refUno, String refName, String refId,
			String refPhone, String scoType, int year, int term, String subName, int subscore) {
		super();
		this.scoreNo = scoreNo;
		this.userNo = userNo;
		this.name = name;
		this.userId = userId;
		this.userPwd = userPwd;
		this.birth = birth;
		this.phone = phone;
		this.address = address;
		this.email = email;
		this.status = status;
		this.inflowPath = inflowPath;
		this.userType = userType;
		this.age = age;
		this.school = school;
		this.grade = grade;
		this.track = track;
		this.college = college;
		this.major = major;
		this.refUno = refUno;
		this.refName = refName;
		this.refId = refId;
		this.refPhone = refPhone;
		this.scoType = scoType;
		this.year = year;
		this.term = term;
		this.subName = subName;
		this.subscore = subscore;
	}

	public int getScoreNo() {
		return scoreNo;
	}

	public void setScoreNo(int scoreNo) {
		this.scoreNo = scoreNo;
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getInflowPath() {
		return inflowPath;
	}

	public void setInflowPath(String inflowPath) {
		this.inflowPath = inflowPath;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
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

	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public int getRefUno() {
		return refUno;
	}

	public void setRefUno(int refUno) {
		this.refUno = refUno;
	}

	public String getRefName() {
		return refName;
	}

	public void setRefName(String refName) {
		this.refName = refName;
	}

	public String getRefId() {
		return refId;
	}

	public void setRefId(String refId) {
		this.refId = refId;
	}

	public String getRefPhone() {
		return refPhone;
	}

	public void setRefPhone(String refPhone) {
		this.refPhone = refPhone;
	}

	public String getScoType() {
		return scoType;
	}

	public void setScoType(String scoType) {
		this.scoType = scoType;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getTerm() {
		return term;
	}

	public void setTerm(int term) {
		this.term = term;
	}

	public String getSubName() {
		return subName;
	}

	public void setSubName(String subName) {
		this.subName = subName;
	}

	public int getSubscore() {
		return subscore;
	}

	public void setSubscore(int subscore) {
		this.subscore = subscore;
	}

	@Override
	public String toString() {
		return "Student [scoreNo=" + scoreNo + ", userNo=" + userNo + ", name=" + name + ", userId=" + userId
				+ ", userPwd=" + userPwd + ", birth=" + birth + ", phone=" + phone + ", address=" + address + ", email="
				+ email + ", status=" + status + ", inflowPath=" + inflowPath + ", userType=" + userType + ", age="
				+ age + ", school=" + school + ", grade=" + grade + ", track=" + track + ", college=" + college
				+ ", major=" + major + ", refUno=" + refUno + ", refName=" + refName + ", refId=" + refId
				+ ", refPhone=" + refPhone + ", scoType=" + scoType + ", year=" + year + ", term=" + term + ", subName="
				+ subName + ", subscore=" + subscore + "]";
	}

}
