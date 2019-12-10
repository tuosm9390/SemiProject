package hagong.academy.commonMenu.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static hagong.common.JDBCTemplate.*;

import hagong.academy.commonMenu.notice.model.dao.NoticeDao;
import hagong.academy.commonMenu.notice.model.vo.Notice;

public class NoticeService {

	public ArrayList<Notice> selectList(){
		Connection con = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectList(con);
		
		close(con);
		
		return list;
	}

	public Notice insertNotice(Notice n) {

		Connection con = getConnection();
		
		int result = new NoticeDao().insertNotice(con, n);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	
	
}
