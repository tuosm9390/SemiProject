package hagong.academy.mngStudent.mngBlack.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import hagong.academy.mngStudent.mngBlack.model.dao.BlacklistDao;
import hagong.academy.mngStudent.mngBlack.model.vo.BlacklistInfo;
import hagong.academy.mngStudent.mngCouns.model.vo.MemberCouns;

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

	public HashMap<String, Object> detailBlacklist(int userNo) {
		Connection con = getConnection();
		ArrayList<MemberCouns> detailBlacklist = new BlacklistDao().detailBlacklist(con, userNo);
		
		BlacklistInfo userInfo = new BlacklistDao().blacklistInfo(con, userNo);
		
		HashMap<String, Object> hmap = new HashMap<>();
		
		hmap.put("detailBlacklist", detailBlacklist);
		hmap.put("userInfo", userInfo);
		
		close(con);
		
		
		
		return hmap;
	}

	public ArrayList<MemberCouns> selectOneBlacklist(int userNo) {
		Connection con = getConnection();
		
		
		ArrayList<MemberCouns> detailBlacklist = new BlacklistDao().detailBlacklist(con, userNo);
		
		close(con);
		
		return detailBlacklist;
	}

}
