package hagong.academy.mngClass.mngCS.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import hagong.academy.mngClass.mngCS.model.vo.MemberCouns;

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
		
		return counsList;
	}

}
























