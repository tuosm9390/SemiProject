package hagong.academy.mngClass.mngAttend.model.service;

import static hagong.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import hagong.academy.mngClass.mngAttend.model.dao.AttendDao;
import hagong.academy.mngClass.mngAttend.model.vo.ClassSubject;

public class AttendService {

	public ArrayList<ClassSubject> selectClassList() {
		Connection con = getConnection();
		
		ArrayList<ClassSubject> list = new AttendDao().selectClassList(con);
		
		close(con);
		
		return list;
	}

	public ArrayList<ClassSubject> searchClass(String selectCondition, String searchWord) {
		Connection con = getConnection();
		
		ArrayList<ClassSubject> list = new AttendDao().searchClass(con, selectCondition, searchWord);
		
		close(con);
		
		return list;
	}

}
