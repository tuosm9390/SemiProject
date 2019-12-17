package hagong.academy.mngStudent.mngPurchase.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import hagong.academy.mngStudent.mngPurchase.model.vo.Purchase;
import hagong.academy.mngStudent.mngPurchase.model.vo.SelectDate;

import static hagong.common.JDBCTemplate.*;

public class PurchaseDao {
	
	private Properties prop = new Properties();
	public PurchaseDao() {
		String fileName = PurchaseDao.class.getResource("/sql/purchase/purchase-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public String selectStartDay(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		String startDay = "";
		
		String query = prop.getProperty("selectStartDay");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				startDay = rset.getString("DAY");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return startDay;
	}

	public ArrayList<Purchase> selectPurchaseList(Connection con, SelectDate selectDate) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Purchase> purList = null;
		
		String selectedDate = selectDate.getSelectYear() + "-" + selectDate.getSelectMonth();
		
		String query = prop.getProperty("selectPurchaseList");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, selectedDate);
			pstmt.setString(2, selectedDate);
			rset = pstmt.executeQuery();
			purList = new ArrayList<Purchase>();
			
			while(rset.next()) {
				Purchase purchase = new Purchase();
				purchase.setPurchaseNo(rset.getInt("PAY_NO"));
				purchase.setStuNo(rset.getInt("USER_NO"));
				purchase.setClassNo(rset.getInt("CLS_NO"));
				purchase.setNotifyDate(rset.getDate("NOTIFY_DATE"));
				purchase.setReciptDate(rset.getDate("RECIPT_DATE"));
				purchase.setRefundDay(rset.getDate("REFUND_DAY"));
				purchase.setPayPrice(rset.getInt("PAY_MONEY"));
				purchase.setClassName(rset.getString("CLS_NAME"));
				purchase.setClassStart(rset.getDate("CLS_START"));
				purchase.setClassEnd(rset.getDate("CLS_END"));
				purchase.setStuId(rset.getString("USER_ID"));
				purchase.setBeneName(rset.getString("NAME"));
				purchase.setRefundPoint(rset.getString("RFD_DATE"));
				purchase.setBeneName(rset.getString("BEN_CONTENT"));
				 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return purList;
	}

}
