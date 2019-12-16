package hagong.academy.mngClass.mngCS.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import hagong.academy.mngClass.mngCS.model.dao.CSDao;
import hagong.academy.mngClass.mngCS.model.vo.CS;
import hagong.academy.mngClass.mngCS.model.vo.CSStudent;

import static hagong.common.JDBCTemplate.*;

public class CSService {

	public ArrayList<CS> selectCSlistWithPaging(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<CS> cslist = new CSDao().selectCSlistWithPaging(con, currentPage, limit);
		
		close(con);
		
		return cslist;
	}

	public ArrayList<CSStudent> detailCSStudent(int clsNo) {
		Connection con = getConnection();
		
		ArrayList<CSStudent> csslist = new CSDao().detailCSStudent(con, clsNo);
		
		close(con);
		
		return csslist;
	}

}
