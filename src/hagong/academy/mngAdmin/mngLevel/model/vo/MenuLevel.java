package hagong.academy.mngAdmin.mngLevel.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class MenuLevel implements java.io.Serializable{
	
	private String mmid;
	private String mmtitle;
	private int mlevel;
	
	public MenuLevel() {};
	
	public MenuLevel(String mmid, String mmtitle, int mlevel) {
		super();
		this.mmid = mmid;
		this.mmtitle = mmtitle;
		this.mlevel = mlevel;
	}

	public String getMmid() {
		return mmid;
	}

	public void setMmid(String mmid) {
		this.mmid = mmid;
	}

	public String getMmtitle() {
		return mmtitle;
	}

	public void setMmtitle(String mmtitle) {
		this.mmtitle = mmtitle;
	}

	public int getMlevel() {
		return mlevel;
	}

	public void setMlevel(int mlevel) {
		this.mlevel = mlevel;
	}

	@Override
	public String toString() {
		return "MenuLevel [mmid=" + mmid + ", mmtitle=" + mmtitle + ", mlevel=" + mlevel + "]";
	}
	
	

	public MenuLevel() {
	}

	public MenuLevel(String mmid, String mmtitle, int mlevel) {
		super();
		this.mmid = mmid;
		this.mmtitle = mmtitle;
		this.mlevel = mlevel;
	}

	public String getMmid() {
		return mmid;
	}

	public void setMmid(String mmid) {
		this.mmid = mmid;
	}

	public String getMmtitle() {
		return mmtitle;
	}

	public void setMmtitle(String mmtitle) {
		this.mmtitle = mmtitle;
	}

	public int getMlevel() {
		return mlevel;
	}

	public void setMlevel(int mlevel) {
		this.mlevel = mlevel;
	}

	@Override
	public String toString() {
		return "MenuLevel [mmid=" + mmid + ", mmtitle=" + mmtitle + ", mlevel=" + mlevel + "]";
	}

}
