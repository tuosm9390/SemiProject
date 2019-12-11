package hagong.academy.mngStudent.mngInfo.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Student{
	// 멤버 테이블
	private int userNo; // 회원번호
	private String name; // 이름
	private String userId; // 아이디
	private String userPwd; // 비밀번호
	private String birth; // 생년월일
	private String phone; // 전화번호
	private String address; // 주소
	private String email; // 이메일
	private int refUno; // 학부모 회원번호
	private Date enrollDate; // 등록일자
	private Date leaveDate; // 탈퇴일자
	private String status; // 재원여부
	private String inflowPath; // 유입경로
	private String userType; // 회원구분

	// 학생 테이블
	private String school; // 학교
	private int grade; // 학년
	private String track; // 계열
	private String college; // 희망대학
	private String major; // 희망학과

	// 학부모 테이블
	private String refName; // 학부모 이름
	private String refId; // 학부모 아이디
	private String refPhone; // 학부모 전화번호

	public Student() {
	}

	public Student(int userNo, String name, String userId, String userPwd, String birth, String phone, String address,
			String email, int refUno, Date enrollDate, Date leaveDate, String status, String inflowPath,
			String userType, String school, int grade, String track, String college, String major, String refName,
			String refId, String refPhone) {
		super();
		this.userNo = userNo;
		this.name = name;
		this.userId = userId;
		this.userPwd = userPwd;
		this.birth = birth;
		this.phone = phone;
		this.address = address;
		this.email = email;
		this.refUno = refUno;
		this.enrollDate = enrollDate;
		this.leaveDate = leaveDate;
		this.status = status;
		this.inflowPath = inflowPath;
		this.userType = userType;
		this.school = school;
		this.grade = grade;
		this.track = track;
		this.college = college;
		this.major = major;
		this.refName = refName;
		this.refId = refId;
		this.refPhone = refPhone;
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

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
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

	public int getRefUno() {
		return refUno;
	}

	public void setRefUno(int refUno) {
		this.refUno = refUno;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getLeaveDate() {
		return leaveDate;
	}

	public void setLeaveDate(Date leaveDate) {
		this.leaveDate = leaveDate;
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

	@Override
	public String toString() {
		return "Student [userNo=" + userNo + ", name=" + name + ", userId=" + userId + ", userPwd=" + userPwd
				+ ", birth=" + birth + ", phone=" + phone + ", address=" + address + ", email=" + email + ", refUno="
				+ refUno + ", enrollDate=" + enrollDate + ", leaveDate=" + leaveDate + ", status=" + status
				+ ", inflowPath=" + inflowPath + ", userType=" + userType + ", school=" + school + ", grade=" + grade
				+ ", track=" + track + ", college=" + college + ", major=" + major + ", refName=" + refName + ", refId="
				+ refId + ", refPhone=" + refPhone + "]";
	}

}
