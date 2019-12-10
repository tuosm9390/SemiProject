package hagong.academy.mngAdmin.mngLevel.model.vo;

import java.sql.Date;

public class MngLevel implements java.io.Serializable{
	
	private String mmid;
	private String mmtitle;
	private int mlevel;
	private Date mdate;
	
	
	public MngLevel() {}


	public MngLevel(String mmid, String mmtitle, int mlevel, Date mdate) {
		super();
		this.mmid = mmid;
		this.mmtitle = mmtitle;
		this.mlevel = mlevel;
		this.mdate = mdate;
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


	public Date getMdate() {
		return mdate;
	}


	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}


	@Override
	public String toString() {
		return "MngLevel [mmid=" + mmid + ", mmtitle=" + mmtitle + ", mlevel=" + mlevel + ", mdate=" + mdate + "]";
	}
	
	
}
