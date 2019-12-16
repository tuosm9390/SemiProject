package hagong.academy.mngClass.mngCS.model.dao;

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

import hagong.academy.mngClass.mngCS.model.vo.CS;
import hagong.academy.mngClass.mngCS.model.vo.CSStudent;

public class CSDao {
	Properties prop = new Properties();
	
	public CSDao() {
		String fileName = CSDao.class.getResource("/sql/class/cs-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<CS> selectCSlistWithPaging(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<CS> cslist = null;
		
		String query = prop.getProperty("selectCSlistWithPaging");
		
		//조회를 시작할 행 번호와 마지막 행 번호 계산
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit -1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			cslist = new ArrayList<>();
			
			while(rset.next()) {
				CS cs = new CS();
				
				cs.setRnum(rset.getInt("RNUM"));
				cs.setClsNo(rset.getInt("CLS_NO"));
				cs.setClsName(rset.getString("CLS_NAME"));
				cs.setName(rset.getString("NAME"));
				cs.setClsStart(rset.getDate("CLS_START"));
				cs.setClsEnd(rset.getDate("CLS_END"));
				cs.setClassName(rset.getString("CLR_NAME"));
				
				cslist.add(cs);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return cslist;
	}

	public ArrayList<CSStudent> detailCSStudent(Connection con, int clsNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<CSStudent> csslist = null;
		
		String query = prop.getProperty("selectDetailCSStudent");
		
		try {
			pstmt = con.prepareStatement(query);
		
			pstmt.setInt(1, clsNo);
			
			rset = pstmt.executeQuery();
			
			
			csslist = new ArrayList<>();
			while(rset.next()) {
				CSStudent css = new CSStudent();
				
				css.setClassName(rset.getString("CLR_NAME"));
				css.setClrNo(rset.getInt("CLR_NO"));
				css.setClsDay(rset.getString("CLS_DAY"));
				css.setClsEnd(rset.getDate("CLS_END"));
				css.setClsMax(rset.getInt("CLS_MAX"));
				css.setClsName(rset.getString("CLS_NAME"));
				css.setClsNo(rset.getInt("CLS_NO"));
				css.setClsStart(rset.getDate("CLS_START"));
				css.setClsStudent(rset.getString("CLS_STUDENT"));
				css.setClsTime(rset.getString("CLS_TIME"));
				css.setGrade(rset.getInt("GRADE"));
				css.setSchool(rset.getString("SCHOOL"));
				css.setTchName(rset.getString("TC_NAME"));
				css.setTuition(rset.getInt("TUITION"));
				css.setUserId(rset.getString("ST_ID"));
				css.setUserNo(rset.getInt("USER_NO"));
				css.setStuName(rset.getString("ST_NAME"));
				
				switch(css.getGrade()) {
				case 1: css.setGradeName("중등 1학년");break;
				case 2: css.setGradeName("중등 2학년");break;
				case 3: css.setGradeName("중등 3학년");break;
				case 4: css.setGradeName("고등 1학년");break;
				case 5: css.setGradeName("고등 2학년");break;
				case 6: css.setGradeName("고등 3학년");break;
				}
				
				switch(css.getClsStudent()) {
				case "MID1": css.setClsStudentName("중등 1학년");break;
				case "MID2": css.setClsStudentName("중등 2학년");break;
				case "MID3": css.setClsStudentName("중등 3학년");break;
				case "HIGH1": css.setClsStudentName("고등 1학년");break;
				case "HIGH2": css.setClsStudentName("고등 2학년");break;
				case "HIGH3": css.setClsStudentName("고등 3학년");break;
				case "ETC": css.setClsStudentName("기타");break;
				}
				
				System.out.println("DB에서 받아온 리스트 : " + css);
				
				csslist.add(css);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return csslist;
	}

	public int listCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("selectListCount");
		
		try {
			stmt = con.createStatement();
		
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		
		
		return listCount;
	}

	public ArrayList<CSStudent> selectAllCS(Connection con, int clsNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<CSStudent> allStudent = null;
		
		String query = prop.getProperty("selectAllCS");
		
		try {
			pstmt = con.prepareStatement(query);
		
			pstmt.setInt(1, clsNo);
			
			rset = pstmt.executeQuery();
			
			
			allStudent = new ArrayList<>();
			while(rset.next()) {
				CSStudent css = new CSStudent();
				
			
				css.setGrade(rset.getInt("GRADE"));
				css.setSchool(rset.getString("SCHOOL"));
				css.setStuName(rset.getString("NAME"));
				css.setUserId(rset.getString("USER_ID"));
				css.setUserNo(rset.getInt("UNO"));
				
				switch(css.getGrade()) {
				case 1: css.setGradeName("중등 1학년");break;
				case 2: css.setGradeName("중등 2학년");break;
				case 3: css.setGradeName("중등 3학년");break;
				case 4: css.setGradeName("고등 1학년");break;
				case 5: css.setGradeName("고등 2학년");break;
				case 6: css.setGradeName("고등 3학년");break;
				}
				
				allStudent.add(css);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return allStudent;
	}
	
	
	
}
