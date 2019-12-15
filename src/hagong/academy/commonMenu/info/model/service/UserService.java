package hagong.academy.commonMenu.info.model.service;

import static hagong.common.JDBCTemplate.close;
import static hagong.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import hagong.academy.commonMenu.info.model.dao.UserDao;
import hagong.academy.commonMenu.info.model.vo.UserDetail;

public class UserService {

	public ArrayList<UserDetail> userDetail(int userNo) {
		Connection con = getConnection();
		ArrayList<UserDetail> userDetail = new UserDao().userDetail(con, userNo);
		close(con);
		return userDetail;
	}

}
