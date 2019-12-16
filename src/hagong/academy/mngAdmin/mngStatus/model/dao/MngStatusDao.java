package hagong.academy.mngAdmin.mngStatus.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import com.sun.xml.internal.ws.util.StreamUtils;

import static hagong.common.JDBCTemplate.*;

import hagong.academy.mngAdmin.mngStatus.model.vo.MngStatus;

public class MngStatusDao {
	private Properties prop = new Properties();

	public MngStatusDao() {
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

			while (rset.next()) {

				status = new MngStatus();

				status.setAllStudent1(rset.getInt("ALL_STUDENT1"));
				status.setEnrollDate1(rset.getInt("ENROLL_COUNT1"));
				status.setLeaveDate1(rset.getInt("LEAVE_COUNT1"));

				status.setAllStudent2(rset.getInt("ALL_STUDENT2"));
				status.setEnrollDate2(rset.getInt("ENROLL_COUNT2"));
				status.setLeaveDate2(rset.getInt("LEAVE_COUNT2"));

				status.setAllStudent3(rset.getInt("ALL_STUDENT3"));
				status.setEnrollDate3(rset.getInt("ENROLL_COUNT3"));
				status.setLeaveDate3(rset.getInt("LEAVE_COUNT3"));

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

	
	public ArrayList<MngStatus> selectChart(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectChart");
		ArrayList<MngStatus> list = new ArrayList<>();

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			while (rset.next()) {
			   MngStatus m = new MngStatus();
			   m.settName(rset.getString(1));
			   m.setCnt(rset.getInt(2));
			   list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return list;
	}

}
