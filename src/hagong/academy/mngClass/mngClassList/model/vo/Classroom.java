package hagong.academy.mngClass.mngClassList.model.vo;

public class Classroom implements java.io.Serializable{
	private int clrNo;
	private String clrName;
	private int capacity;
	
	public Classroom() {}
	
	public Classroom(int clrNo, String clrName, int capacity) {
		super();
		this.clrNo = clrNo;
		this.clrName = clrName;
		this.capacity = capacity;
	}

	public int getClrNo() {
		return clrNo;
	}

	public void setClrNo(int clrNo) {
		this.clrNo = clrNo;
	}

	public String getClrName() {
		return clrName;
	}

	public void setClrName(String clrName) {
		this.clrName = clrName;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	@Override
	public String toString() {
		return "Classroom [clrNo=" + clrNo + ", clrName=" + clrName + ", capacity=" + capacity + "]";
	}
	
	
}
