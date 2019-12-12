package hagong.academy.mngStudent.mngInfo.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import static hagong.common.JDBCTemplate.*;

import hagong.academy.mngStudent.mngInfo.model.vo.Student;

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
			pstmt.setString(8, s.getRefId());
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
			pstmt.setString(3, s.getUserId());
			
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

}
