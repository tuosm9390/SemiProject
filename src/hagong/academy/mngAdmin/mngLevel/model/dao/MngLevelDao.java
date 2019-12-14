package hagong.academy.mngAdmin.mngLevel.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import hagong.academy.mngAdmin.mngLevel.model.vo.MngLevel;
import static hagong.common.JDBCTemplate.*;
public class MngLevelDao {
	private Properties prop = new Properties();
	
	public MngLevelDao() {
		String fileName = MngLevelDao.class.getResource("/sql/admin/setMenu-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		}catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int updateMngLevel(Connection con, MngLevel m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateMngLevel");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, m.getModifyInfo1());
			pstmt.setInt(2, m.getModifyInfo2());
			pstmt.setInt(3, m.getModifyInfo3());
			pstmt.setInt(4, m.getInfo1());
			pstmt.setInt(5, m.getInfo2());
			pstmt.setInt(6, m.getInfo3());
			pstmt.setInt(7, m.getPurchase1());
			pstmt.setInt(8, m.getPurchase2());
			pstmt.setInt(9, m.getPurchase3());
			pstmt.setInt(10, m.getCounseling1());
			pstmt.setInt(11, m.getCounseling2());
			pstmt.setInt(12, m.getCounseling3());
			pstmt.setInt(13, m.getBlack1());
			pstmt.setInt(14, m.getBlack2());
			pstmt.setInt(15, m.getBlack3());
			pstmt.setInt(16, m.getStaff1());
			pstmt.setInt(17, m.getStaff2());
			pstmt.setInt(18, m.getStaff3());
			pstmt.setInt(19, m.getEnroll1());
			pstmt.setInt(20, m.getEnroll2());
			pstmt.setInt(21, m.getEnroll3());
			pstmt.setInt(22, m.getAttend1());
			pstmt.setInt(23, m.getAttend2());
			pstmt.setInt(24, m.getAttend3());
			pstmt.setInt(25, m.getClass1());
			pstmt.setInt(26, m.getClass2());
			pstmt.setInt(27, m.getClass3());
			pstmt.setInt(28, m.getSatisfy1());
			pstmt.setInt(29, m.getSatisfy2());
			pstmt.setInt(30, m.getSatisfy3());
			pstmt.setInt(31,m.getCondition1() );
			pstmt.setInt(32,m.getCondition2() );
			pstmt.setInt(33,m.getCondition3() );
			pstmt.setInt(34, m.getMenu1());
			pstmt.setInt(35, m.getMenu2());
			pstmt.setInt(36, m.getMenu3());
			pstmt.setInt(37, m.getPlan1());
			pstmt.setInt(38, m.getPlan2());
			pstmt.setInt(39, m.getPlan3());
			pstmt.setInt(40, m.getpAtt());
			pstmt.setInt(41, m.getsAtt());
			pstmt.setInt(42, m.getpScore());
			pstmt.setInt(43, m.getsScore());
			pstmt.setInt(44, m.getpSatisfy());
			pstmt.setInt(45, m.getsSatisfy());
			pstmt.setInt(46, m.getpReceipt());
			pstmt.setInt(47, m.getsReceipt());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		} 
		
		return result;
	}
	public ArrayList<MngLevel> selectMngLevel(Connection con) {
		Statement stmt  = null;
		ResultSet rset = null;
		ArrayList<MngLevel> list = new ArrayList<MngLevel>();
		String query = prop.getProperty("selectMngLevel");
		
		try {
			
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				MngLevel m = new MngLevel();
				m.setAttend1(rset.getInt(1));
				list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return list;
	}

	

}
