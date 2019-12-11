package hagong.academy.mngAdmin.mngStatus.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*@Data
@AllArgsConstructor
@NoArgsConstructor*/

public class MngStatus implements java.io.Serializable{
	
	private int allStudent;
	private int enrollDate;
	private int leaveDate;
   
	
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
	
	public MngStatus() {};
	
	public MngStatus(int allStudent, int enrollDate, int leaveDate, int inFriend, int inInternet, int inPicket,
			int inPcard, int inEtc, int midKor, int midMath, int midEng, int midSocial, int midScience, int midForeign,
			int midEtc, int highKor, int highMath, int highEng, int highSocial, int highScience, int highForeign,
			int highEtc) {
		super();
		this.allStudent = allStudent;
		this.enrollDate = enrollDate;
		this.leaveDate = leaveDate;
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
	public int getAllStudent() {
		return allStudent;
	}
	public void setAllStudent(int allStudent) {
		this.allStudent = allStudent;
	}
	public int getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(int enrollDate) {
		this.enrollDate = enrollDate;
	}
	public int getLeaveDate() {
		return leaveDate;
	}
	public void setLeaveDate(int leaveDate) {
		this.leaveDate = leaveDate;
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
		return "MngStatus [allStudent=" + allStudent + ", enrollDate=" + enrollDate + ", leaveDate=" + leaveDate
				+ ", inFriend=" + inFriend + ", inInternet=" + inInternet + ", inPicket=" + inPicket + ", inPcard="
				+ inPcard + ", inEtc=" + inEtc + ", midKor=" + midKor + ", midMath=" + midMath + ", midEng=" + midEng
				+ ", midSocial=" + midSocial + ", midScience=" + midScience + ", midForeign=" + midForeign + ", midEtc="
				+ midEtc + ", highKor=" + highKor + ", highMath=" + highMath + ", highEng=" + highEng + ", highSocial="
				+ highSocial + ", highScience=" + highScience + ", highForeign=" + highForeign + ", highEtc=" + highEtc
				+ "]";
	}
	

	

}
