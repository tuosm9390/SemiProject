package hagong.academy.mngClass.mngSatisfy.model.vo;

import java.sql.Date;

public class SatisfyInfo {
	// 만족도
	private int rowNum;
	private int satNo;
	private String satTitle;
	private Date start;
	private Date end;
	private String target;
	private int benNo;
	private String benCondition;
	private String benType;
	private double benRate;

	// 질문
	private int queNo;
	private String queContent;

	// 답변
	private int ansNo;
	private String ansContent;
	private int userNo;

	public SatisfyInfo() {
	}

	public SatisfyInfo(int rowNum, int satNo, String satTitle, Date start, Date end, String target, int benNo,
			String benCondition, String benType, double benRate, int queNo, String queContent, int ansNo,
			String ansContent, int userNo) {
		super();
		this.rowNum = rowNum;
		this.satNo = satNo;
		this.satTitle = satTitle;
		this.start = start;
		this.end = end;
		this.target = target;
		this.benNo = benNo;
		this.benCondition = benCondition;
		this.benType = benType;
		this.benRate = benRate;
		this.queNo = queNo;
		this.queContent = queContent;
		this.ansNo = ansNo;
		this.ansContent = ansContent;
		this.userNo = userNo;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public int getSatNo() {
		return satNo;
	}

	public void setSatNo(int satNo) {
		this.satNo = satNo;
	}

	public String getSatTitle() {
		return satTitle;
	}

	public void setSatTitle(String satTitle) {
		this.satTitle = satTitle;
	}

	public Date getStart() {
		return start;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public int getBenNo() {
		return benNo;
	}

	public void setBenNo(int benNo) {
		this.benNo = benNo;
	}

	public String getBenCondition() {
		return benCondition;
	}

	public void setBenCondition(String benCondition) {
		this.benCondition = benCondition;
	}

	public String getBenType() {
		return benType;
	}

	public void setBenType(String benType) {
		this.benType = benType;
	}

	public double getBenRate() {
		return benRate;
	}

	public void setBenRate(double benRate) {
		this.benRate = benRate;
	}

	public int getQueNo() {
		return queNo;
	}

	public void setQueNo(int queNo) {
		this.queNo = queNo;
	}

	public String getQueContent() {
		return queContent;
	}

	public void setQueContent(String queContent) {
		this.queContent = queContent;
	}

	public int getAnsNo() {
		return ansNo;
	}

	public void setAnsNo(int ansNo) {
		this.ansNo = ansNo;
	}

	public String getAnsContent() {
		return ansContent;
	}

	public void setAnsContent(String ansContent) {
		this.ansContent = ansContent;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "SatisfyInfo [rowNum=" + rowNum + ", satNo=" + satNo + ", satTitle=" + satTitle + ", start=" + start
				+ ", end=" + end + ", target=" + target + ", benNo=" + benNo + ", benCondition=" + benCondition
				+ ", benType=" + benType + ", benRate=" + benRate + ", queNo=" + queNo + ", queContent=" + queContent
				+ ", ansNo=" + ansNo + ", ansContent=" + ansContent + ", userNo=" + userNo + "]";
	}

}
