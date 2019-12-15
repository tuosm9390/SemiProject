package hagong.academy.mngStaff.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import hagong.academy.mngStaff.model.vo.Staff;
import hagong.academy.mngStaff.model.vo.StaffDetail;
import hagong.academy.mngStaff.model.vo.StaffFile;

import static hagong.common.JDBCTemplate.*;

public class StaffDao {
	
private Properties prop = new Properties();
	
	public StaffDao() {
		String fileName = StaffDao.class.getResource("/sql/staff/staff-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Staff> staffList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Staff> staffList = null;
		
		String query = prop.getProperty("staffList");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			staffList = new ArrayList<>();
			
			while(rset.next()) {
				Staff staff = new Staff();
				staff.setUserNo(rset.getInt("USER_NO"));
				staff.setName(rset.getString("NAME"));
				staff.setUserId(rset.getString("USER_ID"));
				staff.setBirth(rset.getDate("BIRTH"));
				staff.setPhone(rset.getString("PHONE"));
				staff.setAddress(rset.getString("ADDRESS"));
				staff.setEmail(rset.getString("EMAIL"));
				staff.setEnrollDate(rset.getDate("ENROLL_DATE"));
				staff.setStatus(rset.getString("STATUS"));
				staff.setUserType(rset.getString("USER_TYPE"));
					String dept = rset.getString("DEPT");
					if(dept.equals("KOR")) { dept = "국어"; }
					else if(dept.equals("ENG")) { dept = "영어"; }
					else if(dept.equals("MATH")) { dept = "수학"; }
					else if(dept.equals("SOCIAL")) { dept = "사회탐구"; }
					else if(dept.equals("SCIENCE")) { dept = "과학탐구"; }
					else if(dept.equals("FOREIGN")) { dept = "제2외국어"; }
					else if(dept.equals("APPLY")) { dept = "입시"; }
					else { dept = "행정"; }	
				staff.setDept(dept);
				staff.setAge(rset.getInt("AGE"));
				
				staffList.add(staff);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return staffList;
	}

	public ArrayList<StaffDetail> staffDetail(Connection con, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<StaffDetail> staffDetail = null;
		
		String query = prop.getProperty("staffDetail");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, userNo);
			rset = pstmt.executeQuery();
			staffDetail = new ArrayList<>();
			
			while(rset.next()) {
				StaffDetail sd = new StaffDetail();
				sd.setUserNo(rset.getInt("USER_NO"));
				sd.setUserType(rset.getString("USER_TYPE"));
				sd.setUserId(rset.getString("USER_ID"));
				sd.setName(rset.getString("NAME"));
				sd.setBirth(rset.getDate("BIRTH"));
				sd.setAge(rset.getInt("AGE"));
				sd.setPhone(rset.getString("PHONE"));
				sd.setDept(rset.getString("DEPT"));
				sd.setEmail(rset.getString("EMAIL"));
				sd.setAddress(rset.getString("ADDRESS"));
				sd.setStatus(rset.getString("STATUS"));
				sd.setFileNo(rset.getInt("FILE_NO"));
				sd.setFileType(rset.getString("FILE_TYPE"));
				sd.setOriginName(rset.getString("ORIGIN_NAME"));
				sd.setChangeName(rset.getString("CHANGE_NAME"));
				sd.setFilePath(rset.getString("FILE_PATH"));
				sd.setFileStatus(rset.getString("FILE_STATUS"));
				
				staffDetail.add(sd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return staffDetail;
	}

	public int deleteStaff(Connection con, int staffNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteStaff");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, staffNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateStaffInfo(Connection con, Staff staff) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateStaffInfo");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, staff.getName());
			pstmt.setDate(2, staff.getBirth());
			pstmt.setString(3, staff.getPhone());
			pstmt.setString(4, staff.getEmail());
			pstmt.setString(5, staff.getAddress());
			if(staff.getDept().equals("APPLY") || staff.getDept().equals("DESK")) {
				pstmt.setString(6, "STAFF");
			} else {
				pstmt.setString(6, "TEACHER");
			}
			pstmt.setInt(7, staff.getUserNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateStaffSubInfo(Connection con, Staff staff) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateStaffSubInfo");
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
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteFile(Connection con, int staffNo , int deleteFile) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteFile");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, deleteFile);
			pstmt.setInt(2, staffNo);
			result = pstmt.executeUpdate();
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

}
