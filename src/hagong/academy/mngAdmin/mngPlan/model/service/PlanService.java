package hagong.academy.mngAdmin.mngPlan.model.service;

import static hagong.common.JDBCTemplate.close;
import static hagong.common.JDBCTemplate.commit;
import static hagong.common.JDBCTemplate.getConnection;
import static hagong.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import hagong.academy.mngAdmin.mngPlan.model.dao.PlanDao;
import hagong.academy.mngAdmin.mngPlan.model.vo.Plan;
import hagong.academy.mngClass.mngClassList.model.dao.ClassDao;

public class PlanService {

	public HashMap<String, Object> selectPlan() {
		Connection con = getConnection();
		
		ArrayList<String> title = new PlanDao().selectTitle(con);
		ArrayList<ArrayList<Plan>> content = new PlanDao().selectPlan(con, title);
		
		HashMap<String, Object> hmap = new HashMap<>();
		
		hmap.put("title", title);
		hmap.put("content", content);		
		
		close(con);
		
		return hmap;
	}
	
	public int insertPlan(String title, ArrayList<String> content) {
		Connection con = getConnection();
		
		int result = new PlanDao().insertPlan(con, title, content);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int deletePlan(String deleteTitle) {
		Connection con = getConnection();
		
		int result = new PlanDao().deletePlan(con, deleteTitle);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public HashMap<String, Object> selectByYear(String year) {
		Connection con = getConnection();
		
		ArrayList<String> title = new PlanDao().selectTitleByYear(con, year);
		ArrayList<ArrayList<Plan>> content = new PlanDao().selectContentByYear(con, year, title);
		
		HashMap<String, Object> hmap = new HashMap<>();
		
		hmap.put("title", title);
		hmap.put("content", content);		
		
		close(con);
		
		return hmap;
	}

}
