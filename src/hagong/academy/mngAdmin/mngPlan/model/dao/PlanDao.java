package hagong.academy.mngAdmin.mngPlan.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import hagong.academy.mngAdmin.mngPlan.model.vo.Plan;
import static hagong.common.JDBCTemplate.*;

public class PlanDao {
	private Properties prop = new Properties();
	
	public PlanDao() {
		String fileName = PlanDao.class.getResource("/sql/admin/plan-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Plan> selectPlan(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Plan> list = null;
		
		String query = prop.getProperty("selectPlan");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<>();
			while(rset.next()) {
				Plan p = new Plan();
				
				p.setCalNo(rset.getInt("CAL_NO"));
				p.setUserNo(rset.getInt("USER_NO"));
				p.setCalTitle(rset.getString("CAL_TITLE"));
				p.setCalStart(rset.getDate("CAL_START"));
				p.setCalEnd(rset.getDate("CAL_END"));
				p.setCalType(rset.getString("CAL_TYPE"));
				p.setCalMemo(rset.getString("CAL_MEMO"));
				p.setDateType(rset.getString("DATE_TYPE"));
				
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return list;
	}

}
