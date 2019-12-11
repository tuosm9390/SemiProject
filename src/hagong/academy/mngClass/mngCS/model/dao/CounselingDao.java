package hagong.academy.mngClass.mngCS.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import hagong.academy.mngClass.mngCS.model.vo.MemberCouns;

import static hagong.common.JDBCTemplate.*;

public class CounselingDao {
	Properties prop = new Properties();
	
	public CounselingDao() {
		String fileName = CounselingDao.class.getResource("/sql/couns.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<MemberCouns> counsList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<MemberCouns> counsList = null;
		
		String query = prop.getProperty("selectCounsList");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			counsList = new ArrayList<MemberCouns>();
			
			while(rset.next()) {
				MemberCouns mc = new MemberCouns();
				
				mc.setUserNo(rset.getInt("USER_NO"));
				
				counsList.add(mc);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		
		return counsList;
	}

}
























