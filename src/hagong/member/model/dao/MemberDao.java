package hagong.member.model.dao;

import static hagong.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import hagong.member.model.vo.Member;

import lombok.extern.log4j.Log4j2;

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
			pstmt.setString(1, requestMember.getMemberId());
			pstmt.setString(2, requestMember.getMemberPwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Member();
				
				loginUser.setMemberNo(rset.getInt("MEMBER_NO"));
				loginUser.setMemberName(rset.getString("MEMBER_NAME"));
				loginUser.setMemberId(rset.getString("MEMBER_ID"));
				loginUser.setMemberBirth(rset.getDate("MEMBER_BIRTH"));
				loginUser.setMemberPhone(rset.getString("MEMBER_PHONE"));
				loginUser.setMemberAddress(rset.getString("MEMBER_ADDRESS"));
				loginUser.setEmail(rset.getString("EMAIL"));
				loginUser.setMemberFileId(rset.getString("MEMBER_FILE_ID"));
				loginUser.setParentsNo(rset.getInt("PARENTS_NO"));
				loginUser.setEnrollDate(rset.getDate("ENROLL_DATE"));
				loginUser.setWithdrawDate(rset.getDate("WITHDRAW_DATE"));
				loginUser.setStatus(rset.getString("STATUS"));
				loginUser.setInflowPath(rset.getString("INFLOW_PATH"));
				loginUser.setMemberPart(rset.getString("MEMBER_PART"));
				loginUser.setMemberPwd(rset.getString("MEMBER_PWD"));
		
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return loginUser;
	}

}