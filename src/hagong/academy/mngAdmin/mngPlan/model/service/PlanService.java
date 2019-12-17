package hagong.academy.mngAdmin.mngPlan.model.service;

import static hagong.common.JDBCTemplate.close;
import static hagong.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import hagong.academy.mngAdmin.mngPlan.model.dao.PlanDao;
import hagong.academy.mngAdmin.mngPlan.model.vo.Plan;

public class PlanService {

	public ArrayList<Plan> selectPlan() {
		Connection con = getConnection();
		
		ArrayList<Plan> list = new PlanDao().selectPlan(con);
		
		close(con);
		
		return list;
	}

}
