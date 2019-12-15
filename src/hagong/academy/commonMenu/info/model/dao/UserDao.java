package hagong.academy.commonMenu.info.model.dao;

import static hagong.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import hagong.academy.commonMenu.info.model.vo.UserDetail;
import hagong.academy.mngStaff.model.vo.StaffDetail;

public class UserDao {
	
	private Properties prop = new Properties();
	
	public UserDao() {
		String fileName = UserDao.class.getResource("/sql/user-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<UserDetail> userDetail(Connection con, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<UserDetail> userDetail = null;
		
		String query = prop.getProperty("userDetail");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, userNo);
			rset = pstmt.executeQuery();
			userDetail = new ArrayList<>();
			
			while(rset.next()) {
				UserDetail ud = new UserDetail();
				ud.setUserNo(rset.getInt("USER_NO"));
				ud.setUserType(rset.getString("USER_TYPE"));
				ud.setUserId(rset.getString("USER_ID"));
				ud.setName(rset.getString("NAME"));
				ud.setBirth(rset.getDate("BIRTH"));
				ud.setPhone(rset.getString("PHONE"));
				ud.setDept(rset.getString("DEPT"));
				ud.setEmail(rset.getString("EMAIL"));
				ud.setAddress(rset.getString("ADDRESS"));
				ud.setStatus(rset.getString("STATUS"));
				ud.setFileNo(rset.getInt("FILE_NO"));
				ud.setFileType(rset.getString("FILE_TYPE"));
				ud.setOriginName(rset.getString("ORIGIN_NAME"));
				ud.setChangeName(rset.getString("CHANGE_NAME"));
				ud.setFilePath(rset.getString("FILE_PATH"));
				ud.setFileStatus(rset.getString("FILE_STATUS"));
				
				userDetail.add(ud);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return userDetail;
	}

}
