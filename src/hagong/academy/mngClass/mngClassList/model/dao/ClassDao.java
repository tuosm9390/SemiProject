package hagong.academy.mngClass.mngClassList.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import hagong.academy.mngClass.mngAttend.model.vo.ClassSubject;
import hagong.academy.mngClass.mngClassList.model.vo.Class;
import hagong.academy.mngClass.mngClassList.model.vo.Classroom;
import hagong.academy.mngStudent.mngBlack.model.vo.BlacklistInfo;

import static hagong.common.JDBCTemplate.*;

public class ClassDao {
	private Properties prop = new Properties();
	
	public ClassDao() {
		String fileName = ClassDao.class.getResource("/sql/class/class-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Class> selectClassList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Class> list = null;
		
		//조회를 시작할 행 번호와 마지막 행 번호 계산
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit -1;
		
		String query = prop.getProperty("selectClassList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			while(rset.next()) {
				Class c = new Class();
				
				c.setClsNo(rset.getInt("CLS_NO"));
				c.setSubId(rset.getString("SUB_ID"));
				c.setClsName(rset.getString("CLS_NAME"));
				c.setName(rset.getString("NAME"));
				c.setClsStudent(rset.getString("CLS_STUDENT"));
				c.setClsMax(rset.getInt("CLS_MAX"));
				c.setClsStart(rset.getDate("CLS_START"));
				c.setClsEnd(rset.getDate("CLS_END"));
				
				list.add(c);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return list;
	}

	public Class selectOneClass(Connection con, String clsNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Class classDetail = null;
		
		String query = prop.getProperty("selectOneClass");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(clsNo));
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				classDetail = new Class();
				
				classDetail.setClsNo(rset.getInt("CLS_NO"));
				classDetail.setSubName(rset.getString("SUB_NAME"));
				classDetail.setClsName(rset.getString("CLS_NAME"));
				classDetail.setName(rset.getString("NAME"));
				classDetail.setClsStudent(rset.getString("CLS_STUDENT"));
				classDetail.setClsMax(rset.getInt("CLS_MAX"));
				classDetail.setClsStart(rset.getDate("CLS_START"));
				classDetail.setClsEnd(rset.getDate("CLS_END"));
				classDetail.setClsTime(rset.getString("CLS_TIME"));
				classDetail.setTuition(rset.getInt("TUITION"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}		
		
		
		return classDetail;
	}
	
	public int deleteClass(Connection con, String clsNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteClass");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(clsNo));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}	
		
		return result;
	}

	public ArrayList<Class> selectTeacher(Connection con, String subject) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Class> list = null;
		
		String query = prop.getProperty("selectTeacher"); 
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, subject);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			while(rset.next()) {
				Class c = new Class();
				
				c.setName(rset.getString("NAME"));
				c.setUserNo(rset.getInt("USER_NO"));
				
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public int insertClass(Connection con, Class c) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertClass");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, c.getSubId());
			pstmt.setInt(2, c.getUserNo());
			pstmt.setString(3, c.getClsName());
			pstmt.setString(4, c.getClsStudent());
			pstmt.setInt(5, c.getClsMax());
			pstmt.setDate(6, c.getClsStart());
			pstmt.setString(7, c.getClsDay());
			pstmt.setString(8, c.getClsTime());
			pstmt.setInt(9, c.getClrNo());
			pstmt.setInt(10, c.getTuition());
			pstmt.setDate(11, c.getClsEnd());
			
			result = pstmt.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
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

	public int updateClass(Connection con, Class c) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateClass");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, c.getClsName());
			pstmt.setInt(2, c.getClsMax());
			pstmt.setInt(3, c.getClrNo());
			pstmt.setInt(4, c.getTuition());
			pstmt.setInt(5, c.getCntOfClass());
			pstmt.setInt(6, c.getClsNo());
			
			result = pstmt.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertClassroom(Connection con, Classroom cr) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertClassroom");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, cr.getClrName());
			pstmt.setInt(2, cr.getCapacity());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}

	public ArrayList<Classroom> selectClassroom(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Classroom> list = null;
		
		String query = prop.getProperty("selectClassroom");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<>();
			while(rset.next()) {
				Classroom cr = new Classroom();
				
				cr.setClrNo(rset.getInt("CLR_NO"));
				cr.setClrName(rset.getString("CLR_NAME"));
				cr.setCapacity(rset.getInt("CAPACITY"));
				
				list.add(cr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}		
		
		return list;
	}

	public int deleteClassroom(Connection con, String clrNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteClassroom");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(clrNo));
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Class> selectClassList(Connection con, int currentPage, int limit, String selectCondition,
			String searchWord) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Class> list = null;
		
		//조회를 시작할 행 번호와 마지막 행 번호 계산
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit -1;
		
		if(selectCondition.equals("과목")) {
			String query = prop.getProperty("searchClassBySubId");
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, searchWord);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				
				rset = pstmt.executeQuery();
				
				list = new ArrayList<>();
				while(rset.next()) {
					Class c = new Class();
					
					c.setSubId(rset.getString("SUB_ID"));
					c.setClsName(rset.getString("CLS_NAME"));
					c.setName(rset.getString("NAME"));
					c.setClsStudent(rset.getString("CLS_STUDENT"));
					c.setClsMax(rset.getInt("CLS_MAX"));
					c.setClsStart(rset.getDate("CLS_START"));
					c.setClsEnd(rset.getDate("CLS_END"));	
					
					list.add(c);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rset);
			}
			
		}else if(selectCondition.equals("강좌명")) {
			String query = prop.getProperty("searchClassByClsName");
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, searchWord);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				
				rset = pstmt.executeQuery();
				
				list = new ArrayList<>();
				while(rset.next()) {
					Class c = new Class();
					
					c.setSubId(rset.getString("SUB_ID"));
					c.setClsName(rset.getString("CLS_NAME"));
					c.setName(rset.getString("NAME"));
					c.setClsStudent(rset.getString("CLS_STUDENT"));
					c.setClsMax(rset.getInt("CLS_MAX"));
					c.setClsStart(rset.getDate("CLS_START"));
					c.setClsEnd(rset.getDate("CLS_END"));	
					
					list.add(c);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rset);
			}
			
		}else if(selectCondition.equals("담당 강사")) {
			String query = prop.getProperty("searchClassByName");
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, searchWord);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				
				rset = pstmt.executeQuery();
				
				list = new ArrayList<>();
				while(rset.next()) {
					Class c = new Class();
					
					c.setSubId(rset.getString("SUB_ID"));
					c.setClsName(rset.getString("CLS_NAME"));
					c.setName(rset.getString("NAME"));
					c.setClsStudent(rset.getString("CLS_STUDENT"));
					c.setClsMax(rset.getInt("CLS_MAX"));
					c.setClsStart(rset.getDate("CLS_START"));
					c.setClsEnd(rset.getDate("CLS_END"));	
					
					list.add(c);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rset);
			}
		}
		
		
		
		return list;
	}

	

}
