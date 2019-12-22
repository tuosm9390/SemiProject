package hagong.academy.mngClass.mngClassList.model.service;

import static hagong.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import hagong.academy.mngClass.mngAttend.model.dao.AttendDao;
import hagong.academy.mngClass.mngAttend.model.vo.ClassSubject;
import hagong.academy.mngClass.mngClassList.model.dao.ClassDao;
import hagong.academy.mngClass.mngClassList.model.vo.Class;
import hagong.academy.mngClass.mngClassList.model.vo.Classroom;
import hagong.academy.mngStudent.mngBlack.model.dao.BlacklistDao;

public class ClassService {

	public ArrayList<Class> selectClassList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Class> list = new ClassDao().selectClassList(con, currentPage, limit);
		
		close(con);		
		
		return list;
	}

	public Class selectOneClass(String clsNo) {
		Connection con = getConnection();
		
		Class classDetail = new ClassDao().selectOneClass(con, clsNo);
		
		close(con);
		
		return classDetail;
	}
	
	public int deleteClass(String clsNo) {
		Connection con = getConnection();
		
		int result = new ClassDao().deleteClass(con, clsNo);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<Class> selectTeacher(String subject) {
		Connection con = getConnection();
		
		ArrayList<Class> teacherList = new ClassDao().selectTeacher(con, subject);
		
		close(con);
		
		return teacherList;
	}

	public int insertClass(Class c1) {
		Connection con = getConnection();
		int result = 0;
		
		Class c = new Class();
			
			c.setSubId(c1.getSubId());
			c.setUserNo(c1.getUserNo());
			c.setClsName(c1.getClsName());
			c.setClsStudent(c1.getClsStudent());
			c.setClsMax(c1.getClsMax());
			c.setClsStart(c1.getClsStart());
			c.setClsEnd(c1.getClsEnd());
			c.setClsDay(c1.getClsDay());
			c.setClrNo(c1.getClrNo());
			c.setClsTime(c1.getClsTime());
			c.setTuition(c1.getTuition());
			c.setCntOfClass(c1.getCntOfClass());
			
			result = new ClassDao().insertClass(con, c);
			
			if(result > 0) {
				commit(con);
			}else {
				rollback(con);
			}
			
		close(con);

		return result;
	}

	public int listCount() {
		Connection con = getConnection();
		
		int listCount = new ClassDao().listCount(con);
		
		close(con);
		
		return listCount;
	}

	public int updateClass(Class c1) {
		Connection con = getConnection();
		int result = 0;
		
		Class c = new Class();
		
		c.setClsNo(c1.getClsNo());
		c.setClsName(c1.getClsName());
		c.setClsMax(c1.getClsMax());			
		c.setClrNo(c1.getClrNo());
		c.setTuition(c1.getTuition());
		c.setCntOfClass(c1.getCntOfClass());
			
		result = new ClassDao().updateClass(con, c);
			
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);

		return result;
	}

	public int insertClassroom(Classroom cr) {
		Connection con = getConnection();
		
		int result = new ClassDao().insertClassroom(con, cr);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<Classroom> selectClassroom() {
		Connection con = getConnection();
		
		ArrayList<Classroom> list = new ClassDao().selectClassroom(con);
		
		close(con);
		
		return list;
	}

	public int deleteClassroom(String clrNo) {
		Connection con = getConnection();
		
		int result = new ClassDao().deleteClassroom(con, clrNo);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<Class> searchClass(String selectCondition, String searchWord) {
		Connection con = getConnection();
		
		ArrayList<Class> list = new ClassDao().searchClass(con, selectCondition, searchWord);
		
		close(con);
		
		return list;
	}

}
