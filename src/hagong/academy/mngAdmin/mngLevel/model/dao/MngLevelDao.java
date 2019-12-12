package hagong.academy.mngAdmin.mngLevel.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import hagong.academy.mngAdmin.mngLevel.model.vo.MngLevel;

public class MngLevelDao {
	private Properties prop = new Properties();
	
	public MngLevelDao() {
		String fileName = MngLevelDao.class.getResource("/sql/admin/setMeny-query.properties").getPath();
		
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
			pstmt.setString(1, m.getModifyInfo1());
			pstmt.setString(2, m.getModifyInfo2());
			pstmt.setString(3, m.getModifyInfo3());
			pstmt.setString(4, m.getInfo1());
			pstmt.setString(5, m.getInfo1());
			pstmt.setString(6, m.getInfo1());
			pstmt.setString(7, m.getPurchase1());
			pstmt.setString(8, m.getPurchase1());
			pstmt.setString(9, m.getPurchase1());
			pstmt.setString(10, m.getCounseling1());
			pstmt.setString(11, m.getCounseling1());
			pstmt.setString(12, m.getCounseling1());
			pstmt.setString(13, m.getBlack1());
			pstmt.setString(14, m.getBlack1());
			pstmt.setString(15, m.getBlack1());
			pstmt.setString(16, m.getStaff1());
			pstmt.setString(17, m.getStaff1());
			pstmt.setString(18, m.getStaff1());
			pstmt.setString(19, m.getEnroll1());
			pstmt.setString(20, m.getEnroll1());
			pstmt.setString(21, m.getEnroll1());
			pstmt.setString(22, m.getAttend1());
			pstmt.setString(23, m.getAttend1());
			pstmt.setString(24, m.getAttend1());
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}

	

}
