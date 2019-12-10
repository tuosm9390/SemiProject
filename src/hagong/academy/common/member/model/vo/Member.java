package hagong.academy.common.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	private int userNo;				//회원번호
	private String name;			//이름
	private String userId;			//아이디
	private String userPwd;			//비밀번호
	private Date birth;				//생년월일
	private String phone;			//전화번호
	private String address;			//주소
	private String email;			//이메일
	private int refUno;				//학부모 회원번호
	private Date enrollDate;		//등록일자
	private Date leaveDate;			//탈퇴일자
	private String status;			//재원여부
	private String inflowPath;		//유입경로
	private String userType;		//회원구분
	
}
