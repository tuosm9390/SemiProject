package hagong.academy.mngStudent.mngCouns.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*@Data
@AllArgsConstructor
@NoArgsConstructor*/
public class MemberCouns {
	private int couNo;
	private String couTitle;
	private Date couDate;
	private int couUserNo;
	private String couType;
	private String couContent;
	private String couAction;
	private String couBlack;
	private int userNo;
	private String userName;
	private String couUserName;
	private String userId;
	private int count = 0;
	
	public MemberCouns() {}

	public MemberCouns(int couNo, String couTitle, Date couDate, int couUserNo, String couType, String couContent,
			String couAction, String couBlack, int userNo, String userName, String userId, int count, String couUserName) {
		super();
		this.couNo = couNo;
		this.couTitle = couTitle;
		this.couDate = couDate;
		this.couUserNo = couUserNo;
		this.couType = couType;
		this.couContent = couContent;
		this.couAction = couAction;
		this.couBlack = couBlack;
		this.userNo = userNo;
		this.userName = userName;
		this.userId = userId;
		this.count = count;
		this.couUserName = couUserName;
	}

	public int getCouNo() {
		return couNo;
	}

	public void setCouNo(int couNo) {
		this.couNo = couNo;
	}

	public String getCouTitle() {
		return couTitle;
	}

	public void setCouTitle(String couTitle) {
		this.couTitle = couTitle;
	}

	public Date getCouDate() {
		return couDate;
	}

	public void setCouDate(Date couDate) {
		this.couDate = couDate;
	}

	public int getCouUserNo() {
		return couUserNo;
	}

	public void setCouUserNo(int couUserNo) {
		this.couUserNo = couUserNo;
	}

	public String getCouType() {
		return couType;
	}

	public void setCouType(String couType) {
		this.couType = couType;
	}

	public String getCouContent() {
		return couContent;
	}

	public void setCouContent(String couContent) {
		this.couContent = couContent;
	}

	public String getCouAction() {
		return couAction;
	}

	public void setCouAction(String couAction) {
		this.couAction = couAction;
	}

	public String getCouBlack() {
		return couBlack;
	}

	public void setCouBlack(String couBlack) {
		this.couBlack = couBlack;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getCouUserName() {
		return couUserName;
	}

	public void setCouUserName(String couUserName) {
		this.couUserName = couUserName;
	}

	@Override
	public String toString() {
		return "MemberCouns [couNo=" + couNo + ", couTitle=" + couTitle + ", couDate=" + couDate + ", couUserNo="
				+ couUserNo + ", couType=" + couType + ", couContent=" + couContent + ", couAction=" + couAction
				+ ", couBlack=" + couBlack + ", userNo=" + userNo + ", userName=" + userName + ", couUserName="
				+ couUserName + ", userId=" + userId + ", count=" + count + "]";
	}
	
	
	
	


	
	
	
}
