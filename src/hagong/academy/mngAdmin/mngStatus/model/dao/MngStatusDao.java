package hagong.academy.mngAdmin.mngStatus.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import static hagong.common.JDBCTemplate.*;

import hagong.academy.mngAdmin.mngStatus.model.vo.MngStatus;

public class MngStatusDao {
	private Properties prop = new Properties();
	public MngStatusDao(){
		String fileName = MngStatusDao.class.getResource("/sql/admin/admin-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public MngStatus selectList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		MngStatus status = null;
		
		String query = prop.getProperty("selectCondition");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				
				status = new MngStatus();
				
				status.setAllStudent(rset.getInt("ALL_STUDENT"));
				status.setEnrollDate(rset.getInt("ENROLL_COUNT"));
				status.setLeaveDate(rset.getInt("LEAVE_COUNT"));
				
				status.setInFriend(rset.getInt("INFRIEND"));
				status.setInInternet(rset.getInt("ININTERNET"));
				status.setInPicket(rset.getInt("INPICKET"));
				status.setInPcard(rset.getInt("INPCARD"));
				status.setInEtc(rset.getInt("INETC"));
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return status;
	}

}
