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
import hagong.academy.mngStaff.model.vo.StaffFile;

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

	public int updateUserInfo(Connection con, UserDetail user) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateUserInfo");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, user.getUserPwd());
			pstmt.setString(2, user.getPhone());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getAddress());
			pstmt.setInt(5, user.getUserNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertFile(Connection con, ArrayList<StaffFile> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertFile");
		try {
			for(int i = 0; i < fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, fileList.get(i).getOriginName());
				pstmt.setString(2, fileList.get(i).getChangeName());
				pstmt.setString(3, fileList.get(i).getFilePath());
				pstmt.setInt(4, fileList.get(i).getUserNo());
				pstmt.setString(5, fileList.get(i).getFileType());
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int selectFileNo(Connection con, StaffFile staffFile) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int fileNo = 0;
		
		String query = prop.getProperty("selectFileNo");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, staffFile.getChangeName());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				fileNo = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return fileNo;
	}

	public int insertStaffFile(Connection con, StaffFile staffFile) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertStaffFile");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, staffFile.getFileNo());
			pstmt.setInt(2, staffFile.getUserNo());
			pstmt.setString(3, staffFile.getFileType());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int selectProfileCnt(Connection con, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("countProfile");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("CNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateOldProfile(Connection con, int fileNo, int userNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteProfile");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, fileNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
