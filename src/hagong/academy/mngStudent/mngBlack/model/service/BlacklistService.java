package hagong.academy.mngStudent.mngBlack.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import hagong.academy.mngStudent.mngBlack.model.dao.BlacklistDao;
import hagong.academy.mngStudent.mngBlack.model.vo.BlacklistInfo;

import static hagong.common.JDBCTemplate.*;

public class BlacklistService {

	public int listCount() {
		Connection con = getConnection();
		
		int listCount = new BlacklistDao().listCount(con);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<BlacklistInfo> selectBlacklistWithPaging(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<BlacklistInfo> blacklist = new BlacklistDao().selectBlacklistWithPaging(con, currentPage, limit);
		
		close(con);
		
		
		return blacklist;
	}

}
