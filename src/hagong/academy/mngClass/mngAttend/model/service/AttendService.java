package hagong.academy.mngClass.mngAttend.model.service;

import static hagong.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import hagong.academy.mngClass.mngAttend.model.dao.AttendDao;

public class AttendService {

	public ArrayList<Object> selectClassList() {
		Connection con = getConnection();
		
		ArrayList<Object> list = new AttendDao().selectClassList(con);
		
		return list;
	}

}
