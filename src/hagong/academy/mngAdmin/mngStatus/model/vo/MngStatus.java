package hagong.academy.mngAdmin.mngStatus.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class MngStatus implements java.io.Serializable{
	
	private int allStudent;
	private int enrollDate;
	private int leaveDate;
   
	
	private int inFriend;
	private int inInternet;
	private int inPicket;
	private int inPcard;
	private int inEtc;
	
	private int midKor;
	private int midMath;
	private int midEng;
	private int midSocial;
	private int midScience;
	private int midForeign;
	private int midEtc;
	
	private int highKor;
	private int highMath;
	private int highEng;
	private int highSocial;
	private int highScience;
	private int highForeign;
	private int highEtc;
	

	

}
