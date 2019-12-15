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
import hagong.academy.mngStudent.mngCouns.model.vo.MemberCouns;

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


	public ArrayList<MemberCouns> detailBlacklist(Connection con, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		 ArrayList<MemberCouns> detailBlacklist = null;
		 
		 String query = prop.getProperty("detailBlacklist");
		 
		 try {
			pstmt = con.prepareStatement(query);
		
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			detailBlacklist = new ArrayList<MemberCouns>();
			
			while(rset.next()) {
				MemberCouns mc = new MemberCouns();
				
				mc.setCouNo(rset.getInt("COU_NO"));
				mc.setCouTitle(rset.getString("COU_TITLE"));
				mc.setCouDate(rset.getDate("COU_DATE"));
				mc.setCouUserNo(rset.getInt("COU_USER_NO"));
				mc.setCouType(rset.getString("COU_TYPE"));
				mc.setCouContent(rset.getString("COU_CONTENT"));
				mc.setCouAction(rset.getString("COU_ACTION"));
				mc.setCouBlack(rset.getString("COU_BLACK"));
				mc.setUserNo(rset.getInt("USER_NO"));
				mc.setUserName(rset.getString("USER_NAME"));
				mc.setCouUserName(rset.getString("COU_NAME"));
				
				detailBlacklist.add(mc);
			}
			
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		 
		return detailBlacklist;
	}


	public BlacklistInfo blacklistInfo(Connection con, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		BlacklistInfo userInfo = new BlacklistInfo();
		 
		 String query = prop.getProperty("blacklistInfo");
		 
		 try {
			pstmt = con.prepareStatement(query);
		
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				userInfo.setName(rset.getString("NAME"));
				userInfo.setUserId(rset.getString("USER_ID"));
				userInfo.setSchool(rset.getString("SCHOOL"));
				userInfo.setGrade(rset.getInt("GRADE"));
				userInfo.setPhone(rset.getString("PHONE"));
				userInfo.setUserNo(rset.getInt("BLACK_USER"));
				userInfo.setParentPhone(rset.getString("PE_PHONE"));
				switch(userInfo.getGrade()) {
				case 1: userInfo.setGradeName("중등 1학년");break;
				case 2: userInfo.setGradeName("중등 2학년");break;
				case 3: userInfo.setGradeName("중등 3학년");break;
				case 4: userInfo.setGradeName("고등 1학년");break;
				case 5: userInfo.setGradeName("고등 2학년");break;
				case 6: userInfo.setGradeName("고등 3학년");break;
				}
			}
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return userInfo;
	}


	public ArrayList<BlacklistInfo> searchBlacklistWithPaging(Connection con, int currentPage, int limit,
			String searchCondition, String srchCnt) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<BlacklistInfo> blacklist = null;
		
		//조회를 시작할 행 번호와 마지막 행 번호 계산
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit -1;
		
		String query = "";
		
		if(searchCondition.equals("name")) {
			 query = prop.getProperty("selectBlacklistByName");			
		}else if(searchCondition.equals("userId")) {			
			 query = prop.getProperty("selectBlacklistById");			
		}else if(searchCondition.equals("school")) {
			 query = prop.getProperty("selectBlacklistBySchool");			
		}else if(searchCondition.equals("phone")) {
			 query = prop.getProperty("selectBlacklistByPhone");			
		}else if(searchCondition.equals("grade")){
			 query = prop.getProperty("selectBlacklistByGrade");			
		}
		
		try {
			pstmt = con.prepareStatement(query);
			
			
			pstmt.setString(1, srchCnt);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
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





















