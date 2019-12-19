package hagong.client.common.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import hagong.academy.common.member.model.vo.Member;
import hagong.academy.mngClass.mngAttend.model.dao.AttendDao;
import hagong.academy.mngClass.mngClassList.model.vo.Class;
import static hagong.common.JDBCTemplate.*;

public class CommonDao {
	private Properties prop = new Properties();
	
	public CommonDao() {
		String fileName = AttendDao.class.getResource("/sql/client/common-query.properties").getPath();
	
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Class> selectClass(Connection con, String userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Class> list = null;
		
		String query = prop.getProperty("selectClass");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(userNo));
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			while(rset.next()) {
				Class c = new Class();
				
				c.setClsNo(rset.getInt("CLS_NO"));
				c.setSubId(rset.getString("SUB_ID"));
				c.setName(rset.getString("NAME"));
				c.setClsName(rset.getString("CLS_NAME"));
				c.setClsStudent(rset.getString("CLS_STUDENT"));
				c.setClsMax(rset.getInt("CLS_MAX"));
				c.setClsStart(rset.getDate("CLS_START"));
				c.setClsDay(rset.getString("CLS_DAY"));
				c.setClsTime(rset.getString("CLS_TIME"));
				c.setClrNo(rset.getInt("CLR_NO"));
				c.setTuition(rset.getInt("TUITION"));
				c.setClsEnd(rset.getDate("CLS_END"));
				
				list.add(c);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return list;
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
		return loginUser;
	}

}
