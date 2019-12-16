package hagong.academy.commonMenu.info.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*@Data
@NoArgsConstructor
@AllArgsConstructor*/
public class UserDetail {
	
	private int userNo;
	private String userType;
	
	private String userId;
	private String userPwd;
	private String name;
	private Date birth;
	private String phone;
	private String dept;
	private String email;
	private String address;
	private String status;
	
	private int fileNo;
	private String fileType;
	private String originName;
	private String changeName;
	private String filePath;
	private String fileStatus;
	
	public UserDetail() {
		super();
	}
	
	public UserDetail(int userNo, String userType, String userId, String userPwd, String name, Date birth, String phone,
			String dept, String email, String address, String status, int fileNo, String fileType, String originName,
			String changeName, String filePath, String fileStatus) {
		super();
		this.userNo = userNo;
		this.userType = userType;
		this.userId = userId;
		this.userPwd = userPwd;
		this.name = name;
		this.birth = birth;
		this.phone = phone;
		this.dept = dept;
		this.email = email;
		this.address = address;
		this.status = status;
		this.fileNo = fileNo;
		this.fileType = fileType;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.fileStatus = fileStatus;
	}

	public final String getUserPwd() {
		return userPwd;
	}

	public final void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public final int getUserNo() {
		return userNo;
	}

	public final void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public final String getUserType() {
		return userType;
	}

	public final void setUserType(String userType) {
		this.userType = userType;
	}

	public final String getUserId() {
		return userId;
	}

	public final void setUserId(String userId) {
		this.userId = userId;
	}

	public final String getName() {
		return name;
	}

	public final void setName(String name) {
		this.name = name;
	}

	public final Date getBirth() {
		return birth;
	}

	public final void setBirth(Date birth) {
		this.birth = birth;
	}

	public final String getPhone() {
		return phone;
	}

	public final void setPhone(String phone) {
		this.phone = phone;
	}

	public final String getDept() {
		return dept;
	}

	public final void setDept(String dept) {
		this.dept = dept;
	}

	public final String getEmail() {
		return email;
	}

	public final void setEmail(String email) {
		this.email = email;
	}

	public final String getAddress() {
		return address;
	}

	public final void setAddress(String address) {
		this.address = address;
	}

	public final String getStatus() {
		return status;
	}

	public final void setStatus(String status) {
		this.status = status;
	}

	public final int getFileNo() {
		return fileNo;
	}

	public final void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public final String getFileType() {
		return fileType;
	}

	public final void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public final String getOriginName() {
		return originName;
	}

	public final void setOriginName(String originName) {
		this.originName = originName;
	}

	public final String getChangeName() {
		return changeName;
	}

	public final void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public final String getFilePath() {
		return filePath;
	}

	public final void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public final String getFileStatus() {
		return fileStatus;
	}

	public final void setFileStatus(String fileStatus) {
		this.fileStatus = fileStatus;
	}

	@Override
	public String toString() {
		return "UserDetail [userNo=" + userNo + ", userType=" + userType + ", userId=" + userId + ", userPwd=" + userPwd
				+ ", name=" + name + ", birth=" + birth + ", phone=" + phone + ", dept=" + dept + ", email=" + email
				+ ", address=" + address + ", status=" + status + ", fileNo=" + fileNo + ", fileType=" + fileType
				+ ", originName=" + originName + ", changeName=" + changeName + ", filePath=" + filePath
				+ ", fileStatus=" + fileStatus + ", getUserPwd()=" + getUserPwd() + ", getUserNo()=" + getUserNo()
				+ ", getUserType()=" + getUserType() + ", getUserId()=" + getUserId() + ", getName()=" + getName()
				+ ", getBirth()=" + getBirth() + ", getPhone()=" + getPhone() + ", getDept()=" + getDept()
				+ ", getEmail()=" + getEmail() + ", getAddress()=" + getAddress() + ", getStatus()=" + getStatus()
				+ ", getFileNo()=" + getFileNo() + ", getFileType()=" + getFileType() + ", getOriginName()="
				+ getOriginName() + ", getChangeName()=" + getChangeName() + ", getFilePath()=" + getFilePath()
				+ ", getFileStatus()=" + getFileStatus() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}

	
}