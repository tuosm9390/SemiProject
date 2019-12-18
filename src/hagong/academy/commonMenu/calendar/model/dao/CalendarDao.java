package hagong.academy.commonMenu.calendar.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import hagong.academy.commonMenu.calendar.model.vo.Calendar;
import hagong.academy.mngAdmin.mngStatus.model.dao.MngStatusDao;
import static hagong.common.JDBCTemplate.*;
public class CalendarDao {
	private Properties prop = new Properties();
	
	public CalendarDao() {
		String fileName = MngStatusDao.class.getResource("/sql/calendar/calendar-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public int insertCal(Connection con, Calendar cal) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("insertCal");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cal.getUno());
			pstmt.setString(2,cal.getTitle());
			pstmt.setDate(3, cal.getStart());
			pstmt.setDate(4, cal.getEnd());
			pstmt.setString(5,cal.getType());
			pstmt.setString(6,cal.getContent());
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			
		}
		return result;
		
	}


	public ArrayList<Calendar> selectCal(Connection con, int uno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Calendar> list = null;
		
		String query = prop.getProperty("selectCal");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uno);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Calendar>();
			
			while(rset.next()) {
			  Calendar c = new Calendar();
			  c.setCno(rset.getInt("CAL_NO"));
			  c.setUno(rset.getInt("USER_NO"));
			  c.setTitle(rset.getString("CAL_TITLE"));
			  c.setStart(rset.getDate("CAL_START"));
			  c.setEnd(rset.getDate("CAL_END"));
			  c.setType(rset.getString("CAL_TYPE"));
			  c.setContent(rset.getString("CAL_MEMO"));
			  c.setMdtype(rset.getString("DATE_TYPE"));
			  
			  list.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

}
