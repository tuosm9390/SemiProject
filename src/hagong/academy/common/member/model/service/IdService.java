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

	public int refIdCheck(String refId) {
		Connection con = getConnection();
		//아이디 중복 체크
		int result = new IdDao().refIdCheck(con, refId);
		//result가 0이면 아이디 없음, 0이상이면 아이디 있음
		//학부모 번호 뽑아오기
		if(result > 0) {
			int refNo = new IdDao().selectRefNo(con, refId);
			//refNo가 -1이면 부모타입이 아닌 아이디가 있음
			return refNo;
		}
		close(con);
		
		return result;
	}

}
