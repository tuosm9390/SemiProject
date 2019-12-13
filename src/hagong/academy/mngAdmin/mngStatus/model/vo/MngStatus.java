package hagong.academy.mngAdmin.mngStatus.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class MngStatus implements java.io.Serializable{
	
	private int allStudent1;
	private int enrollDate1;
	private int leaveDate1;
	
	private int allStudent2;
	private int enrollDate2;
	private int leaveDate2;
	
	private int allStudent3;
	private int enrollDate3;
	private int leaveDate3;
	
	private int inFriend;
	private int inInternet;
	private int inPicket;
	private int inPcard;
	private int inEtc;
	
	private int cnt;
	
	private String tName;

	
	public MngStatus() {}
  

	public MngStatus(int allStudent1, int enrollDate1, int leaveDate1, int allStudent2, int enrollDate2, int leaveDate2,
			int allStudent3, int enrollDate3, int leaveDate3, int inFriend, int inInternet, int inPicket, int inPcard,
			int inEtc, int cnt, String tName) {
		super();
		this.allStudent1 = allStudent1;
		this.enrollDate1 = enrollDate1;
		this.leaveDate1 = leaveDate1;
		this.allStudent2 = allStudent2;
		this.enrollDate2 = enrollDate2;
		this.leaveDate2 = leaveDate2;
		this.allStudent3 = allStudent3;
		this.enrollDate3 = enrollDate3;
		this.leaveDate3 = leaveDate3;
		this.inFriend = inFriend;
		this.inInternet = inInternet;
		this.inPicket = inPicket;
		this.inPcard = inPcard;
		this.inEtc = inEtc;
		this.cnt = cnt;
		this.tName = tName;
	}

 
	public int getAllStudent1() {
		return allStudent1;
	}


	public void setAllStudent1(int allStudent1) {
		this.allStudent1 = allStudent1;
	}


	public int getEnrollDate1() {
		return enrollDate1;
	}


	public void setEnrollDate1(int enrollDate1) {
		this.enrollDate1 = enrollDate1;
	}


	public int getLeaveDate1() {
		return leaveDate1;
	}


	public void setLeaveDate1(int leaveDate1) {
		this.leaveDate1 = leaveDate1;
	}
 
	
	

	public int getAllStudent2() {
		return allStudent2;
	}
  

	public void setAllStudent2(int allStudent2) {
		this.allStudent2 = allStudent2;
	}
   

	public int getEnrollDate2() {
		return enrollDate2;
	}


	public void setEnrollDate2(int enrollDate2) {
		this.enrollDate2 = enrollDate2;
	}


	public int getLeaveDate2() {
		return leaveDate2;
	}


	public void setLeaveDate2(int leaveDate2) {
		this.leaveDate2 = leaveDate2;
	}


	public int getAllStudent3() {
		return allStudent3;
	}


	public void setAllStudent3(int allStudent3) {
		this.allStudent3 = allStudent3;
	}


	public int getEnrollDate3() {
		return enrollDate3;
	}


	public void setEnrollDate3(int enrollDate3) {
		this.enrollDate3 = enrollDate3;
	}


	public int getLeaveDate3() {
		return leaveDate3;
	}


	public void setLeaveDate3(int leaveDate3) {
		this.leaveDate3 = leaveDate3;
	}


	public int getInFriend() {
		return inFriend;
	}


	public void setInFriend(int inFriend) {
		this.inFriend = inFriend;
	}


	public int getInInternet() {
		return inInternet;
	}


	public void setInInternet(int inInternet) {
		this.inInternet = inInternet;
	}


	public int getInPicket() {
		return inPicket;
	}


	public void setInPicket(int inPicket) {
		this.inPicket = inPicket;
	}


	public int getInPcard() {
		return inPcard;
	}


	public void setInPcard(int inPcard) {
		this.inPcard = inPcard;
	}


	public int getInEtc() {
		return inEtc;
	}


	public void setInEtc(int inEtc) {
		this.inEtc = inEtc;
	}


	public int getCnt() {
		return cnt;
	}


	public void setCnt(int cnt) {
		this.cnt = cnt;
	}


	public String gettName() {
		return tName;
	}


	public void settName(String tName) {
		this.tName = tName;
	}


	@Override
	public String toString() {
		return "MngStatus [allStudent1=" + allStudent1 + ", enrollDate1=" + enrollDate1 + ", leaveDate1=" + leaveDate1
				+ ", allStudent2=" + allStudent2 + ", enrollDate2=" + enrollDate2 + ", leaveDate2=" + leaveDate2
				+ ", allStudent3=" + allStudent3 + ", enrollDate3=" + enrollDate3 + ", leaveDate3=" + leaveDate3
				+ ", inFriend=" + inFriend + ", inInternet=" + inInternet + ", inPicket=" + inPicket + ", inPcard="
				+ inPcard + ", inEtc=" + inEtc + ", cnt=" + cnt + ", tName=" + tName + "]";
	}

	
	
	

}
