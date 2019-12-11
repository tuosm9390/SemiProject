package hagong.academy.mngStudent.mngCouns.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*@Data
@AllArgsConstructor
@NoArgsConstructor*/
public class PageInfo implements java.io.Serializable{
	private int currentPage;	//현재 페이지
	private int listCount;		//전체 목록 갯수
	private int limit;			//한페이지에 보여질 목록 갯수
	private int maxPage;		//최대 페이징 수 
	private int startPage;		//페이징 시작 번호 
	private int endPage;		//페이징 끝 번호
	
	public PageInfo() {}

	public PageInfo(int currentPage, int listCount, int limit, int maxPage, int startPage, int endPage) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.limit = limit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
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
		return "PageInfo [currentPage=" + currentPage + ", listCount=" + listCount + ", limit=" + limit + ", maxPage="
				+ maxPage + ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
	
	
}
