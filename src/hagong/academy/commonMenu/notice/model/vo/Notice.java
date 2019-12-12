
package hagong.academy.commonMenu.notice.model.vo;

import java.sql.Date;

//import lombok.AllArgsConstructor;
//import lombok.Data;
//import lombok.NoArgsConstructor;

//@Data
//@AllArgsConstructor
//@NoArgsConstructor
public class Notice {
	private int nno;			//공지사항 번호
	private String nTitle;		//제목
	private String nAuthor;		//작성자
	private Date nDate;			//작성일
	private int nCount;			//조회수
	private String important;	//중요공지 여부
	private String nContent;	//내용
	private String status;		//삭제여부
	
	public Notice() {}
	
	



	public Notice(int nno, String nTitle, String nAuthor, Date nDate, int nCount, String important, String nContent,
			String status) {
		super();
		this.nno = nno;
		this.nTitle = nTitle;
		this.nAuthor = nAuthor;
		this.nDate = nDate;
		this.nCount = nCount;
		this.important = important;
		this.nContent = nContent;
		this.status = status;
	}

	public int getNno() {
		return nno;
	}

	public void setNno(int nno) {
		this.nno = nno;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnAuthor() {
		return nAuthor;
	}

	public void setnAuthor(String nAuthor) {
		this.nAuthor = nAuthor;
	}

	public Date getnDate() {
		return nDate;
	}

	public void setnDate(Date nDate) {
		this.nDate = nDate;
	}

	public int getnCount() {
		return nCount;
	}

	public void setnCount(int nCount) {
		this.nCount = nCount;
	}

	public String getImportant() {
		return important;
	}

	public void setImportant(String important) {
		this.important = important;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Notice [nno=" + nno + ", nTitle=" + nTitle + ", nAuthor=" + nAuthor + ", nDate=" + nDate + ", nCount="
				+ nCount + ", important=" + important + ", nContent=" + nContent + ", status=" + status + "]";
	}
	
	
	
	
}
