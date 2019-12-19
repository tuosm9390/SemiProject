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

	public int insertPlan(Connection con, String title, ArrayList<String> content) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPlan");
			
			for(int i=0; i<content.size(); i++) {
				
				try {
					pstmt = con.prepareStatement(query);
					pstmt.setString(1, title);
					
					switch(i+1) {
					case 1 : pstmt.setString(2, "190101");
							 pstmt.setString(3, "190131"); break;
					case 2 : pstmt.setString(2, "190201"); 
							 pstmt.setString(3, "190228"); break;
					case 3 : pstmt.setString(2, "190301");
							 pstmt.setString(3, "190330"); break;
					case 4 : pstmt.setString(2, "190401");
							 pstmt.setString(3, "190430"); break;
					case 5 : pstmt.setString(2, "190501");
							 pstmt.setString(3, "190530"); break;
					case 6 : pstmt.setString(2, "190601");
							 pstmt.setString(3, "190630"); break;
					case 7 : pstmt.setString(2, "190701");
							 pstmt.setString(3, "190730"); break;
					case 8 : pstmt.setString(2, "190801");
							 pstmt.setString(3, "190830"); break;
					case 9 : pstmt.setString(2, "190901");
							 pstmt.setString(3, "190930"); break;
					case 10 : pstmt.setString(2, "191001");
							  pstmt.setString(3, "191030"); break;
					case 11 : pstmt.setString(2, "191101");
							  pstmt.setString(3, "191130"); break;
					case 12 : pstmt.setString(2, "191201");
							  pstmt.setString(3, "191230"); break;
					}
				
					pstmt.setString(4, content.get(i));
				
					result = pstmt.executeUpdate();
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(pstmt);
				}
				
			}
		
		
		return result;
	}

	public int deletePlan(Connection con, String deleteTitle) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deletePlan");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, deleteTitle);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public ArrayList<Plan> selectByYear(Connection con, String year) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Plan> list = null;
		
		String query = prop.getProperty("selectByYear");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(year));
			
			rset = pstmt.executeQuery();
			
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
			close(pstmt);
			close(rset);
		}
		
		
		return list;
	}

	public ArrayList<String> selectTitleByYear(Connection con, String year) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<String> list = null;
		
		String query = prop.getProperty("selectTitleByYear");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(year));
			
			rset = pstmt.executeQuery(query);
			
			list = new ArrayList<>();
			while(rset.next()) {
				list.add(rset.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		 
		
		return list;
	}

	public ArrayList<ArrayList<Plan>> selectContentByYear(Connection con, String year, ArrayList<String> title) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ArrayList<Plan>> list = null;
		
		String query = prop.getProperty("selectPlanByYear");
		
		try {
			pstmt = con.prepareStatement(query);
			
			list = new ArrayList<ArrayList<Plan>>();
			for(int i=0; i<title.size(); i++) {
				pstmt.setString(1, title.get(i));
				pstmt.setInt(2, Integer.parseInt(year));
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
