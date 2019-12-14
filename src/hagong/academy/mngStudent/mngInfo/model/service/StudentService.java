package hagong.academy.mngStudent.mngInfo.model.service;

import static hagong.common.JDBCTemplate.close;
import static hagong.common.JDBCTemplate.commit;
import static hagong.common.JDBCTemplate.getConnection;
import static hagong.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import hagong.academy.mngStudent.mngInfo.model.dao.StudentDao;
import hagong.academy.mngStudent.mngInfo.model.vo.Student;
import hagong.academy.mngStudent.mngInfo.model.vo.StudentProfile;
public class StudentService {

	public int findUserNo(String userId) {
		Connection con = getConnection();
		
		int userNo = new StudentDao().findUserNo(con, userId);
		System.out.println("userNo : " + userNo);
		
		close(con);
		
		return userNo;
	}
	
	public int insertMember(Student s, ArrayList<StudentProfile> fileList) {
		Connection con = getConnection();
		
		int result = new StudentDao().insertMember(con, s);
		
		System.out.println("result : " + result);
		if (result > 0) {
			int studentNo = new StudentDao().selectUserNo(con, s); 
			s.setUserNo(studentNo);
			System.out.println("studentNo : " + studentNo);
			for(int i = 0; i < fileList.size(); i++) {
				fileList.get(i).setUserNo(studentNo);
			}
			
			commit(con);
			int result1 = new StudentDao().insertStudent(con, s);
			System.out.println("result1 : " + result1);
			if(result1 > 0) {
				commit(con);
				int result2 = new StudentDao().insertStudentHope(con, s);
				
				System.out.println("result2 : " + result2);
				if(result2 > 0) {
					commit(con);
					int resultFile = new StudentDao().insertFile(con, fileList);
					
					if(resultFile > 0) {
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
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int updateStudent(Student s) {
		Connection con = getConnection();
		
		//학생 정보수정
		int result = new StudentDao().updateMember(con, s);
		if (result > 0) {
			commit(con);
			//학부모 정보수정
			int result1 = new StudentDao().updateParent(con, s);
			if(result1 > 0) {
				commit(con);
				//학교 정보수정
				int result2 = new StudentDao().updateStudent(con, s);
				if(result2 > 0) {
					commit(con);
					//희망학교학과 정보수정
					int result3 = new StudentDao().updateStudentHope(con,s);
					if(result3 > 0) {
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

	public int insertStudent(Student s) {
		Connection con = getConnection();
		int result = new StudentDao().insertStudent(con, s);
		
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

	public ArrayList<Student> selectStudent(String userId) {
		Connection con = getConnection();
		ArrayList<Student> sList = new StudentDao().selectStudent(con, userId);
		
		close(con);
		
		return sList;
	}

	public int insertScore(Student s) {
		Connection con = getConnection();
		int result = new StudentDao().insertScore(con, s);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public Student selectStudentInfo(String userId) {
		Connection con = getConnection();
		Student s = new StudentDao().selectStudentInfo(con, userId);
		
		close(con);
		
		return s;
	}

}
