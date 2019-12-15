package hagong.academy.mngClass.mngClassList.model.service;

import static hagong.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import hagong.academy.mngClass.mngClassList.model.dao.ClassDao;
import hagong.academy.mngClass.mngClassList.model.vo.Class;

public class ClassService {

	public ArrayList<Class> selectClassList() {
		Connection con = getConnection();
		
		ArrayList<Class> list = new ClassDao().selectClassList(con);
		
		close(con);		
		
		return list;
	}

	public Class selectOneClass(String clsNo) {
		Connection con = getConnection();
		
		Class classDetail = new ClassDao().selectOneClass(con, clsNo);
		
		close(con);
		
		return classDetail;
	}

}
