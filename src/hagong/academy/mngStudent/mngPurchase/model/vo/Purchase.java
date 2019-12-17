package hagong.academy.mngStudent.mngPurchase.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*@Data
@NoArgsConstructor
@AllArgsConstructor*/
public class Purchase {
	
	private int classNo;		//강좌번호
	private String className;	//강좌이름
	private int classPrice;		//수강비용
	private Date classStart;	//개강일
	private Date classEnd;		//종강일
	private int classDays; 		//강의일수
	
	private int stuNo;			//학생번호
	private String stuId;		//학생ID
	private String stuName;		//학생이름
	private int realPrice;		//청구금액 (강좌비용 - 특이사항 적용 금액)
	private boolean payStatus;	//납부여부 (미납/완납)
	
	private int purchaseNo;		//수납번호
	private Date notifyDate;	//납부고지일
	private Date reciptDate;	//영수증발부일
	private String detailStatus;//상세 납부여부 (미납/완남/완납 후 환불)
	private String payMemo; 	//특이사항 (NONE/REFUND/BENEFIT)
	private int payPrice;		//수납금액
	
	private String refundPoint;	//환불시점 (-/BEFORE/1N3/2N3)
	private double refundRate;	//환불비율
	private int refundPrice;	//환불금액 (없으면 -)
	private Date refundDay;		//환불일자
	
	private String beneName;	//사용한 쿠폰명
	private double beneRate;	//혜택 할인비율
	private int benePrice;		//혜택 할인금액
	
	private int faultDays;		//학원귀책 일수
	private int onedayFee;		//일할금액
	private int faultPrice;		//학원귀책 환불금액

	private int profit;			//차액 (수납금액 - 환불금액/쿠폰혜택금액)

	public Purchase() {
		super();
	}

	public Purchase(int classNo, String className, int classPrice, Date classStart, Date classEnd, int classDays,
			int stuNo, String stuId, String stuName, int realPrice, boolean payStatus, int purchaseNo, Date notifyDate,
			Date reciptDate, String detailStatus, String payMemo, int payPrice, String refundPoint, double refundRate,
			int refundPrice, Date refundDay, String beneName, double beneRate, int benePrice, int faultDays,
			int onedayFee, int faultPrice, int profit) {
		super();
		this.classNo = classNo;
		this.className = className;
		this.classPrice = classPrice;
		this.classStart = classStart;
		this.classEnd = classEnd;
		this.classDays = classDays;
		this.stuNo = stuNo;
		this.stuId = stuId;
		this.stuName = stuName;
		this.realPrice = realPrice;
		this.payStatus = payStatus;
		this.purchaseNo = purchaseNo;
		this.notifyDate = notifyDate;
		this.reciptDate = reciptDate;
		this.detailStatus = detailStatus;
		this.payMemo = payMemo;
		this.payPrice = payPrice;
		this.refundPoint = refundPoint;
		this.refundRate = refundRate;
		this.refundPrice = refundPrice;
		this.refundDay = refundDay;
		this.beneName = beneName;
		this.beneRate = beneRate;
		this.benePrice = benePrice;
		this.faultDays = faultDays;
		this.onedayFee = onedayFee;
		this.faultPrice = faultPrice;
		this.profit = profit;
	}

	public final Date getReciptDate() {
		return reciptDate;
	}

	public final void setReciptDate(Date reciptDate) {
		this.reciptDate = reciptDate;
	}

	public final int getPurchaseNo() {
		return purchaseNo;
	}

	public final void setPurchaseNo(int purchaseNo) {
		this.purchaseNo = purchaseNo;
	}

	public final int getClassNo() {
		return classNo;
	}

	public final void setClassNo(int classNo) {
		this.classNo = classNo;
	}

	public final String getClassName() {
		return className;
	}

	public final void setClassName(String className) {
		this.className = className;
	}

	public final int getClassPrice() {
		return classPrice;
	}

	public final void setClassPrice(int classPrice) {
		this.classPrice = classPrice;
	}

	public final Date getClassStart() {
		return classStart;
	}

	public final void setClassStart(Date classStart) {
		this.classStart = classStart;
	}

	public final Date getClassEnd() {
		return classEnd;
	}

	public final void setClassEnd(Date classEnd) {
		this.classEnd = classEnd;
	}

	public final int getClassDays() {
		return classDays;
	}

	public final void setClassDays(int classDays) {
		this.classDays = classDays;
	}

	public final int getStuNo() {
		return stuNo;
	}

	public final void setStuNo(int stuNo) {
		this.stuNo = stuNo;
	}

	public final String getStuId() {
		return stuId;
	}

	public final void setStuId(String stuId) {
		this.stuId = stuId;
	}

	public final String getStuName() {
		return stuName;
	}

	public final void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public final int getRealPrice() {
		return realPrice;
	}

	public final void setRealPrice(int realPrice) {
		this.realPrice = realPrice;
	}

	public final boolean isPayStatus() {
		return payStatus;
	}

	public final void setPayStatus(boolean payStatus) {
		this.payStatus = payStatus;
	}

	public final Date getNotifyDate() {
		return notifyDate;
	}

	public final void setNotifyDate(Date notifyDate) {
		this.notifyDate = notifyDate;
	}

	public final String getDetailStatus() {
		return detailStatus;
	}

	public final void setDetailStatus(String detailStatus) {
		this.detailStatus = detailStatus;
	}

	public final String getPayMemo() {
		return payMemo;
	}

	public final void setPayMemo(String payMemo) {
		this.payMemo = payMemo;
	}

	public final int getPayPrice() {
		return payPrice;
	}

	public final void setPayPrice(int payPrice) {
		this.payPrice = payPrice;
	}

	public final String getRefundPoint() {
		return refundPoint;
	}

	public final void setRefundPoint(String refundPoint) {
		this.refundPoint = refundPoint;
	}

	public final double getRefundRate() {
		return refundRate;
	}

	public final void setRefundRate(double refundRate) {
		this.refundRate = refundRate;
	}

	public final int getRefundPrice() {
		return refundPrice;
	}

	public final void setRefundPrice(int refundPrice) {
		this.refundPrice = refundPrice;
	}

	public final Date getRefundDay() {
		return refundDay;
	}

	public final void setRefundDay(Date refundDay) {
		this.refundDay = refundDay;
	}

	public final String getBeneName() {
		return beneName;
	}

	public final void setBeneName(String beneName) {
		this.beneName = beneName;
	}

	public final double getBeneRate() {
		return beneRate;
	}

	public final void setBeneRate(double beneRate) {
		this.beneRate = beneRate;
	}

	public final int getBenePrice() {
		return benePrice;
	}

	public final void setBenePrice(int benePrice) {
		this.benePrice = benePrice;
	}

	public final int getFaultDays() {
		return faultDays;
	}

	public final void setFaultDays(int faultDays) {
		this.faultDays = faultDays;
	}

	public final int getOnedayFee() {
		return onedayFee;
	}

	public final void setOnedayFee(int onedayFee) {
		this.onedayFee = onedayFee;
	}

	public final int getFaultPrice() {
		return faultPrice;
	}

	public final void setFaultPrice(int faultPrice) {
		this.faultPrice = faultPrice;
	}

	public final int getProfit() {
		return profit;
	}

	public final void setProfit(int profit) {
		this.profit = profit;
	}

	@Override
	public String toString() {
		return "Purchase [classNo=" + classNo + ", className=" + className + ", classPrice=" + classPrice
				+ ", classStart=" + classStart + ", classEnd=" + classEnd + ", classDays=" + classDays + ", stuNo="
				+ stuNo + ", stuId=" + stuId + ", stuName=" + stuName + ", realPrice=" + realPrice + ", payStatus="
				+ payStatus + ", purchaseNo=" + purchaseNo + ", notifyDate=" + notifyDate + ", reciptDate=" + reciptDate
				+ ", detailStatus=" + detailStatus + ", payMemo=" + payMemo + ", payPrice=" + payPrice
				+ ", refundPoint=" + refundPoint + ", refundRate=" + refundRate + ", refundPrice=" + refundPrice
				+ ", refundDay=" + refundDay + ", beneName=" + beneName + ", beneRate=" + beneRate + ", benePrice="
				+ benePrice + ", faultDays=" + faultDays + ", onedayFee=" + onedayFee + ", faultPrice=" + faultPrice
				+ ", profit=" + profit + "]";
	}

}
