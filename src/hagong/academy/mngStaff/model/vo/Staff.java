package hagong.academy.mngStaff.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor*/
public class Staff implements java.io.Serializable {
	
	private int userNo;
	private String name;
	private String userId;
	private String userPwd;
	private Date birth;
	private String phone;
	private String address;
	private String email;
	private Date enrollDate;
	private Date leaveDate;
	private String status;
	private String userType;
	
	private String dept; 
	
	
	public Staff() {
		super();
	}

	public Staff(int userNo, String name, String userId, String userPwd, Date birth, String phone, String address,
			String email, Date enrollDate, Date leaveDate, String status, String userType, String dept) {
		super();
		this.userNo = userNo;
		this.name = name;
		this.userId = userId;
		this.userPwd = userPwd;
		this.birth = birth;
		this.phone = phone;
		this.address = address;
		this.email = email;
		this.enrollDate = enrollDate;
		this.leaveDate = leaveDate;
		this.status = status;
		this.userType = userType;
		this.dept = dept;
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

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	@Override
	public String toString() {
		return "Staff [userNo=" + userNo + ", name=" + name + ", userId=" + userId + ", userPwd=" + userPwd + ", birth="
				+ birth + ", phone=" + phone + ", address=" + address + ", email=" + email + ", enrollDate="
				+ enrollDate + ", leaveDate=" + leaveDate + ", status=" + status + ", userType=" + userType + ", dept="
				+ dept + "]";
	}
	
}