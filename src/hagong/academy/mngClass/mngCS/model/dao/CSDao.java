package hagong.academy.mngClass.mngCS.model.dao;

import static hagong.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
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
		} finally {
			close(pstmt);
			close(rset);
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
				
				
				csslist.add(css);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
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
				css.setUserNo(rset.getInt("USER_NO"));
				
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
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		return allStudent;
	}

	public CSStudent detailCSInfo(Connection con, int clsNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		CSStudent csInfo = null;
		
		String query = prop.getProperty("selectCsInfo");
		
		try {
			pstmt = con.prepareStatement(query);
		
			pstmt.setInt(1, clsNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				csInfo = new CSStudent();
				
				csInfo.setClassName(rset.getString("CLR_NAME"));
				csInfo.setClrNo(rset.getInt("CLR_NO"));
				csInfo.setClsDay(rset.getString("CLS_DAY"));
				csInfo.setClsEnd(rset.getDate("CLS_END"));
				csInfo.setClsMax(rset.getInt("CLS_MAX"));
				csInfo.setClsName(rset.getString("CLS_NAME"));
				csInfo.setClsNo(rset.getInt("CLS_NO"));
				csInfo.setClsStart(rset.getDate("CLS_START"));
				csInfo.setClsStudent(rset.getString("CLS_STUDENT"));
				csInfo.setClsTime(rset.getString("CLS_TIME"));
				csInfo.setTchName(rset.getString("NAME"));
				csInfo.setTuition(rset.getInt("TUITION"));
				
				
				switch(csInfo.getClsStudent()) {
				case "MID1": csInfo.setClsStudentName("중등 1학년");break;
				case "MID2": csInfo.setClsStudentName("중등 2학년");break;
				case "MID3": csInfo.setClsStudentName("중등 3학년");break;
				case "HIGH1": csInfo.setClsStudentName("고등 1학년");break;
				case "HIGH2": csInfo.setClsStudentName("고등 2학년");break;
				case "HIGH3": csInfo.setClsStudentName("고등 3학년");break;
				case "ETC": csInfo.setClsStudentName("기타");break;
				}
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return csInfo;
	}

	public int insertCS(Connection con, int clsNo, int stuNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("insertCS");
		
		try {
			pstmt = con.prepareStatement(query);
		
			pstmt.setInt(1, clsNo);
			pstmt.setInt(2, stuNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertPurchase(Connection con, int clsNo, int stuNo, Date date, int j) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("insertPurchase");
		
		try {
			pstmt = con.prepareStatement(query);
		
			pstmt.setInt(1, stuNo);
			pstmt.setInt(2, clsNo);
			pstmt.setDate(3, date);
			pstmt.setInt(4, j);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	public int deleteCS(Connection con, int clsNo, int stuAllNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("deleteCS");
		
		try {
			pstmt = con.prepareStatement(query);
		
			pstmt.setInt(1, stuAllNo);
			pstmt.setInt(2, clsNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteCSPurchase(Connection con, int clsNo, int stuAllNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("deletePurchase");
		
		try {
			pstmt = con.prepareStatement(query);
		
			pstmt.setInt(1, stuAllNo);
			pstmt.setInt(2, clsNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	public ArrayList<CS> searchCSlistWithPaging(Connection con, int currentPage, int limit, String searchCondition,
			String srchCnt) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<CS> cslist = null;
		
		String query = "";
		if(searchCondition.equals("title")) {
			query = prop.getProperty("selectCSlistByClassName");
		}else if(searchCondition.equals("place")){
			query = prop.getProperty("selectCSlistByClassRoom");
		}
		//조회를 시작할 행 번호와 마지막 행 번호 계산
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit -1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, srchCnt);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
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
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return cslist;
	}

	public HashMap<String, Object> getMonths(Connection con, int clsNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> MonthsInfo = null;
		
		String query = prop.getProperty("getMonths");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, clsNo);
			
			rset = pstmt.executeQuery();
			
			MonthsInfo = new HashMap<>();
			if(rset.next()) {
				CS cs = new CS();
				cs.setClsStart(rset.getDate("CLS_START"));
				int months = rset.getInt("MONTH");
				Integer month = months;
				
				MonthsInfo.put("CS", cs);
				MonthsInfo.put("month", month);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return MonthsInfo;
	}

	public ArrayList<CSStudent> srchByName(Connection con, String name, int clsNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<CSStudent> srchStu = null;
		
		String query = prop.getProperty("srchStudentByName");
		
		try {
			pstmt = con.prepareStatement(query);
		
			pstmt.setInt(1, clsNo);
			pstmt.setString(2, name);
			
			rset = pstmt.executeQuery();
			
			
			srchStu = new ArrayList<>();
			while(rset.next()) {
				CSStudent css = new CSStudent();
				
			
				css.setGrade(rset.getInt("GRADE"));
				css.setSchool(rset.getString("SCHOOL"));
				css.setStuName(rset.getString("NAME"));
				css.setUserId(rset.getString("USER_ID"));
				css.setUserNo(rset.getInt("USER_NO"));
				
				switch(css.getGrade()) {
				case 1: css.setGradeName("중등 1학년");break;
				case 2: css.setGradeName("중등 2학년");break;
				case 3: css.setGradeName("중등 3학년");break;
				case 4: css.setGradeName("고등 1학년");break;
				case 5: css.setGradeName("고등 2학년");break;
				case 6: css.setGradeName("고등 3학년");break;
				}
				
				srchStu.add(css);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		return srchStu;
	}

	public ArrayList<CSStudent> srchByName2(Connection con, String name, int clsNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<CSStudent> srchStu = null;
		
		String query = prop.getProperty("srchStudentByName2");
		
		try {
			pstmt = con.prepareStatement(query);
		
			pstmt.setInt(1, clsNo);
			pstmt.setString(2, name);
			
			rset = pstmt.executeQuery();
			
			
			srchStu = new ArrayList<>();
			while(rset.next()) {
				CSStudent css = new CSStudent();
				
			
				css.setGrade(rset.getInt("GRADE"));
				css.setSchool(rset.getString("SCHOOL"));
				css.setStuName(rset.getString("NAME"));
				css.setUserId(rset.getString("USER_ID"));
				css.setUserNo(rset.getInt("USER_NO"));
				
				switch(css.getGrade()) {
				case 1: css.setGradeName("중등 1학년");break;
				case 2: css.setGradeName("중등 2학년");break;
				case 3: css.setGradeName("중등 3학년");break;
				case 4: css.setGradeName("고등 1학년");break;
				case 5: css.setGradeName("고등 2학년");break;
				case 6: css.setGradeName("고등 3학년");break;
				}
				
				srchStu.add(css);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		return srchStu;
	}
	
	
	
}
