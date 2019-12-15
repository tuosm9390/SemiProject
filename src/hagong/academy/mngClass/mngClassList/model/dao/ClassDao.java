package hagong.academy.mngClass.mngClassList.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

public class ClassDao {
	private Properties prop = new Properties();
	
	public ClassDao() {
		String fileName = ClassDao.class.getResource("/sql/class/class-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Class> selectClassList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Class> list = null;
		
		String query = prop.getProperty("selectClassList");
		
		
		
		return list;
	}

}
