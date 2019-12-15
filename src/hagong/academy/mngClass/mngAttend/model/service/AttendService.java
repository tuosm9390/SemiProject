package hagong.academy.mngClass.mngAttend.model.service;

import static hagong.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import hagong.academy.mngClass.mngAttend.model.dao.AttendDao;
import hagong.academy.mngClass.mngAttend.model.vo.Attendance;
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

	public ArrayList<HashMap<String, Object>> selectStudent(String classNum) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new AttendDao().selectStudent(con, classNum);
		
		close(con);
		
		return list;
	}

	public ArrayList<Attendance> selectAttendList(String name) {  
		Connection con = getConnection();
		
		ArrayList<Attendance> list = new AttendDao().selectAttendList(con, name);
		
		close(con);
		
		return list;
	}

	public String selectAttendReason(String classNum, String date, String userNo) {
		Connection con = getConnection();
		
		String reason = new AttendDao().selectAttendReason(con, classNum, date, userNo);
		
		close(con);
		
		return reason;
	}

	public int updateAttendReason(String classNum, String date, int userNo, String content) {
		Connection con = getConnection();
		
		int result = new AttendDao().updateAttendReason(con, classNum, date, userNo, content);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int updateAttend(String classNum, String attStatus, String[] students) {
		System.out.println("Service로 넘어옴");
		Connection con = getConnection();
		int result = 0;
		
		
		for(int i=0; i<students.length; i++) {
			System.out.println("for문으로 들어옴");
			result = new AttendDao().updateAttend(con, classNum, attStatus, students[i]);
			System.out.println("dao로부터 결과값을 받아옴 : " + result + "개");
			
			if(result > 0) {
				commit(con);
				
			}else {
				rollback(con);
			}
		}
		
		close(con);
		
		
		return result;
	}



	

}
