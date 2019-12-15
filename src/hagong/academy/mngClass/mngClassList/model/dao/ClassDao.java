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

import hagong.academy.mngClass.mngClassList.model.vo.Class;
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

	public ArrayList<Class> selectClassList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Class> list = null;
		
		String query = prop.getProperty("selectClassList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<>();
			while(rset.next()) {
				Class c = new Class();
				
				c.setClsNo(rset.getInt("CLS_NO"));
				c.setSubName(rset.getString("SUB_NAME"));
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
			close(stmt);
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

}
