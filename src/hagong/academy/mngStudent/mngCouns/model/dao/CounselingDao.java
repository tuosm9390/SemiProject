package hagong.academy.mngStudent.mngCouns.model.dao;

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

import hagong.academy.mngStudent.mngCouns.model.vo.MemberCouns;

public class CounselingDao {
	Properties prop = new Properties();
	
	public CounselingDao() {
		String fileName = CounselingDao.class.getResource("/sql/couns.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<MemberCouns> counsList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<MemberCouns> counsList = null;
		
		String query = prop.getProperty("selectCounsList");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			counsList = new ArrayList<MemberCouns>();
			
			while(rset.next()) {
				MemberCouns mc = new MemberCouns();
				
				mc.setUserId(rset.getString("USER_ID"));
				
				counsList.add(mc);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		
		return counsList;
	}

	public ArrayList<MemberCouns> selectCount(Connection con, ArrayList<MemberCouns> counsList) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<MemberCouns> counsCountList = null;
		
		String query = prop.getProperty("selectCount");
		
		try {
			stmt = con.createStatement();
		
			rset = stmt.executeQuery(query);
			
			counsCountList = new ArrayList<MemberCouns>();
			
			while(rset.next()) {
				MemberCouns mc = new MemberCouns();
				
				mc.setCount(rset.getInt(1));
				mc.setUserId(rset.getString("USER_ID"));
				
				counsCountList.add(mc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(stmt);
			close(rset);
		}
		
		for(int i = 0; i < counsList.size(); i++) {
			
			for(int j = 0; j < counsCountList.size(); j++) {
				
				if(counsList.get(i).getUserId().equals(counsCountList.get(j).getUserId())) {
					counsList.get(i).setCount(counsCountList.get(j).getCount());
				}
				
			}
			
		}
		
		
		
		return counsList;
	}

	public MemberCouns selectRecentDate(Connection con, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MemberCouns mc = null;
		
		String query = prop.getProperty("recentlyDate");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				mc = new MemberCouns();
				if(rset.getDate(1) != null) {
					mc.setCouDate(rset.getDate(1));					
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return mc;
	}

	public MemberCouns selectUserInfo(Connection con, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MemberCouns mc = null;
		
		String query = prop.getProperty("selectName");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				mc = new MemberCouns();
				
				mc.setName(rset.getString("NAME"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return mc;
	}

}
























