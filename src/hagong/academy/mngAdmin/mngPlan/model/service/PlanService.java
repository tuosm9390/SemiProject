package hagong.academy.mngAdmin.mngPlan.model.service;

import static hagong.common.JDBCTemplate.close;
import static hagong.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import hagong.academy.mngAdmin.mngPlan.model.dao.PlanDao;
import hagong.academy.mngAdmin.mngPlan.model.vo.Plan;

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

}
