package hagong.academy.commonMenu.calendar.model.vo;

import java.sql.Date;


public class Calendar implements java.io.Serializable{
	private String start;
	private String end;
	private String title;
	private String allDay;
	private String bgColor;
	private String type;
	private String content;
	private String mdtype;
	private int uno;
	private int cno;
	
	
	public Calendar() {}


	public Calendar(String start, String end, String title, String allDay, String bgColor, String type, String content,
			String mdtype, int uno, int cno) {
		super();
		this.start = start;
		this.end = end;
		this.title = title;
		this.allDay = allDay;
		this.bgColor = bgColor;
		this.type = type;
		this.content = content;
		this.mdtype = mdtype;
		this.uno = uno;
		this.cno = cno;
	}


	public String getStart() {
		return start;
	}


	public void setStart(String start) {
		this.start = start;
	}


	public String getEnd() {
		return end;
	}


	public void setEnd(String end) {
		this.end = end;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getAllDay() {
		return allDay;
	}


	public void setAllDay(String allDay) {
		this.allDay = allDay;
	}


	public String getBgColor() {
		return bgColor;
	}


	public void setBgColor(String bgColor) {
		this.bgColor = bgColor;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getMdtype() {
		return mdtype;
	}


	public void setMdtype(String mdtype) {
		this.mdtype = mdtype;
	}


	public int getUno() {
		return uno;
	}


	public void setUno(int uno) {
		this.uno = uno;
	}


	public int getCno() {
		return cno;
	}


	public void setCno(int cno) {
		this.cno = cno;
	}


	@Override
	public String toString() {
		return "Calendar [start=" + start + ", end=" + end + ", title=" + title + ", allDay=" + allDay + ", bgColor="
				+ bgColor + ", type=" + type + ", content=" + content + ", mdtype=" + mdtype + ", uno=" + uno + ", cno="
				+ cno + "]";
	}

	

	
	
	
	
	
}
