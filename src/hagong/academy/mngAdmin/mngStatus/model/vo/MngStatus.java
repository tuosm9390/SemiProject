package hagong.academy.mngAdmin.mngStatus.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*@Data
@AllArgsConstructor
@NoArgsConstructor*/

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
	
	private int midKor;
	private int midMath;
	private int midEng;
	private int midSocial;
	private int midScience;
	private int midForeign;
	private int midEtc;
	
	private int highKor;
	private int highMath;
	private int highEng;
	private int highSocial;
	private int highScience;
	private int highForeign;
	private int highEtc;
	
	public MngStatus() {}

	public MngStatus(int allStudent1, int enrollDate1, int leaveDate1, int allStudent2, int enrollDate2, int leaveDate2,
			int allStudent3, int enrollDate3, int leaveDate3, int inFriend, int inInternet, int inPicket, int inPcard,
			int inEtc, int midKor, int midMath, int midEng, int midSocial, int midScience, int midForeign, int midEtc,
			int highKor, int highMath, int highEng, int highSocial, int highScience, int highForeign, int highEtc) {
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
		this.midKor = midKor;
		this.midMath = midMath;
		this.midEng = midEng;
		this.midSocial = midSocial;
		this.midScience = midScience;
		this.midForeign = midForeign;
		this.midEtc = midEtc;
		this.highKor = highKor;
		this.highMath = highMath;
		this.highEng = highEng;
		this.highSocial = highSocial;
		this.highScience = highScience;
		this.highForeign = highForeign;
		this.highEtc = highEtc;
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

	public int getMidKor() {
		return midKor;
	}

	public void setMidKor(int midKor) {
		this.midKor = midKor;
	}

	public int getMidMath() {
		return midMath;
	}

	public void setMidMath(int midMath) {
		this.midMath = midMath;
	}

	public int getMidEng() {
		return midEng;
	}

	public void setMidEng(int midEng) {
		this.midEng = midEng;
	}

	public int getMidSocial() {
		return midSocial;
	}

	public void setMidSocial(int midSocial) {
		this.midSocial = midSocial;
	}

	public int getMidScience() {
		return midScience;
	}

	public void setMidScience(int midScience) {
		this.midScience = midScience;
	}

	public int getMidForeign() {
		return midForeign;
	}

	public void setMidForeign(int midForeign) {
		this.midForeign = midForeign;
	}

	public int getMidEtc() {
		return midEtc;
	}

	public void setMidEtc(int midEtc) {
		this.midEtc = midEtc;
	}

	public int getHighKor() {
		return highKor;
	}

	public void setHighKor(int highKor) {
		this.highKor = highKor;
	}

	public int getHighMath() {
		return highMath;
	}

	public void setHighMath(int highMath) {
		this.highMath = highMath;
	}

	public int getHighEng() {
		return highEng;
	}

	public void setHighEng(int highEng) {
		this.highEng = highEng;
	}

	public int getHighSocial() {
		return highSocial;
	}

	public void setHighSocial(int highSocial) {
		this.highSocial = highSocial;
	}

	public int getHighScience() {
		return highScience;
	}

	public void setHighScience(int highScience) {
		this.highScience = highScience;
	}

	public int getHighForeign() {
		return highForeign;
	}

	public void setHighForeign(int highForeign) {
		this.highForeign = highForeign;
	}

	public int getHighEtc() {
		return highEtc;
	}

	public void setHighEtc(int highEtc) {
		this.highEtc = highEtc;
	}

	@Override
	public String toString() {
		return "MngStatus [allStudent1=" + allStudent1 + ", enrollDate1=" + enrollDate1 + ", leaveDate1=" + leaveDate1
				+ ", allStudent2=" + allStudent2 + ", enrollDate2=" + enrollDate2 + ", leaveDate2=" + leaveDate2
				+ ", allStudent3=" + allStudent3 + ", enrollDate3=" + enrollDate3 + ", leaveDate3=" + leaveDate3
				+ ", inFriend=" + inFriend + ", inInternet=" + inInternet + ", inPicket=" + inPicket + ", inPcard="
				+ inPcard + ", inEtc=" + inEtc + ", midKor=" + midKor + ", midMath=" + midMath + ", midEng=" + midEng
				+ ", midSocial=" + midSocial + ", midScience=" + midScience + ", midForeign=" + midForeign + ", midEtc="
				+ midEtc + ", highKor=" + highKor + ", highMath=" + highMath + ", highEng=" + highEng + ", highSocial="
				+ highSocial + ", highScience=" + highScience + ", highForeign=" + highForeign + ", highEtc=" + highEtc
				+ "]";
	};
	

}
