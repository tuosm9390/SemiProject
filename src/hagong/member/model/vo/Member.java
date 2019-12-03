package hagong.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	private int memberNo;			//회원번호
	private String memberName;		//이름
	private String memberId;		//아이디
	private Date memberBirth;		//생년월일
	private String memberPhone;		//전화번호
	private String memberAddress;	//주소
	private String email;			//이메일
	private String memberFileId;	//사진파일 ID
	private int parentsNo;			//학부모 회원번호
	private Date enrollDate;		//등록일자
	private Date withdrawDate;		//탈퇴일자
	private String status;			//탈퇴여부
	private String inflowPath;		//유입경로
	private String memberPart;		//회원구분
	private String memberPwd;		//비밀번호
	
}
