package hagong.academy.mngClass.mngCS.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
				
				css.setClassName(rset.getString("CLS_NAME"));
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return csslist;
	}
	
	
	
}
