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

	public Notice selectOne(int num) {

		Connection con = getConnection();
		
		int result = 0;
		
		Notice n = new NoticeDao().selectOne(con, num);
		
		if(n != null) {
			result = new NoticeDao().updateCount(con, n.getNno());
					
			if(result > 0) {
				commit(con);
			}else {
				rollback(con);
			}
		}
		
		close(con);
		
		return n;
	}

//	public Notice insertNotice(Notice n) {
//
//		Connection con = getConnection();
//		
//		int result = new NoticeDao().insertNotice(con, n);
//		
//		if(result > 0) {
//			commit(con);
//		}else {
//			rollback(con);
//		}
//		
//		close(con);
//		
//		return result;
//	}
	
	public int updateNotice(Notice n) {
		Connection con = getConnection();
		
		int result = new NoticeDao().updateNotice(con, n);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int deleteNotice(String nno) {

		Connection con = getConnection();
		
		int result = new NoticeDao().deleteNotice(con, nno);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	
	
}
























