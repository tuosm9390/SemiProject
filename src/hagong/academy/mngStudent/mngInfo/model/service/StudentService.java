package hagong.academy.mngStudent.mngInfo.model.service;

import static hagong.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import hagong.academy.mngStudent.mngInfo.model.dao.StudentDao;
import hagong.academy.mngStudent.mngInfo.model.vo.Student;
public class StudentService {

	public int findRefUno(String refId) {
		Connection con = getConnection();
		
		int refUno = new StudentDao().refUno(con, refId);
		System.out.println("refUno : " + refUno);
		
		return refUno;
	}
	
	public int insertMember(Student s) {
		Connection con = getConnection();
		
		int result = new StudentDao().insertMember(con, s);
		
		System.out.println("result : " + result);
		if (result > 0) {
			commit(con);
			int result1 = new StudentDao().insertStudent(con, s);
			
			System.out.println("result1 : " + result1);
			if(result1 > 0) {
				commit(con);
				int result2 = new StudentDao().insertStudentHope(con, s);
				
				System.out.println("result2 : " + result2);
				if(result2 > 0) {
					commit(con);
				} else {
					rollback(con);
				}
			} else {
				rollback(con);
			}
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int updateStudent(Student s) {
		Connection con = getConnection();
		
		int result = new StudentDao().updateStudent(con, s);
		
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);
		
		return result;
	}

	public int deleteStudent(Student s) {
		Connection con = getConnection();
		
		int result = new StudentDao().deleteStudent(con, s);
		
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);
		
		return result;
	}

	public int insertStudent() {
		Connection con = getConnection();
		int result = new StudentDao().insertStudent(con);
		
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);
		
		return result;
	}

	public ArrayList<Student> selectList() {
		Connection con = getConnection();

		ArrayList<Student> list = new StudentDao().selectList(con);
		
		close(con);
		
		return list;
	}

}
