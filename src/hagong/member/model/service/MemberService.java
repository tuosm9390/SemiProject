package hagong.member.model.service;

import java.sql.Connection;

import hagong.member.model.dao.MemberDao;
import hagong.member.model.vo.Member;
import static hagong.common.JDBCTemplate.*;

public class MemberService {

	public Member loginCheck(Member m) {
		Connection con = getConnection();
		
		Member loginMember = new MemberDao().loginCheck(con, m);
		
		close(con);
		
		return loginMember;
	}

}
