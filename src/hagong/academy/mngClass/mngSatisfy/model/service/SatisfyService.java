package hagong.academy.mngClass.mngSatisfy.model.service;

import static hagong.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import hagong.academy.mngClass.mngSatisfy.model.dao.SatisfyDao;
import hagong.academy.mngClass.mngSatisfy.model.vo.SatisfyInfo;

public class SatisfyService {

	public ArrayList<SatisfyInfo> selectList() {
		Connection con = getConnection();
		ArrayList<SatisfyInfo> list = new SatisfyDao().selectList(con);
		
		close(con);
		
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectSatis(int satNo) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new SatisfyDao().selectSatis(con, satNo);
		
		close(con);
		
		return list;
	}

}
