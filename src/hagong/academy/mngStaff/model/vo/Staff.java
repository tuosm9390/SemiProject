package hagong.academy.mngStaff.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Staff implements java.io.Serializable {
	
	private int staffLevel;
	
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
	private int fileNo;
	private String fileType;
	private Date docDate;
	
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private String fileStatus;
	
}
