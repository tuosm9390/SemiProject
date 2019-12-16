package hagong.academy.mngStudent.mngPurchase.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*@Data
@NoArgsConstructor
@AllArgsConstructor*/
public class SelectDate {
	
	private int startYear;
	private int startMonth;
	private int endYear;
	private int endMonth;
	private int selectYear;
	private int selectMonth;
	
	public SelectDate() {
		super();
	}

	public SelectDate(int startYear, int startMonth, int endYear, int endMonth, int selectYear, int selectMonth) {
		super();
		this.startYear = startYear;
		this.startMonth = startMonth;
		this.endYear = endYear;
		this.endMonth = endMonth;
		this.selectYear = selectYear;
		this.selectMonth = selectMonth;
	}

	public final int getStartYear() {
		return startYear;
	}

	public final void setStartYear(int startYear) {
		this.startYear = startYear;
	}

	public final int getStartMonth() {
		return startMonth;
	}

	public final void setStartMonth(int startMonth) {
		this.startMonth = startMonth;
	}

	public final int getEndYear() {
		return endYear;
	}

	public final void setEndYear(int endYear) {
		this.endYear = endYear;
	}

	public final int getEndMonth() {
		return endMonth;
	}

	public final void setEndMonth(int endMonth) {
		this.endMonth = endMonth;
	}
	
	public final int getSelectYear() {
		return selectYear;
	}

	public final void setSelectYear(int selectYear) {
		this.selectYear = selectYear;
	}

	public final int getSelectMonth() {
		return selectMonth;
	}

	public final void setSelectMonth(int selectMonth) {
		this.selectMonth = selectMonth;
	}

	@Override
	public String toString() {
		return "SelectDate [startYear=" + startYear + ", startMonth=" + startMonth + ", endYear=" + endYear
				+ ", endMonth=" + endMonth + ", selectYear=" + selectYear + ", selectMonth=" + selectMonth + "]";
	}

}
