package hagong.academy.mngAdmin.mngLevel.model.service;

import hagong.academy.mngAdmin.mngLevel.model.dao.MngLevelDao;
import hagong.academy.mngAdmin.mngLevel.model.vo.MngLevel;
import static hagong.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
public class MngLevelService {
	// 메뉴 업데이트 
	public int updateMngLevel(MngLevel m) {
		Connection con = getConnection();
		
		int result = new MngLevelDao().updateMngLevel(con,m);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return result;
	}

	// 권한 조회
	public ArrayList<MngLevel> selectMngLevel() {
		
		Connection con = getConnection();
		
		ArrayList<MngLevel> list = new MngLevelDao().selectMngLevel(con);
		
		close(con);
		
		return list;
	}
	

}
