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

import hagong.academy.mngStudent.mngCouns.model.vo.Counseling;
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
				
				//유저아이디가 일치한 행에 대하여 상담횟수 추가
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
				
				mc.setUserName(rset.getString("NAME"));
				mc.setUserNo(rset.getInt(2));
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

	public ArrayList<MemberCouns> srchList(Connection con, String searchCondition, String srchCnt) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<MemberCouns> counsList = null;
		
		String query = "";
		if(searchCondition.equals("name")) {
			query = prop.getProperty("srchByName");
		}else if(searchCondition.equals("userId")) {
			query = prop.getProperty("srchById");			
		}
		
		try {
			pstmt = con.prepareStatement(query);
		
			pstmt.setString(1, srchCnt);
			
			rset = pstmt.executeQuery();
			
			counsList = new ArrayList<>();
			
			while(rset.next()) {
				MemberCouns mc = new MemberCouns();
				
				mc.setUserId(rset.getString("USER_ID"));
				
				counsList.add(mc);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return counsList;
	}

	public int insertCouns(Connection con, Counseling couns) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		
		String query = prop.getProperty("insertCouns");
		
		try {
			pstmt = con.prepareStatement(query);
		
			pstmt.setString(1, couns.getCouTitle());
			pstmt.setDate(2, couns.getCouDate());
			pstmt.setInt(3, couns.getCouUserNo());
			pstmt.setInt(4, couns.getUserNo());
			pstmt.setString(5, couns.getCouType());
			pstmt.setString(6, couns.getCouContent());
			pstmt.setString(7, couns.getCouAction());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<MemberCouns> detailCouns(Connection con, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<MemberCouns> detailCouns = null;
		
		String query = prop.getProperty("selectDetailCouns");
		
		try {
			pstmt = con.prepareStatement(query);
		
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			detailCouns = new ArrayList<MemberCouns>();
			while(rset.next()) {
				MemberCouns mc = new MemberCouns();
				
				mc.setCouNo(rset.getInt("COU_NO"));
				mc.setCouTitle(rset.getString("COU_TITLE"));
				mc.setCouDate(rset.getDate("COU_DATE"));
				mc.setCouUserNo(rset.getInt("COU_USER_NO"));
				mc.setUserNo(rset.getInt("C.USER_NO"));
				mc.setCouType(rset.getString("COU_TYPE"));
				mc.setCouContent(rset.getString("COU_CONTENT"));
				mc.setCouAction(rset.getString("COU_ACTION"));
				mc.setCouBlack(rset.getString("COU_BLACK"));
				mc.setUserName(rset.getString("NAME_1"));
				mc.setCouUserName(rset.getString("NAME"));
				
				detailCouns.add(mc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return detailCouns;
	}

}
























