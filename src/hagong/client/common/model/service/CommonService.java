package hagong.client.common.model.service;

import static hagong.common.JDBCTemplate.close;
import static hagong.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import hagong.academy.common.member.model.dao.MemberDao;
import hagong.academy.common.member.model.vo.Member;
import hagong.academy.mngClass.mngClassList.model.vo.Class;
import hagong.client.common.model.dao.CommonDao;

public class CommonService {

	public ArrayList<Class> selectClass(String userNo) {
		Connection con = getConnection();
		
		ArrayList<Class> list = new CommonDao().selectClass(con, userNo);
		
		close(con);
		
		return list;
	}

	public Member loginCheck(Member m) {
		Connection con = getConnection();
		
		Member loginUser = new CommonDao().loginCheck(con, m);
		
		close(con);
		
		return loginUser;
	}

}
