package hagong.academy.mngStudent.mngInfo.model.dao;

import static hagong.common.JDBCTemplate.close;

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

	public int updateStudent(Connection con, Student s) {
		PreparedStatement pstmt = null;
		int result = 0;

		return result;
	}

	public int deleteStudent(Connection con, Student s) {
		PreparedStatement pstmt = null;
		int result = 0;

		return result;
	}

	public int insertStudent(Connection con) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("select");

		try {
			pstmt = con.prepareStatement(query);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public ArrayList<Student> selectList(Connection con) {
		ArrayList<Student> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Student>();
			
			while(rset.next()) {
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
			close(stmt);
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
			
			if(rset.next()) {
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
			for(int i = 0; i < fileList.size(); i++) {
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

	public Student selectStudent(Connection con, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Student s = null;
		
		String query = prop.getProperty("selectStudent");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				s = new Student();
				
				s.setUserId(rset.getString("USER_ID"));
				s.setName(rset.getString("NAME"));
				s.setSchool(rset.getString("SCHOOL"));
				s.setGrade(rset.getInt("GRADE"));
				s.setEmail(rset.getString("EMAIL"));
				s.setPhone(rset.getString("PHONE"));
				s.setRefPhone(rset.getString("REF_PHONE"));
				s.setMajor(rset.getString("MAJOR"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return s;
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

	public ArrayList<Student> scoreList(Connection con, Student s) {
		PreparedStatement pstmt = null;
		ArrayList<Student> list = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("scoreList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, s.getUserId());
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				
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

}
