package hagong.academy.mngStaff.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*@Data
@NoArgsConstructor
@AllArgsConstructor*/
public class PageInfo {
	
	private int listCnt;
	private int limit;
	private int btnCnt;
	private int curPage;
	private int maxPage;
	private int startPage;
	private int endPage;
	
	public PageInfo() {
		super();
	}

	public PageInfo(int listCnt, int limit, int btnCnt, int curPage, int maxPage, int startPage, int endPage) {
		super();
		this.listCnt = listCnt;
		this.limit = limit;
		this.btnCnt = btnCnt;
		this.curPage = curPage;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}


	public int getListCnt() {
		return listCnt;
	}

	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getBtnCnt() {
		return btnCnt;
	}

	public void setBtnCnt(int btnCnt) {
		this.btnCnt = btnCnt;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "PageInfo [listCnt=" + listCnt + ", limit=" + limit + ", btnCnt=" + btnCnt + ", curPage=" + curPage
				+ ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}

}
