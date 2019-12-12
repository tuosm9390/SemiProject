package hagong.academy.mngStudent.mngInfo.model.vo;

import java.sql.Date;

public class StudentProfile {
	private int userNo;
	private int fileNo;
	private String fileType;
	private Date docDate;

	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private String fileStatus;

	public StudentProfile() {
	}

	public StudentProfile(int userNo, int fileNo, String fileType, Date docDate, String originName, String changeName,
			String filePath, Date uploadDate, String fileStatus) {
		super();
		this.userNo = userNo;
		this.fileNo = fileNo;
		this.fileType = fileType;
		this.docDate = docDate;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fileStatus = fileStatus;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
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

	public Date getDocDate() {
		return docDate;
	}

	public void setDocDate(Date docDate) {
		this.docDate = docDate;
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

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getFileStatus() {
		return fileStatus;
	}

	public void setFileStatus(String fileStatus) {
		this.fileStatus = fileStatus;
	}

	@Override
	public String toString() {
		return "StudentProfile [userNo=" + userNo + ", fileNo=" + fileNo + ", fileType=" + fileType + ", docDate="
				+ docDate + ", originName=" + originName + ", changeName=" + changeName + ", filePath=" + filePath
				+ ", uploadDate=" + uploadDate + ", fileStatus=" + fileStatus + "]";
	}

}
