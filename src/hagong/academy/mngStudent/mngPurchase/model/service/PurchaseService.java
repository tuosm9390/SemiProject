package hagong.academy.mngStudent.mngPurchase.model.service;

import static hagong.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import hagong.academy.mngStudent.mngPurchase.model.dao.PurchaseDao;
import hagong.academy.mngStudent.mngPurchase.model.vo.Purchase;
import hagong.academy.mngStudent.mngPurchase.model.vo.SelectClass;
import hagong.academy.mngStudent.mngPurchase.model.vo.SelectDate;

public class PurchaseService {

	public String selectStartDay() {
		Connection con = getConnection();
		String startDay = new PurchaseDao().selectStartDay(con);
		close(con);
		return startDay;
	}

	public ArrayList<SelectClass> selectClass(SelectDate selectDate) {
		Connection con = getConnection();
		ArrayList<SelectClass> selectClass = new PurchaseDao().selectClass(con, selectDate);
		close(con);
		return selectClass;
	}

	public ArrayList<Purchase> selectPurchaseList(SelectDate selectDate) {
		Connection con = getConnection();
		ArrayList<Purchase> purList = new PurchaseDao().selectPurchaseList(con, selectDate);
		close(con);
		return purList;
	}

	public int updateStatus(int[] requestNos, ArrayList<Integer> realPriceList) {
		Connection con = getConnection();
		int result = new PurchaseDao().updateStatus(con, requestNos, realPriceList);
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int updateBill(int[] requestNos) {
		Connection con = getConnection();
		int result = new PurchaseDao().updateBill(con, requestNos);
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int updateRecipt(int[] requestNos) {
		Connection con = getConnection();
		int result = new PurchaseDao().updateRecipt(con, requestNos);
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public Purchase selectPurchaseDetail(int purchaseNo) {
		Connection con = getConnection();
		Purchase purchase = new PurchaseDao().selectPurchaseDetail(con, purchaseNo);
		close(con);
		return purchase;
	}


}
