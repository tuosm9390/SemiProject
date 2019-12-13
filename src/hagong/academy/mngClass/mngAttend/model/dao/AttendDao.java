package hagong.academy.mngClass.mngAttend.model.dao;

import static hagong.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import hagong.academy.common.member.model.dao.MemberDao;
import hagong.academy.common.member.model.vo.Member;
import hagong.academy.mngClass.mngAttend.model.vo.Attendance;
import hagong.academy.mngClass.mngAttend.model.vo.ClassSubject;
import hagong.academy.mngClass.mngAttend.model.vo.Student;

public class AttendDao {
	private Properties prop = new Properties();
	
	public AttendDao() {
		String fileName = MemberDao.class.getResource("/sql/class/attend-query.properties").getPath();
	
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<ClassSubject> selectClassList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<ClassSubject> list = null;
		
		String query = prop.getProperty("selectClassList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				ClassSubject cs = new ClassSubject();
				
				cs.setClsNo(rset.getInt("CLS_NO"));
				cs.setSubId(rset.getString("SUB_ID"));
				cs.setClsName(rset.getString("CLS_NAME"));
				cs.setName(rset.getString("NAME"));
				cs.setClsStudent(rset.getString("CLS_STUDENT"));
				cs.setClsMax(rset.getInt("CLS_MAX"));
				cs.setClsStart(rset.getDate("CLS_START"));
				cs.setClsEnd(rset.getDate("CLS_END"));			
				
				list.add(cs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return list;
	}

	public ArrayList<ClassSubject> searchClass(Connection con, String selectCondition, String searchWord) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ClassSubject> list = null;
		
		if(selectCondition.equals("과목")) {
			String query = prop.getProperty("searchClassBySubId");
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, searchWord);
				
				rset = pstmt.executeQuery();
				
				list = new ArrayList<>();
				while(rset.next()) {
					ClassSubject cs = new ClassSubject();
					
					cs.setSubId(rset.getString("SUB_ID"));
					cs.setClsName(rset.getString("CLS_NAME"));
					cs.setName(rset.getString("NAME"));
					cs.setClsStudent(rset.getString("CLS_STUDENT"));
					cs.setClsMax(rset.getInt("CLS_MAX"));
					cs.setClsStart(rset.getDate("CLS_START"));
					cs.setClsEnd(rset.getDate("CLS_END"));	
					
					list.add(cs);
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
				
				rset = pstmt.executeQuery();
				
				list = new ArrayList<>();
				while(rset.next()) {
					ClassSubject cs = new ClassSubject();
					
					cs.setSubId(rset.getString("SUB_ID"));
					cs.setClsName(rset.getString("CLS_NAME"));
					cs.setName(rset.getString("NAME"));
					cs.setClsStudent(rset.getString("CLS_STUDENT"));
					cs.setClsMax(rset.getInt("CLS_MAX"));
					cs.setClsStart(rset.getDate("CLS_START"));
					cs.setClsEnd(rset.getDate("CLS_END"));	
					
					list.add(cs);
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
				
				rset = pstmt.executeQuery();
				
				list = new ArrayList<>();
				while(rset.next()) {
					ClassSubject cs = new ClassSubject();
					
					cs.setSubId(rset.getString("SUB_ID"));
					cs.setClsName(rset.getString("CLS_NAME"));
					cs.setName(rset.getString("NAME"));
					cs.setClsStudent(rset.getString("CLS_STUDENT"));
					cs.setClsMax(rset.getInt("CLS_MAX"));
					cs.setClsStart(rset.getDate("CLS_START"));
					cs.setClsEnd(rset.getDate("CLS_END"));	
					
					list.add(cs);
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

	public ArrayList<HashMap<String, Object>> selectStudent(Connection con, String classNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		
		String query = prop.getProperty("selectStudent");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, classNum);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			while(rset.next()) {
				HashMap<String, Object> hmap = new HashMap<String, Object>();
				Member m = new Member();
				Student s = new Student();
				
				m.setUserNo(rset.getInt("USER_NO"));
				m.setName(rset.getString("NAME"));
				s.setSchool(rset.getString("SCHOOL"));
				s.setGrade(rset.getInt("GRADE"));
				m.setPhone(rset.getString("PHONE"));				
				
				hmap.put("member", m);
				hmap.put("student", s);
				
				list.add(hmap);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public ArrayList<Attendance> selectAttendList(Connection con, String name) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Attendance> list = null;
		
		String query = prop.getProperty("selectAttendList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, name);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Attendance>();
			while(rset.next()) {
				Attendance a = new Attendance();
				
				a.setAttDate(rset.getDate("ATT_DATE"));
				a.setAttStatus(rset.getString("ATT_STATUS"));
				
				list.add(a);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return list;
	}

	public String selectAttendReason(Connection con, String classNum, String day, String userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String reason = "";
		
		String month = day.substring(0, 2);
		String date = day.substring(3);
		String toDate = month + date;
		
		String query = prop.getProperty("selectAttendReason");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, toDate);
			pstmt.setString(2, userNo);
			pstmt.setString(3, classNum);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				reason = rset.getString("ATT_DETAIL");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
	
		return reason;
	}

	public int updateAttendReason(Connection con, String classNum, String day, int userNo, String content) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String month = day.substring(0, 2);
		String date = day.substring(3);
		String toDate = month + date;
		
		String query = prop.getProperty("updateAttendReason");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, content);
			pstmt.setString(2, toDate);
			pstmt.setInt(3, userNo);
			pstmt.setString(4, classNum);
			
			result = pstmt.executeUpdate();			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}



	

}
