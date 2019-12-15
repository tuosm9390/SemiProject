package hagong.academy.mngClass.mngClassList.model.service;

import static hagong.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import hagong.academy.mngClass.mngClassList.model.dao.ClassDao;

public class ClassService {

	public ArrayList<Class> selectClassList() {
		Connection con = getConnection();
		
		ArrayList<Class> list = new ClassDao().selectClassList(con);
		
		close(con);		
		
		return list;
	}

}
