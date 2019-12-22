package hagong.academy.mngAdmin.mngLevel.model.service;

import static hagong.common.JDBCTemplate.close;
import static hagong.common.JDBCTemplate.commit;
import static hagong.common.JDBCTemplate.getConnection;
import static hagong.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import hagong.academy.mngAdmin.mngLevel.model.dao.MngLevelDao;
import hagong.academy.mngAdmin.mngLevel.model.vo.MenuLevel;
import hagong.academy.mngAdmin.mngLevel.model.vo.MngLevel;
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
	public ArrayList<MenuLevel> selectMngLevel() {
		
		Connection con = getConnection();
		
		ArrayList<MenuLevel> list = new MngLevelDao().selectMngLevel(con);
		
		close(con);
		
		return list;
	}
	// 기본 메뉴 권한
	public int updateDefaultMngLevel() {
		
		Connection con = getConnection();
		
		int result = new MngLevelDao().updateDefaultMngLevel(con);
		
		return result;
	}
	

}
