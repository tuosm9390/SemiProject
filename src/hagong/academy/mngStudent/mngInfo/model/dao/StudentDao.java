package hagong.academy.mngStudent.mngInfo.model.dao;

import static hagong.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import hagong.academy.mngStudent.mngInfo.model.vo.Student;
import hagong.academy.mngStudent.mngInfo.model.vo.StudentProfile;

public class StudentDao {
	private Properties prop = new Properties();

	public StudentDao() {
		String fileName = StudentDao.class.getResource("/sql/student/student-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int findUserNo(Connection con, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int userNo = 0;

		String query = "SELECT USER_NO FROM MEMBER WHERE USER_ID = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				userNo = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return userNo;
	}

	public int insertParent(Connection con, Student s) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertParent");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, s.getRefName());
			pstmt.setString(2, s.getRefId());
			pstmt.setString(3, s.getUserPwd());
			pstmt.setDate(4, s.getBirth());
			pstmt.setString(5, s.getPhone());
			pstmt.setString(6, s.getAddress());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertMember(Connection con, Student s) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertMember");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, s.getName());
			pstmt.setString(2, s.getUserId());
			pstmt.setString(3, s.getUserPwd());
			pstmt.setDate(4, s.getBirth());
			pstmt.setString(5, s.getPhone());
			pstmt.setString(6, s.getAddress());
			pstmt.setString(7, s.getEmail());
			pstmt.setInt(8, s.getRefUno());
			pstmt.setString(9, s.getInflowPath());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertStudent(Connection con, Student s) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertStudent");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, s.getSchool());
			pstmt.setInt(2, s.getGrade());
			pstmt.setString(3, s.getTrack());
			pstmt.setString(4, s.getUserId());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertStudentHope(Connection con, Student s) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertStudentHope");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, s.getUserId());
			pstmt.setString(2, s.getCollege());
			pstmt.setString(3, s.getMajor());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updateMember(Connection con, Student s) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateMember");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, s.getName());
			pstmt.setDate(2, s.getBirth());
			pstmt.setString(3, s.getPhone());
			pstmt.setString(4, s.getAddress());
			pstmt.setString(5, s.getEmail());
			pstmt.setString(6, s.getStatus());
			pstmt.setString(7, s.getUserId());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updateParent(Connection con, Student s) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateParent");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, s.getRefName());
			pstmt.setString(2, s.getRefPhone());
			pstmt.setString(3, s.getRefId());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updateStudent(Connection con, Student s) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateStudent");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, s.getSchool());
			pstmt.setInt(2, s.getGrade());
			pstmt.setString(3, s.getTrack());
			pstmt.setString(4, s.getUserId());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updateStudentHope(Connection con, Student s) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateStudentHope");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, s.getCollege());
			pstmt.setString(2, s.getMajor());
			pstmt.setString(3, s.getUserId());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int deleteStudent(Connection con, Student s) {
		PreparedStatement pstmt = null;
		int result = 0;

		return result;
	}

	public ArrayList<Student> selectList(Connection con, int currentPage, int limit) {
		ArrayList<Student> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectList");

		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<Student>();

			while (rset.next()) {
				Student s = new Student();
				s.setUserId(rset.getString("ID"));
				s.setName(rset.getString("NAME"));
				s.setAge(rset.getInt("AGE"));
				s.setPhone(rset.getString("PHONE"));
				s.setSchool(rset.getString("SCHOOL"));
				s.setRefPhone(rset.getString("REF_PHONE"));
				s.setMajor(rset.getString("MAJOR"));

				list.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public int selectUserNo(Connection con, Student s) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int studentNo = 0;

		String query = prop.getProperty("selectUserNo");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, s.getUserId());
			rset = pstmt.executeQuery();

			if (rset.next()) {
				studentNo = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return studentNo;
	}

	public int insertFile(Connection con, ArrayList<StudentProfile> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertFile");
		try {
			for (int i = 0; i < fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, fileList.get(i).getOriginName());
				pstmt.setString(2, fileList.get(i).getChangeName());
				pstmt.setString(3, fileList.get(i).getFilePath());
				pstmt.setInt(4, fileList.get(i).getUserNo());
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Student> selectStudent(Connection con, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Student> sList = null;

		String query = prop.getProperty("selectStudent");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);

			rset = pstmt.executeQuery();

			sList = new ArrayList<Student>();

			while (rset.next()) {
				Student s = new Student();

				s.setScoreNo(rset.getInt("ROW_NUM"));
				s.setUserNo(rset.getInt("USER_NO"));
				s.setUserId(rset.getString("USER_ID"));
				s.setName(rset.getString("NAME"));
				s.setSchool(rset.getString("SCHOOL"));
				s.setGrade(rset.getInt("GRADE"));
				s.setEmail(rset.getString("EMAIL"));
				s.setPhone(rset.getString("PHONE"));
				s.setRefPhone(rset.getString("REF_PHONE"));
				s.setMajor(rset.getString("MAJOR"));
				s.setScoType(rset.getString("SCO_TYPE"));
				s.setYear(rset.getInt("YEAR"));
				s.setTerm(rset.getInt("TERM"));
				s.setSubName(rset.getString("SUB_ID"));
				s.setSubscore(rset.getInt("SCORE"));

				sList.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return sList;
	}

	public int insertScore(Connection con, Student s) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertScore");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, s.getUserNo());
			pstmt.setString(2, s.getScoType());
			pstmt.setInt(3, s.getYear());
			pstmt.setInt(4, s.getTerm());
			pstmt.setString(5, s.getSubName());
			pstmt.setInt(6, s.getSubscore());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public Student selectStudentInfo(Connection con, String userNo) {
		PreparedStatement pstmt = null;
		Student s = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectStudentInfo");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, userNo);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				s = new Student();

				s.setUserNo(rset.getInt("USER_NO"));
				s.setUserId(rset.getString("USER_ID"));
				s.setName(rset.getString("NAME"));
				s.setBirth(rset.getDate("BIRTH"));
				s.setPhone(rset.getString("PHONE"));
				s.setAddress(rset.getString("ADDRESS"));
				s.setEmail(rset.getString("EMAIL"));
				s.setRefUno(rset.getInt("REF_UNO"));
				s.setStatus(rset.getString("STATUS"));
				s.setInflowPath(rset.getString("INFLOW_PATH"));
				s.setUserType(rset.getString("USER_TYPE"));
				s.setSchool(rset.getString("SCHOOL"));
				s.setGrade(rset.getInt("GRADE"));
				s.setTrack(rset.getString("TRACK"));
				s.setCollege(rset.getString("COLLEGE"));
				s.setMajor(rset.getString("MAJOR"));
				s.setRefName(rset.getString("REF_NAME"));
				s.setRefId(rset.getString("REF_USER_ID"));
				s.setRefPhone(rset.getString("REF_PHONE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return s;
	}

	public ArrayList<Student> searchYearScore(Connection con, String op, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Student> list = null;

		String query = prop.getProperty("searchYearScore");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, op);

			rset = pstmt.executeQuery();

			list = new ArrayList<>();

			while (rset.next()) {
				Student s = new Student();

				s.setScoreNo(rset.getInt("ROW_NUM"));
				s.setScoType(rset.getString("SCO_TYPE"));
				s.setYear(rset.getInt("YEAR"));
				s.setTerm(rset.getInt("TERM"));
				s.setSubName(rset.getString("SUB_ID"));
				s.setSubscore(rset.getInt("SCORE"));

				list.add(s);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	public ArrayList<Student> searchSubidScore(Connection con, String op, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Student> list = null;

		String query = prop.getProperty("searchSubidScore");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, op);

			rset = pstmt.executeQuery();

			list = new ArrayList<>();

			while (rset.next()) {
				Student s = new Student();

				s.setScoreNo(rset.getInt("ROW_NUM"));
				s.setScoType(rset.getString("SCO_TYPE"));
				s.setYear(rset.getInt("YEAR"));
				s.setTerm(rset.getInt("TERM"));
				s.setSubName(rset.getString("SUB_ID"));
				s.setSubscore(rset.getInt("SCORE"));

				list.add(s);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	public ArrayList<Student> searchTypeScore(Connection con, String op, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Student> list = null;

		String query = prop.getProperty("searchTypeScore");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, op);

			rset = pstmt.executeQuery();

			list = new ArrayList<>();

			while (rset.next()) {
				Student s = new Student();

				s.setScoreNo(rset.getInt("ROW_NUM"));
				s.setScoType(rset.getString("SCO_TYPE"));
				s.setYear(rset.getInt("YEAR"));
				s.setTerm(rset.getInt("TERM"));
				s.setSubName(rset.getString("SUB_ID"));
				s.setSubscore(rset.getInt("SCORE"));

				list.add(s);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	public ArrayList<Student> searchAllScore(Connection con, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Student> list = null;

		String query = prop.getProperty("searchAllScore");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);

			rset = pstmt.executeQuery();

			list = new ArrayList<>();

			while (rset.next()) {
				Student s = new Student();

				s.setScoreNo(rset.getInt("ROW_NUM"));
				s.setScoType(rset.getString("SCO_TYPE"));
				s.setYear(rset.getInt("YEAR"));
				s.setTerm(rset.getInt("TERM"));
				s.setSubName(rset.getString("SUB_ID"));
				s.setSubscore(rset.getInt("SCORE"));

				list.add(s);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	public int selectProfileCnt(Connection con, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;

		String query = prop.getProperty("countProfile");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				result = rset.getInt("CNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int selectFileNo(Connection con, StudentProfile studentProfile) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int fileNo = 0;

		String query = prop.getProperty("selectFileNo");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, studentProfile.getChangeName());
			rset = pstmt.executeQuery();

			if (rset.next()) {
				fileNo = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return fileNo;
	}

	public int updateOldProfile(Connection con, int fileNo, int userNo) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteProfile");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, fileNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<StudentProfile> selectProfile(Connection con, String userNo) {
		PreparedStatement pstmt = null;
		ArrayList<StudentProfile> list = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectProfile");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, userNo);

			rset = pstmt.executeQuery();

			list = new ArrayList<>();

			while (rset.next()) {
				StudentProfile sp = new StudentProfile();

				sp.setUserNo(rset.getInt("USER_NO"));
				sp.setFileNo(rset.getInt("FILE_NO"));
				sp.setFileType(rset.getString("FILE_TYPE"));
				sp.setOriginName(rset.getString("ORIGIN_NAME"));
				sp.setChangeName(rset.getString("CHANGE_NAME"));
				sp.setFilePath(rset.getString("FILE_PATH"));
				sp.setFileStatus(rset.getString("FILE_STATUS"));

				list.add(sp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	public int listCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;

		String query = prop.getProperty("listCount");

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}

		return listCount;
	}

	public ArrayList<Student> selectList(Connection con, int currentPage, int limit, String searchCondition,
			String srchCnt) {
		ArrayList<Student> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		String query = "";

		if (searchCondition.equals("name")) {
			query = prop.getProperty("selectListByName");
		} else if (searchCondition.equals("userId")) {
			query = prop.getProperty("selectListById");
		} else if (searchCondition.equals("school")) {
			query = prop.getProperty("selectListBySchool");
		} else if (searchCondition.equals("phone")) {
			query = prop.getProperty("selectListByPhone");
		} else if (searchCondition.equals("grade")) {
			query = prop.getProperty("selectListByGrade");
		}
		
		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, srchCnt);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<Student>();

			while (rset.next()) {
				Student s = new Student();
				s.setUserId(rset.getString("ID"));
				s.setName(rset.getString("NAME"));
				s.setAge(rset.getInt("AGE"));
				s.setPhone(rset.getString("PHONE"));
				s.setSchool(rset.getString("SCHOOL"));
				s.setRefPhone(rset.getString("REF_PHONE"));
				s.setMajor(rset.getString("MAJOR"));

				list.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
}
