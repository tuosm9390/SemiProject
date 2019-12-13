package hagong.academy.mngStaff.model.service;

import static hagong.common.JDBCTemplate.close;
import static hagong.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import hagong.academy.mngStaff.model.dao.StaffDao;
import hagong.academy.mngStaff.model.vo.Staff;
import hagong.academy.mngStaff.model.vo.StaffDetail;

public class StaffService {

	public ArrayList<Staff> staffList() {
		Connection con = getConnection();
		ArrayList<Staff> staffList = new StaffDao().staffList(con);
		close(con);
		return staffList;
	}

	public ArrayList<StaffDetail> staffDetail(int userNo) {
		Connection con = getConnection();
		ArrayList<StaffDetail> staffDetail = new StaffDao().staffDetail(con, userNo);
		close(con);
		return staffDetail;
	}

}
