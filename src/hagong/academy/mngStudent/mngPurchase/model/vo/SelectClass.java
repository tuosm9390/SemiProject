package hagong.academy.mngStudent.mngPurchase.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*@Data
@NoArgsConstructor
@AllArgsConstructor*/
public class SelectClass {
	
	private int classNo;
	private String className;
	
	public SelectClass() {
		super();
	}

	public SelectClass(int classNo, String className) {
		super();
		this.classNo = classNo;
		this.className = className;
	}

	public final int getClassNo() {
		return classNo;
	}

	public final void setClassNo(int classNo) {
		this.classNo = classNo;
	}

	public final String getClassName() {
		return className;
	}

	public final void setClassName(String className) {
		this.className = className;
	}

	@Override
	public String toString() {
		return "SelectClass [classNo=" + classNo + ", className=" + className + "]";
	}

}
