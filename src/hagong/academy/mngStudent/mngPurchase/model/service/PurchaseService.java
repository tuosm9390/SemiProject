package hagong.academy.mngStudent.mngPurchase.model.service;

import static hagong.common.JDBCTemplate.close;
import static hagong.common.JDBCTemplate.commit;
import static hagong.common.JDBCTemplate.getConnection;
import static hagong.common.JDBCTemplate.rollback;

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

	public int updatePurDetail(Purchase purchase) {
		Connection con = getConnection();
		Purchase newPurchase = new PurchaseDao().selectPurchaseDetail(con, purchase.getPurchaseNo());
		int result = 0;
		
		if(purchase.getPayMemo().equals("student")) {
			purchase.setPayMemo("REFUND");
			/*purchase
			-> pay_status : N --- 수납 처리X 상태
			-> pay_money
			-> rfd_id --- rfd_date(1N3) : C2
			                rfd_date(1N2) : C3
			-> refund_day*/
		} else if(purchase.getPayMemo().equals("academy")) {
			
		} else {
			
		}
		close(con);
		return result;
	}


}
