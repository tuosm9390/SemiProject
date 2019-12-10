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
			
			if(rset.next()) {
				status = new MngStatus();
				status.setAllStudent(rset.getInt("ALL_STUDENT"));
				status.setEnrollDate(rset.getInt("ENROLL_COUNT"));
				status.setLeaveDate(rset.getInt("LEAVE_COUNT"));
				
				status.setMidKor(rset.getInt("MKOR"));
				status.setMidEng(rset.getInt("MENG"));
				status.setMidMath(rset.getInt("MMATH"));
				status.setMidSocial(rset.getInt("MSOCIAL"));
				status.setMidScience(rset.getInt("MSCIENCE"));
				status.setMidForeign(rset.getInt("MFOREIGN"));
				status.setMidEtc(rset.getInt("METC"));
				
				status.setHighKor(rset.getInt("HKOR"));
				status.setHighEng(rset.getInt("HENG"));
				status.setHighMath(rset.getInt("HMATH"));
				status.setHighSocial(rset.getInt("HSOCIAL"));
				status.setHighScience(rset.getInt("HSCIENCE"));
				status.setHighForeign(rset.getInt("HFOREIGN"));
				status.setHighEtc(rset.getInt("HETC"));
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
