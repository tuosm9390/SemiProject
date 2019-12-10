package hagong.academy.mngClass.mngCS.model.service;

import static hagong.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import hagong.academy.mngClass.mngCS.model.dao.CounselingDao;
import hagong.academy.mngClass.mngCS.model.vo.MemberCouns;

public class CounselingService {

	public ArrayList<MemberCouns> counsList() {
		Connection con = getConnection();
		ArrayList<MemberCouns> counsList = new CounselingDao().counsList(con);
		
		close(con);
		
		return counsList;
	}

}
