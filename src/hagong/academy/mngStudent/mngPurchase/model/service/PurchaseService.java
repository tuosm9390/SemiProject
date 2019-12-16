package hagong.academy.mngStudent.mngPurchase.model.service;

import static hagong.common.JDBCTemplate.close;
import static hagong.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import hagong.academy.mngStudent.mngPurchase.model.dao.PurchaseDao;
import hagong.academy.mngStudent.mngPurchase.model.vo.Purchase;
import hagong.academy.mngStudent.mngPurchase.model.vo.SelectDate;

public class PurchaseService {

	public String selectStartDay() {
		Connection con = getConnection();
		String startDay = new PurchaseDao().selectStartDay(con);
		close(con);
		return startDay;
	}

	public ArrayList<Purchase> selectPurchaseList(SelectDate selectDate) {
		Connection con = getConnection();
		ArrayList<Purchase> purList = new PurchaseDao().selectPurchaseList(con, selectDate);
		close(con);
		return purList;
	}

}
