package hagong.academy.mngStaff.model.dao;

import static hagong.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import hagong.academy.mngStaff.model.vo.Staff;
import hagong.academy.mngStaff.model.vo.StaffFile;

public class InsertStaffDao {
	
	private Properties prop = new Properties();
	
	public InsertStaffDao() {
		String fileName = InsertStaffDao.class.getResource("/sql/staff/insertStaff-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertStaffInfo(Connection con, Staff staff) {
		PreparedStatement pstmt = null; 
		int result = 0;
		
		String query = prop.getProperty("insertStaffInfo");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, staff.getName());
			pstmt.setString(2, staff.getUserId());
			pstmt.setString(3, staff.getUserPwd());
			pstmt.setDate(4, staff.getBirth());
			pstmt.setString(5, staff.getPhone());
			pstmt.setString(6, staff.getAddress());
			pstmt.setString(7, staff.getEmail());
			if(staff.getDept().equals("APPLY") || staff.getDept().equals("DESK")) {
				pstmt.setString(8, "STAFF");
			} else {
				pstmt.setString(8, "TEACHER");
			}
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int selectStaffNo(Connection con, Staff staff) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int staffNo = 0;
		
		String query = prop.getProperty("selectStaffNo");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, staff.getUserId());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				staffNo = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return staffNo;
	}

	public int insertStaffSubInfo(Connection con, Staff staff) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertStaffSubInfo");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, staff.getDept());
			pstmt.setInt(2, staff.getUserNo());
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
			System.out.println(staffFile);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
