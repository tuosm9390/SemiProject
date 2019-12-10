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
	
	public int insertStudent(Connection con, Student s) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertStudent");
		
		try {
			pstmt = con.prepareStatement(query);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
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
