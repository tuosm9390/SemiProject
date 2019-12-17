package hagong.academy.commonMenu.calendar.model.service;

import java.sql.Connection;
import static hagong.common.JDBCTemplate.*;
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

}
