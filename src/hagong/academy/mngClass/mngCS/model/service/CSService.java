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

	public int insertCS(int clsNo, int[] stuNo) {
		Connection con = getConnection();
		int result = 0;
		int resultCS = 0;
		int resultPU = 0;
		for(int i = 0; i < stuNo.length; i++) {
			resultCS += new CSDao().insertCS(con, clsNo, stuNo[i]);
			
			HashMap<String, Object> monthsInfo = new CSDao().getMonths(con,clsNo);
			CS cs = (CS)monthsInfo.get("CS");
			int months = (int) monthsInfo.get("month");
			
			for(int j = 0; j < months; j++) {
				
				resultPU += new CSDao().insertPurchase(con, clsNo, stuNo[i],cs.getClsStart(),j);
			}
		}
		
		
		if(resultCS > 0 && resultPU > 0) {
			result = 1;
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int deleteCS(int clsNo, int[] stuAllNo) {
		Connection con = getConnection();
		int result = 0;
		int resultCS = 0;
		int resultPU = 0;
		for(int i = 0; i < stuAllNo.length; i++) {
			resultCS += new CSDao().deleteCS(con, clsNo, stuAllNo[i]);
			
			resultPU += new CSDao().deleteCSPurchase(con, clsNo, stuAllNo[i]);
						
		}
		
		
		if(resultCS > 0 && resultPU > 0) {
			result = 1;
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<CS> searchCSlistWithPaging(int currentPage, int limit, String searchCondition, String srchCnt) {
		Connection con = getConnection();
		
		ArrayList<CS> cslist = new CSDao().searchCSlistWithPaging(con, currentPage, limit, searchCondition, srchCnt);
		
		close(con);
		
		return cslist;
	}

	public ArrayList<CSStudent> srchByName(String name, int clsNo) {
		Connection con = getConnection();
		
		ArrayList<CSStudent> srchStu = new CSDao().srchByName(con, name, clsNo);
		
		close(con);
		
		return srchStu;
	}

	public ArrayList<CSStudent> srchByName2(String name, int clsNo) {
		Connection con = getConnection();
		
		ArrayList<CSStudent> srchStu = new CSDao().srchByName2(con, name, clsNo);
		
		close(con);
		
		return srchStu;
	}
	

}
