package hagong.academy.common.member.model.service;

import java.sql.Connection;

import hagong.academy.common.member.model.dao.MemberDao;
import hagong.academy.common.member.model.vo.Member;
import static hagong.common.JDBCTemplate.*;

public class MemberService {

	public Member loginCheck(Member m) {
		Connection con = getConnection();
		
		Member loginUser = new MemberDao().loginCheck(con, m);
		
		close(con);
		
		return loginUser;
	}
	
	public Member loginCheck2(Member m) {
		Connection con = getConnection();
		
		Member requestMember = new MemberDao().loginCheck2(con, m);
		
		close(con);
		
		return requestMember;
	}
	
	public String updatePassword(String password) {
		
		String newPwd =  password;
		
		return newPwd;
	}

	public int changePwd(Member changePwdMember) {
		Connection con = getConnection();
		
		int result = new MemberDao().changePwd(con, changePwdMember);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return result;
	}

	public int allStaff() {
		Connection con = getConnection();
		
		int total = new MemberDao().allStaff(con);
		
		close(con);
		
		return total;
	}

}
