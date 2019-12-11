package hagong.academy.mngClass.mngAttend.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import hagong.academy.common.member.model.dao.MemberDao;

public class AttendDao {
	private Properties prop = new Properties();
	
	public AttendDao() {
		String fileName = MemberDao.class.getResource("/sql/class/attend-query.properties").getPath();
	
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Object> selectClassList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Object> list = null;
		
		String query = prop.getProperty("selectClassList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
