package hagong.academy.mngClass.mngAttend.model.vo;

public class Subject implements java.io.Serializable{
	private String subId;
	private String subName;
	
	public Subject() {}

	public Subject(String subId, String subName) {
		super();
		this.subId = subId;
		this.subName = subName; 
	}

	public String getSubId() {
		return subId;
	}

	public void setSubId(String subId) {
		this.subId = subId;
	}

	public String getSubName() {
		return subName;
	}

	public void setSubName(String subName) {
		this.subName = subName;
	}

	@Override
	public String toString() {
		return "Subject [subId=" + subId + ", subName=" + subName + "]";
	}	
	

}
