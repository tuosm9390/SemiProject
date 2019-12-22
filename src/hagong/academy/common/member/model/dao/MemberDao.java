package hagong.academy.common.member.model.dao;

import static hagong.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import hagong.academy.common.member.model.vo.Member;

public class MemberDao {
	private Properties prop = new Properties();
	
	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
	
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member loginCheck(Connection con, Member requestMember) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		
		String query = prop.getProperty("loginSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestMember.getUserId());
			pstmt.setString(2, requestMember.getUserPwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Member();
				
				loginUser.setUserNo(rset.getInt("USER_NO"));
				loginUser.setName(rset.getString("NAME"));
				loginUser.setUserId(rset.getString("USER_ID"));
				loginUser.setUserPwd(rset.getString("USER_PWD"));
				loginUser.setBirth(rset.getDate("BIRTH"));
				loginUser.setPhone(rset.getString("PHONE"));
				loginUser.setAddress(rset.getString("ADDRESS"));
				loginUser.setEmail(rset.getString("EMAIL"));
				loginUser.setRefUno(rset.getInt("REF_UNO"));
				loginUser.setEnrollDate(rset.getDate("ENROLL_DATE"));
				loginUser.setLeaveDate(rset.getDate("LEAVE_DATE"));
				loginUser.setStatus(rset.getString("STATUS"));
				loginUser.setInflowPath(rset.getString("INFLOW_PATH"));
				loginUser.setUserType(rset.getString("USER_TYPE"));

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		System.out.println(loginUser.getPhone());
		return loginUser;
	}

	public Member loginCheck2(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member requestMember = null;
		
		String query = prop.getProperty("loginSelect2");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getEmail());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				requestMember = new Member();
				
				requestMember.setUserNo(rset.getInt("USER_NO"));
				requestMember.setName(rset.getString("NAME"));
				requestMember.setUserId(rset.getString("USER_ID"));
				requestMember.setUserPwd(rset.getString("USER_PWD"));
				requestMember.setBirth(rset.getDate("BIRTH"));
				requestMember.setPhone(rset.getString("PHONE"));
				requestMember.setAddress(rset.getString("ADDRESS"));
				requestMember.setEmail(rset.getString("EMAIL"));
				requestMember.setRefUno(rset.getInt("REF_UNO"));
				requestMember.setEnrollDate(rset.getDate("ENROLL_DATE"));
				requestMember.setLeaveDate(rset.getDate("LEAVE_DATE"));
				requestMember.setStatus(rset.getString("STATUS"));
				requestMember.setInflowPath(rset.getString("INFLOW_PATH"));
				requestMember.setUserType(rset.getString("USER_TYPE"));
		
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return requestMember;
	}

	public int changePwd(Connection con, Member changePwdMember) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("changePwd");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, changePwdMember.getUserPwd());
			pstmt.setString(2, changePwdMember.getUserId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}	
		
		return result;
	}

	public int allStaff(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int total = 0;
		
		String query = prop.getProperty("allStaff");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				total = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		
		return total;
	}

	public int allStudent(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int total = 0;
		
		String query = prop.getProperty("allStudent");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				total = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		
		return total;
	}

}