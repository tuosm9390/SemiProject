package hagong.academy.commonMenu.notice.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Notice {
	private int nno;			//공지사항 번호
	private String nTitle;		//제목
	private String nAuthor;		//작성자
	private Date nDate;			//작성일
	private int nCount;			//조회수
	private String important;	//중요공지 여부
	private String nContent;	//내용
	private String status;		//삭제여부
	
	
	
	
}
