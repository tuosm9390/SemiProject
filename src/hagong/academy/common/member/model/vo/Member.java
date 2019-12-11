package hagong.academy.common.member.model.vo;

import java.sql.Date;

/*import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor*/
public class Member {
	private int userNo;				//회원번호
	private String name;			//이름
	private String userId;			//아이디
	private String userPwd;			//비밀번호
	private Date birth;				//생년월일
	private String phone;			//전화번호
	private String address;			//주소
	private String email;			//이메일
	private int refUno;				//학부모 회원번호
	private Date enrollDate;		//등록일자
	private Date leaveDate;			//탈퇴일자
	private String status;			//재원여부
	private String inflowPath;		//유입경로
	private String userType;		//회원구분
	
	
	public Member() {}
	
	public Member(int userNo, String name, String userId, String userPwd, Date birth, String phone, String address,
			String email, int refUno, Date enrollDate, Date leaveDate, String status, String inflowPath,
			String userType) {
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

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", name=" + name + ", userId=" + userId + ", userPwd=" + userPwd
				+ ", birth=" + birth + ", phone=" + phone + ", address=" + address + ", email=" + email + ", refUno="
				+ refUno + ", enrollDate=" + enrollDate + ", leaveDate=" + leaveDate + ", status=" + status
				+ ", inflowPath=" + inflowPath + ", userType=" + userType + "]";
	}
	
	
	
	
}
