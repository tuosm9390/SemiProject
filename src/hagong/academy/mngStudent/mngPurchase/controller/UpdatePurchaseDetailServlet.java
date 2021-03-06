package hagong.academy.mngStudent.mngPurchase.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import hagong.academy.mngStudent.mngPurchase.model.service.PurchaseService;
import hagong.academy.mngStudent.mngPurchase.model.vo.Purchase;

@WebServlet("/aupdate.pur")
public class UpdatePurchaseDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdatePurchaseDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int purchaseNo = Integer.parseInt(request.getParameter("selectNos"));
		String payMemo = request.getParameter("payMemo");
		String payDetail = request.getParameter("payDetail");
		String payPrice = request.getParameter("payPrice");
		
		Purchase purchase = new Purchase();
		purchase.setPurchaseNo(purchaseNo);
		
		if(payMemo.equals("student")) {
			purchase.setPayMemo("student");
			java.sql.Date rfdDay = java.sql.Date.valueOf(payDetail);
			purchase.setRefundDay(rfdDay);
		} else if(payMemo.equals("academy")) {
			purchase.setPayMemo("academy");
			purchase.setFaultDays(Integer.parseInt(payDetail));
		} else {
		}
		purchase.setPayPrice(Integer.parseInt(payPrice));
		
		int result = new PurchaseService().updatePurDetail(purchase);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		if(result > 0) {
			new Gson().toJson("success", response.getWriter());
		} else {
			new Gson().toJson("fail", response.getWriter());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
