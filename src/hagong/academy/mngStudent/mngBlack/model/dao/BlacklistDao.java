package hagong.academy.mngStudent.mngBlack.model.dao;
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

import hagong.academy.mngStudent.mngBlack.model.vo.BlacklistInfo;
import hagong.academy.mngStudent.mngCouns.model.dao.CounselingDao;

public class BlacklistDao {
	Properties prop = new Properties();
	
	public BlacklistDao() {
		String fileName = CounselingDao.class.getResource("/sql/blacklist.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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


	public ArrayList<BlacklistInfo> selectBlacklistWithPaging(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<BlacklistInfo> blacklist = null;
		
		//조회를 시작할 행 번호와 마지막 행 번호 계산
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit -1;
		
		String query = prop.getProperty("selectBlacklistWithPaging");
		
		try {
			pstmt = con.prepareStatement(query);
		
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			blacklist = new ArrayList<>();
			while(rset.next()) {
				BlacklistInfo bi = new BlacklistInfo();
				
				bi.setRnum(rset.getInt("RNUM"));
				bi.setName(rset.getString("NAME"));
				bi.setUserId(rset.getString("USER_ID"));
				bi.setSchool(rset.getString("SCHOOL"));
				bi.setGrade(rset.getInt("GRADE"));
				bi.setPhone(rset.getString("PHONE"));
				bi.setUserNo(rset.getInt("BLACK_USER"));
				switch(bi.getGrade()) {
				case 1: bi.setGradeName("중등 1학년");break;
				case 2: bi.setGradeName("중등 2학년");break;
				case 3: bi.setGradeName("중등 3학년");break;
				case 4: bi.setGradeName("고등 1학년");break;
				case 5: bi.setGradeName("고등 2학년");break;
				case 6: bi.setGradeName("고등 3학년");break;
				}
				blacklist.add(bi);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return blacklist;
	}

}





















