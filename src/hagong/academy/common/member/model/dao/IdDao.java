package hagong.academy.common.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static hagong.common.JDBCTemplate.*;

public class IdDao {

	public int idCheck(Connection con, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = "SELECT COUNT(*) FROM MEMBER WHERE USER_ID = ?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
 		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public int refIdCheck(Connection con, String refId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = "SELECT COUNT(*) FROM MEMBER WHERE USER_ID = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, refId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
 		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public int selectRefNo(Connection con, String refId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//부모타입이 아닌 아이디가 있으면 -1 반환
		int result = -1;
		
		String query = "SELECT USER_NO FROM MEMBER WHERE USER_ID = ? AND USER_TYPE = 'PARENT'";
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, refId);
			rset = pstmt.executeQuery();
			
			//부모타입의 아이디가 있으면 유저번호 반환
			while(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return result;
	}

}
