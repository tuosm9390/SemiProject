package hagong.academy.mngAdmin.mngPlan.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
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

	public ArrayList<String> selectTitle(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<String> list = null;
		
		String query = prop.getProperty("selectTitle");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<>();
			while(rset.next()) {
				list.add(rset.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		 
		
		return list;
	}
	
	public ArrayList<ArrayList<Plan>> selectPlan(Connection con, ArrayList<String> title) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ArrayList<Plan>> list = null;
		
		String query = prop.getProperty("selectPlan");
		
		try {
			pstmt = con.prepareStatement(query);
			
			list = new ArrayList<ArrayList<Plan>>();
			for(int i=0; i<title.size(); i++) {
				pstmt.setString(1, title.get(i));
				rset = pstmt.executeQuery();
				
				
				ArrayList<Plan> pl = new ArrayList<Plan>();
				
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
					
					pl.add(p);
				}
				
				list.add(pl);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		System.out.println(list);
		return list;
	}

}
