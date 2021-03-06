package hagong.academy.commonMenu.calendar.model.service;

import java.sql.Connection;
import static hagong.common.JDBCTemplate.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import hagong.academy.commonMenu.calendar.model.dao.CalendarDao;
import hagong.academy.commonMenu.calendar.model.vo.Calendar;
import static hagong.common.JDBCTemplate.*;
public class CalendarService {

	public int insertCal(Calendar cal) {
		Connection con = getConnection();
		
		int result = new CalendarDao().insertCal(con,cal);
		
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public ArrayList<Calendar> selectCal(int uno) {
		Connection con = getConnection();
		
		ArrayList<Calendar> list = new CalendarDao().selectCal(con,uno);
		
		close(con);
		
		return list;
	}

	public int deleteCal(int cno) {
		Connection con = getConnection();
		
		int result = new CalendarDao().deleteCal(con,cno);
		
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		
		
		return result;
	}

	public int updateCal(Calendar c) {
		Connection con = getConnection();
		
		int result = new CalendarDao().updateCal(con,c);
		
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		
		
		return result;
	}

	public int dropCal(Calendar c) {
		Connection con = getConnection();
		
		int result = new CalendarDao().dropCal(con,c);
		
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		
		
		return result;
	}

}
