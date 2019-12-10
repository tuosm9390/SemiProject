package hagong.academy.mngClass.mngCS.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Counseling {
	private int couNo;
	private String couTitle;
	private Date couDate;
	private int couUserNo;
	private String couType;
	private String couContent;
	private String couAction;
	private String couBlack;
}
