package hagong.academy.mngClass.mngCS.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import hagong.academy.mngClass.mngCS.model.dao.CSDao;
import hagong.academy.mngClass.mngCS.model.vo.CS;
import hagong.academy.mngClass.mngCS.model.vo.CSStudent;
import hagong.academy.mngStudent.mngBlack.model.dao.BlacklistDao;

import static hagong.common.JDBCTemplate.*;

public class CSService {

	public ArrayList<CS> selectCSlistWithPaging(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<CS> cslist = new CSDao().selectCSlistWithPaging(con, currentPage, limit);
		
		close(con);
		
		return cslist;
	}

	public HashMap<String, Object> detailCSStudent(int clsNo) {
		Connection con = getConnection();
		HashMap<String, Object> hmap = new HashMap<>();
		ArrayList<CSStudent> csslist = new CSDao().detailCSStudent(con, clsNo);
		CSStudent csInfo = new CSDao().detailCSInfo(con, clsNo);
		
		
		hmap.put("csslist", csslist);
		hmap.put("csInfo", csInfo);

		
		close(con);
		
		return hmap;
	}

	public int listCount() {
		Connection con = getConnection();
		
		int listCount = new CSDao().listCount(con);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<CSStudent> allStudent(int clsNo) {
		Connection con = getConnection();
		
		ArrayList<CSStudent> allStudent = new CSDao().selectAllCS(con, clsNo);
		
		close(con);
		
		return allStudent;
	}

}
