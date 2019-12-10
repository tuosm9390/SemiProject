package hagong.academy.mngAdmin.mngStatus.model.service;



import static hagong.common.JDBCTemplate.*;
import java.sql.Connection;


import hagong.academy.mngAdmin.mngStatus.model.dao.MngStatusDao;
import hagong.academy.mngAdmin.mngStatus.model.vo.MngStatus;

public class MngStatusService {
	
	//현황 조회
	public MngStatus selectList(){
		Connection con = getConnection();
		MngStatus status = new MngStatusDao().selectList(con);
		if(status !=null) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return status;
	}
}
