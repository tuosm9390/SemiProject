package hagong.academy.mngStaff.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*@Data
@NoArgsConstructor
@AllArgsConstructor*/
public class StaffDetail {
	
	private int userNo;
	private String userType;
	
	private String userId;
	private String name;
	private Date birth;
	private int age;
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
	
	public StaffDetail() {
		super();
	}

	public StaffDetail(int userNo, String userType, String userId, String name, Date birth, int age, String phone,
			String dept, String email, String address, String status, int fileNo, String fileType, String originName,
			String changeName, String filePath, String fileStatus) {
		super();
		this.userNo = userNo;
		this.userType = userType;
		this.userId = userId;
		this.name = name;
		this.birth = birth;
		this.age = age;
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

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileStatus() {
		return fileStatus;
	}

	public void setFileStatus(String fileStatus) {
		this.fileStatus = fileStatus;
	}

	@Override
	public String toString() {
		return "StaffDetail [userNo=" + userNo + ", userType=" + userType + ", userId=" + userId + ", name=" + name
				+ ", birth=" + birth + ", age=" + age + ", phone=" + phone + ", dept=" + dept + ", email=" + email
				+ ", address=" + address + ", status=" + status + ", fileNo=" + fileNo + ", fileType=" + fileType
				+ ", originName=" + originName + ", changeName=" + changeName + ", filePath=" + filePath
				+ ", fileStatus=" + fileStatus + "]";
	}
	
}
