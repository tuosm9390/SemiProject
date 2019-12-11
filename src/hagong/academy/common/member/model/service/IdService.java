package hagong.academy.common.member.model.service;

import static hagong.common.JDBCTemplate.*;
import java.sql.Connection;
import hagong.academy.common.member.model.dao.IdDao;

public class IdService {

	public int idCheck(String userId) {
		Connection con = getConnection();
		int result = new IdDao().idCheck(con, userId);
		close(con);
		return result;
	}

}
