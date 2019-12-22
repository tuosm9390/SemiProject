package hagong.academy.mngAdmin.mngStatus.model.service;

import static hagong.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import hagong.academy.mngAdmin.mngStatus.model.dao.MngStatusDao;
import hagong.academy.mngAdmin.mngStatus.model.vo.MngStatus;

public class MngStatusService {

	// 현황 조회
	public ArrayList<MngStatus> selectList() {

		Connection con = getConnection();
		ArrayList<MngStatus> list = new ArrayList<MngStatus>();

		MngStatus status = new MngStatusDao().selectList(con);
		if (status != null) {
			list = new MngStatusDao().selectChart(con);
			if(list != null) {
				list.add(status);
				System.out.println("list 확인 : " +list);
			}
		}
		close(con);
		return list;
	}
}
 