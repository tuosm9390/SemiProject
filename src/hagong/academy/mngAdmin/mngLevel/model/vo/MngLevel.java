package hagong.academy.mngAdmin.mngLevel.model.vo;

import java.sql.Date;

public class MngLevel implements java.io.Serializable{
	
	private int modifyInfo1; 
	private int modifyInfo2;
	private int modifyInfo3;
	private int info1; 
	private int info2; 
	private int info3; 
	private int purchase1; 
	private int purchase2; 
	private int purchase3; 
	private int counseling1; 
	private int counseling2;
	private int counseling3;
	private int black1;
	private int black2;
	private int black3 ;
	private int staff1 ;
	private int staff2 ;
	private int staff3 ;
	private int enroll1;
	private int enroll2 ;
	private int enroll3 ;
	private int attend1;
	private int attend2 ;
	private int attend3 ;
	private int class1 ;
	private int class2 ;
	private int class3 ;
	private int satisfy1;
	private int satisfy2 ;
	private int satisfy3 ;
	private int condition1; 
	private int condition2 ;
	private int condition3 ;
	private int menu1 ;
	private int menu2 ;
	private int menu3 ;
	private int plan1 ;
	private int plan2;
	private int plan3 ;
	private int pAtt ;
	private int sAtt ;
	private int pScore; 
	private int sScore ;
	private int pSatisfy; 
	private int sSatisfy ;
	private int pReceipt ;
	private int sReceipt ;
	private String ppScore;
	private String ssScore;
	private String ppAtt;
	private String ssAtt;
	private String ppSatisfy;
	private String ssSatisfy;
	private String ppReceipt;
	private String ssReceipt;
	 
	public MngLevel() {}

	public MngLevel(int modifyInfo1, int modifyInfo2, int modifyInfo3, int info1, int info2, int info3, int purchase1,
			int purchase2, int purchase3, int counseling1, int counseling2, int counseling3, int black1, int black2,
			int black3, int staff1, int staff2, int staff3, int enroll1, int enroll2, int enroll3, int attend1,
			int attend2, int attend3, int class1, int class2, int class3, int satisfy1, int satisfy2, int satisfy3,
			int condition1, int condition2, int condition3, int menu1, int menu2, int menu3, int plan1, int plan2,
			int plan3, int pAtt, int sAtt, int pScore, int sScore, int pSatisfy, int sSatisfy, int pReceipt,
			int sReceipt, String ppScore, String ssScore, String ppAtt, String ssAtt, String ppSatisfy,
			String ssSatisfy, String ppReceipt, String ssReceipt) {
		super();
		this.modifyInfo1 = modifyInfo1;
		this.modifyInfo2 = modifyInfo2;
		this.modifyInfo3 = modifyInfo3;
		this.info1 = info1;
		this.info2 = info2;
		this.info3 = info3;
		this.purchase1 = purchase1;
		this.purchase2 = purchase2;
		this.purchase3 = purchase3;
		this.counseling1 = counseling1;
		this.counseling2 = counseling2;
		this.counseling3 = counseling3;
		this.black1 = black1;
		this.black2 = black2;
		this.black3 = black3;
		this.staff1 = staff1;
		this.staff2 = staff2;
		this.staff3 = staff3;
		this.enroll1 = enroll1;
		this.enroll2 = enroll2;
		this.enroll3 = enroll3;
		this.attend1 = attend1;
		this.attend2 = attend2;
		this.attend3 = attend3;
		this.class1 = class1;
		this.class2 = class2;
		this.class3 = class3;
		this.satisfy1 = satisfy1;
		this.satisfy2 = satisfy2;
		this.satisfy3 = satisfy3;
		this.condition1 = condition1;
		this.condition2 = condition2;
		this.condition3 = condition3;
		this.menu1 = menu1;
		this.menu2 = menu2;
		this.menu3 = menu3;
		this.plan1 = plan1;
		this.plan2 = plan2;
		this.plan3 = plan3;
		this.pAtt = pAtt;
		this.sAtt = sAtt;
		this.pScore = pScore;
		this.sScore = sScore;
		this.pSatisfy = pSatisfy;
		this.sSatisfy = sSatisfy;
		this.pReceipt = pReceipt;
		this.sReceipt = sReceipt;
		this.ppScore = ppScore;
		this.ssScore = ssScore;
		this.ppAtt = ppAtt;
		this.ssAtt = ssAtt;
		this.ppSatisfy = ppSatisfy;
		this.ssSatisfy = ssSatisfy;
		this.ppReceipt = ppReceipt;
		this.ssReceipt = ssReceipt;
	}

	public int getModifyInfo1() {
		return modifyInfo1;
	}

	public void setModifyInfo1(int modifyInfo1) {
		this.modifyInfo1 = modifyInfo1;
	}

	public int getModifyInfo2() {
		return modifyInfo2;
	}

	public void setModifyInfo2(int modifyInfo2) {
		this.modifyInfo2 = modifyInfo2;
	}

	public int getModifyInfo3() {
		return modifyInfo3;
	}

	public void setModifyInfo3(int modifyInfo3) {
		this.modifyInfo3 = modifyInfo3;
	}

	public int getInfo1() {
		return info1;
	}

	public void setInfo1(int info1) {
		this.info1 = info1;
	}

	public int getInfo2() {
		return info2;
	}

	public void setInfo2(int info2) {
		this.info2 = info2;
	}

	public int getInfo3() {
		return info3;
	}

	public void setInfo3(int info3) {
		this.info3 = info3;
	}

	public int getPurchase1() {
		return purchase1;
	}

	public void setPurchase1(int purchase1) {
		this.purchase1 = purchase1;
	}

	public int getPurchase2() {
		return purchase2;
	}

	public void setPurchase2(int purchase2) {
		this.purchase2 = purchase2;
	}

	public int getPurchase3() {
		return purchase3;
	}

	public void setPurchase3(int purchase3) {
		this.purchase3 = purchase3;
	}

	public int getCounseling1() {
		return counseling1;
	}

	public void setCounseling1(int counseling1) {
		this.counseling1 = counseling1;
	}

	public int getCounseling2() {
		return counseling2;
	}

	public void setCounseling2(int counseling2) {
		this.counseling2 = counseling2;
	}

	public int getCounseling3() {
		return counseling3;
	}

	public void setCounseling3(int counseling3) {
		this.counseling3 = counseling3;
	}

	public int getBlack1() {
		return black1;
	}

	public void setBlack1(int black1) {
		this.black1 = black1;
	}

	public int getBlack2() {
		return black2;
	}

	public void setBlack2(int black2) {
		this.black2 = black2;
	}

	public int getBlack3() {
		return black3;
	}

	public void setBlack3(int black3) {
		this.black3 = black3;
	}

	public int getStaff1() {
		return staff1;
	}

	public void setStaff1(int staff1) {
		this.staff1 = staff1;
	}

	public int getStaff2() {
		return staff2;
	}

	public void setStaff2(int staff2) {
		this.staff2 = staff2;
	}

	public int getStaff3() {
		return staff3;
	}

	public void setStaff3(int staff3) {
		this.staff3 = staff3;
	}

	public int getEnroll1() {
		return enroll1;
	}

	public void setEnroll1(int enroll1) {
		this.enroll1 = enroll1;
	}

	public int getEnroll2() {
		return enroll2;
	}

	public void setEnroll2(int enroll2) {
		this.enroll2 = enroll2;
	}

	public int getEnroll3() {
		return enroll3;
	}

	public void setEnroll3(int enroll3) {
		this.enroll3 = enroll3;
	}

	public int getAttend1() {
		return attend1;
	}

	public void setAttend1(int attend1) {
		this.attend1 = attend1;
	}

	public int getAttend2() {
		return attend2;
	}

	public void setAttend2(int attend2) {
		this.attend2 = attend2;
	}

	public int getAttend3() {
		return attend3;
	}

	public void setAttend3(int attend3) {
		this.attend3 = attend3;
	}

	public int getClass1() {
		return class1;
	}

	public void setClass1(int class1) {
		this.class1 = class1;
	}

	public int getClass2() {
		return class2;
	}

	public void setClass2(int class2) {
		this.class2 = class2;
	}

	public int getClass3() {
		return class3;
	}

	public void setClass3(int class3) {
		this.class3 = class3;
	}

	public int getSatisfy1() {
		return satisfy1;
	}

	public void setSatisfy1(int satisfy1) {
		this.satisfy1 = satisfy1;
	}

	public int getSatisfy2() {
		return satisfy2;
	}

	public void setSatisfy2(int satisfy2) {
		this.satisfy2 = satisfy2;
	}

	public int getSatisfy3() {
		return satisfy3;
	}

	public void setSatisfy3(int satisfy3) {
		this.satisfy3 = satisfy3;
	}

	public int getCondition1() {
		return condition1;
	}

	public void setCondition1(int condition1) {
		this.condition1 = condition1;
	}

	public int getCondition2() {
		return condition2;
	}

	public void setCondition2(int condition2) {
		this.condition2 = condition2;
	}

	public int getCondition3() {
		return condition3;
	}

	public void setCondition3(int condition3) {
		this.condition3 = condition3;
	}

	public int getMenu1() {
		return menu1;
	}

	public void setMenu1(int menu1) {
		this.menu1 = menu1;
	}

	public int getMenu2() {
		return menu2;
	}

	public void setMenu2(int menu2) {
		this.menu2 = menu2;
	}

	public int getMenu3() {
		return menu3;
	}

	public void setMenu3(int menu3) {
		this.menu3 = menu3;
	}

	public int getPlan1() {
		return plan1;
	}

	public void setPlan1(int plan1) {
		this.plan1 = plan1;
	}

	public int getPlan2() {
		return plan2;
	}

	public void setPlan2(int plan2) {
		this.plan2 = plan2;
	}

	public int getPlan3() {
		return plan3;
	}

	public void setPlan3(int plan3) {
		this.plan3 = plan3;
	}

	public int getpAtt() {
		return pAtt;
	}

	public void setpAtt(int pAtt) {
		this.pAtt = pAtt;
	}

	public int getsAtt() {
		return sAtt;
	}

	public void setsAtt(int sAtt) {
		this.sAtt = sAtt;
	}

	public int getpScore() {
		return pScore;
	}

	public void setpScore(int pScore) {
		this.pScore = pScore;
	}

	public int getsScore() {
		return sScore;
	}

	public void setsScore(int sScore) {
		this.sScore = sScore;
	}

	public int getpSatisfy() {
		return pSatisfy;
	}

	public void setpSatisfy(int pSatisfy) {
		this.pSatisfy = pSatisfy;
	}

	public int getsSatisfy() {
		return sSatisfy;
	}

	public void setsSatisfy(int sSatisfy) {
		this.sSatisfy = sSatisfy;
	}

	public int getpReceipt() {
		return pReceipt;
	}

	public void setpReceipt(int pReceipt) {
		this.pReceipt = pReceipt;
	}

	public int getsReceipt() {
		return sReceipt;
	}

	public void setsReceipt(int sReceipt) {
		this.sReceipt = sReceipt;
	}

	public String getPpScore() {
		return ppScore;
	}

	public void setPpScore(String ppScore) {
		this.ppScore = ppScore;
	}

	public String getSsScore() {
		return ssScore;
	}

	public void setSsScore(String ssScore) {
		this.ssScore = ssScore;
	}

	public String getPpAtt() {
		return ppAtt;
	}

	public void setPpAtt(String ppAtt) {
		this.ppAtt = ppAtt;
	}

	public String getSsAtt() {
		return ssAtt;
	}

	public void setSsAtt(String ssAtt) {
		this.ssAtt = ssAtt;
	}

	public String getPpSatisfy() {
		return ppSatisfy;
	}

	public void setPpSatisfy(String ppSatisfy) {
		this.ppSatisfy = ppSatisfy;
	}

	public String getSsSatisfy() {
		return ssSatisfy;
	}

	public void setSsSatisfy(String ssSatisfy) {
		this.ssSatisfy = ssSatisfy;
	}

	public String getPpReceipt() {
		return ppReceipt;
	}

	public void setPpReceipt(String ppReceipt) {
		this.ppReceipt = ppReceipt;
	}

	public String getSsReceipt() {
		return ssReceipt;
	}

	public void setSsReceipt(String ssReceipt) {
		this.ssReceipt = ssReceipt;
	}

	@Override
	public String toString() {
		return "MngLevel [modifyInfo1=" + modifyInfo1 + ", modifyInfo2=" + modifyInfo2 + ", modifyInfo3=" + modifyInfo3
				+ ", info1=" + info1 + ", info2=" + info2 + ", info3=" + info3 + ", purchase1=" + purchase1
				+ ", purchase2=" + purchase2 + ", purchase3=" + purchase3 + ", counseling1=" + counseling1
				+ ", counseling2=" + counseling2 + ", counseling3=" + counseling3 + ", black1=" + black1 + ", black2="
				+ black2 + ", black3=" + black3 + ", staff1=" + staff1 + ", staff2=" + staff2 + ", staff3=" + staff3
				+ ", enroll1=" + enroll1 + ", enroll2=" + enroll2 + ", enroll3=" + enroll3 + ", attend1=" + attend1
				+ ", attend2=" + attend2 + ", attend3=" + attend3 + ", class1=" + class1 + ", class2=" + class2
				+ ", class3=" + class3 + ", satisfy1=" + satisfy1 + ", satisfy2=" + satisfy2 + ", satisfy3=" + satisfy3
				+ ", condition1=" + condition1 + ", condition2=" + condition2 + ", condition3=" + condition3
				+ ", menu1=" + menu1 + ", menu2=" + menu2 + ", menu3=" + menu3 + ", plan1=" + plan1 + ", plan2=" + plan2
				+ ", plan3=" + plan3 + ", pAtt=" + pAtt + ", sAtt=" + sAtt + ", pScore=" + pScore + ", sScore=" + sScore
				+ ", pSatisfy=" + pSatisfy + ", sSatisfy=" + sSatisfy + ", pReceipt=" + pReceipt + ", sReceipt="
				+ sReceipt + ", ppScore=" + ppScore + ", ssScore=" + ssScore + ", ppAtt=" + ppAtt + ", ssAtt=" + ssAtt
				+ ", ppSatisfy=" + ppSatisfy + ", ssSatisfy=" + ssSatisfy + ", ppReceipt=" + ppReceipt + ", ssReceipt="
				+ ssReceipt + "]";
	}

	
	
	
	
}
