package hagong.academy.mngStudent.mngInfo.model.service;

import static hagong.common.JDBCTemplate.close;
import static hagong.common.JDBCTemplate.commit;
import static hagong.common.JDBCTemplate.getConnection;
import static hagong.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;

import hagong.academy.mngStudent.mngBlack.model.dao.BlacklistDao;
import hagong.academy.mngStudent.mngBlack.model.vo.BlacklistInfo;
import hagong.academy.mngStudent.mngInfo.model.dao.StudentDao;
import hagong.academy.mngStudent.mngInfo.model.vo.Student;
import hagong.academy.mngStudent.mngInfo.model.vo.StudentProfile;

public class StudentService {

	public int findUserNo(String userId) {
		Connection con = getConnection();

		int userNo = new StudentDao().findUserNo(con, userId);

		close(con);

		return userNo;
	}

	public int insertParent(Student s) {
		Connection con = getConnection();
		int refresult = new StudentDao().insertParent(con, s);

		if (refresult > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return refresult;
	}

	public int insertMember(Student s, ArrayList<StudentProfile> fileList) {
		Connection con = getConnection();

		int result = new StudentDao().insertMember(con, s);

		if (result > 0) {
			int studentNo = new StudentDao().selectUserNo(con, s);
			s.setUserNo(studentNo);
			for (int i = 0; i < fileList.size(); i++) {
				fileList.get(i).setUserNo(studentNo);
			}

			commit(con);
			int result1 = new StudentDao().insertStudent(con, s);
			if (result1 > 0) {
				commit(con);
				int result2 = new StudentDao().insertStudentHope(con, s);
				if (result2 > 0) {
					commit(con);
					int resultFile = new StudentDao().insertFile(con, fileList);

					if (resultFile > 0) {
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

	public int updateStudent(Student s, ArrayList<StudentProfile> fileList) {
		Connection con = getConnection();

		// 학생 정보수정
		int result = new StudentDao().updateMember(con, s);
		if (result > 0) {
			commit(con);
			if (fileList != null) {
				for (int i = 0; i < fileList.size(); i++) {
					fileList.get(i).setUserNo(s.getUserNo());
				}
			}
			// 학부모 정보수정
			int result1 = new StudentDao().updateParent(con, s);
			if (result1 > 0) {
				commit(con);
				// 학교 정보수정
				int result2 = new StudentDao().updateStudent(con, s);
				if (result2 > 0) {
					commit(con);
					// 희망학교학과 정보수정
					int result3 = new StudentDao().updateStudentHope(con, s);
					if (result3 > 0) {
						commit(con);
						if (fileList != null) {
							int fileresult = new StudentDao().insertFile(con, fileList);
							if (fileresult > 0) {
								commit(con);
								for (int i = 0; i < fileList.size(); i++) {
									int profileCnt = new StudentDao().selectProfileCnt(con, s.getUserNo());
									if (profileCnt > 1) {
										int fileNo = new StudentDao().selectFileNo(con, fileList.get(i));
										int updateOldProfileResult = new StudentDao().updateOldProfile(con, fileNo,
												s.getUserNo());
										if (updateOldProfileResult > 0) {
											commit(con);
										} else {
											rollback(con);
										}
									}
								}
							} else {
								rollback(con);
							}
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
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

	public int deleteStudent(String userId) {
		Connection con = getConnection();

		int result = new StudentDao().deleteStudent(con, userId);

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

	public ArrayList<Student> selectList(int currentPage, int limit) {
		Connection con = getConnection();

		ArrayList<Student> list = new StudentDao().selectList(con, currentPage, limit);

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

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

	public Student selectStudentInfo(String userNo) {
		Connection con = getConnection();
		Student s = new StudentDao().selectStudentInfo(con, userNo);

		close(con);

		return s;
	}

	public ArrayList<Student> searchScore(String condition, String op, String userId) {
		Connection con = getConnection();
		ArrayList<Student> list = null;
		if (condition.equals("YEAR")) {
			list = new StudentDao().searchYearScore(con, op, userId);
		} else if (condition.equals("SUB_ID")) {
			list = new StudentDao().searchSubidScore(con, op, userId);
		} else {
			list = new StudentDao().searchTypeScore(con, op, userId);
		}

		close(con);

		return list;
	}

	public ArrayList<Student> searchAllScore(String userId) {
		Connection con = getConnection();
		ArrayList<Student> list = new StudentDao().searchAllScore(con, userId);

		close(con);

		return list;
	}

	public ArrayList<StudentProfile> selectProfile(String userNo) {
		Connection con = getConnection();
		ArrayList<StudentProfile> list = new StudentDao().selectProfile(con, userNo);

		close(con);

		return list;
	}

	public int listCount() {
		Connection con = getConnection();

		int listCount = new StudentDao().listCount(con);

		close(con);

		return listCount;
	}

	public ArrayList<Student> selectList(int currentPage, int limit, String searchCondition, String srchCnt) {
		Connection con = getConnection();
		ArrayList<Student> list = new StudentDao().selectList(con, currentPage, limit, searchCondition, srchCnt);

		close(con);

		return list;
	}

	public ArrayList<Student> refIdCheck(String refId, int check) {
		Connection con = getConnection();
		ArrayList<Student> list = new StudentDao().refIdCheck(con, refId, check);

		close(con);

		return list;
	}

}
