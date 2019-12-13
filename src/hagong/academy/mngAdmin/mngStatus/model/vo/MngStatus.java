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
	
	private int t1;
	private int t2;
	private int t3;
	private int l1;
	private int l2;
	private int l3;
	
	private String tName1;
	private String tName2;
	private String tName3;
	private String tName4;
	private String tName5;
	private String tName6;
	
	public MngStatus() {}

	
	public MngStatus(int allStudent1, int enrollDate1, int leaveDate1, int allStudent2, int enrollDate2, int leaveDate2,
			int allStudent3, int enrollDate3, int leaveDate3, int inFriend, int inInternet, int inPicket, int inPcard,
			int inEtc, int t1, int t2, int t3, int l1, int l2, int l3, String tName1, String tName2, String tName3,
			String tName4, String tName5, String tName6) {
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
		this.t1 = t1;
		this.t2 = t2;
		this.t3 = t3;
		this.l1 = l1;
		this.l2 = l2;
		this.l3 = l3;
		this.tName1 = tName1;
		this.tName2 = tName2;
		this.tName3 = tName3;
		this.tName4 = tName4;
		this.tName5 = tName5;
		this.tName6 = tName6;
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

	public int getT1() {
		return t1;
	}

	public void setT1(int t1) {
		this.t1 = t1;
	}

	public int getT2() {
		return t2;
	}

	public void setT2(int t2) {
		this.t2 = t2;
	}

	public int getT3() {
		return t3;
	}

	public void setT3(int t3) {
		this.t3 = t3;
	}

	public int getL1() {
		return l1;
	}

	public void setL1(int l1) {
		this.l1 = l1;
	}

	public int getL2() {
		return l2;
	}

	public void setL2(int l2) {
		this.l2 = l2;
	}

	public int getL3() {
		return l3;
	}

	public void setL3(int l3) {
		this.l3 = l3;
	}

	public String gettName1() {
		return tName1;
	}

	public void settName1(String tName1) {
		this.tName1 = tName1;
	}

	public String gettName2() {
		return tName2;
	}

	public void settName2(String tName2) {
		this.tName2 = tName2;
	}

	public String gettName3() {
		return tName3;
	}

	public void settName3(String tName3) {
		this.tName3 = tName3;
	}

	public String gettName4() {
		return tName4;
	}

	public void settName4(String tName4) {
		this.tName4 = tName4;
	}

	public String gettName5() {
		return tName5;
	}

	public void settName5(String tName5) {
		this.tName5 = tName5;
	}

	public String gettName6() {
		return tName6;
	}

	public void settName6(String tName6) {
		this.tName6 = tName6;
	}

	@Override
	public String toString() {
		return "MngStatus [allStudent1=" + allStudent1 + ", enrollDate1=" + enrollDate1 + ", leaveDate1=" + leaveDate1
				+ ", allStudent2=" + allStudent2 + ", enrollDate2=" + enrollDate2 + ", leaveDate2=" + leaveDate2
				+ ", allStudent3=" + allStudent3 + ", enrollDate3=" + enrollDate3 + ", leaveDate3=" + leaveDate3
				+ ", inFriend=" + inFriend + ", inInternet=" + inInternet + ", inPicket=" + inPicket + ", inPcard="
				+ inPcard + ", inEtc=" + inEtc + ", t1=" + t1 + ", t2=" + t2 + ", t3=" + t3 + ", l1=" + l1 + ", l2="
				+ l2 + ", l3=" + l3 + ", tName1=" + tName1 + ", tName2=" + tName2 + ", tName3=" + tName3 + ", tName4="
				+ tName4 + ", tName5=" + tName5 + ", tName6=" + tName6 + "]";
	}

	

}
