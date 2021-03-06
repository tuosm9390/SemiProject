package hagong.academy.mngStudent.mngPurchase.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import hagong.academy.mngStudent.mngPurchase.model.service.PurchaseService;
import hagong.academy.mngStudent.mngPurchase.model.vo.Purchase;

@WebServlet("/adetail.pur")
public class PurchaseDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PurchaseDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int purchaseNo = Integer.parseInt(request.getParameter("purchaseNo"));
		Purchase purchase = new PurchaseService().selectPurchaseDetail(purchaseNo);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		String strNotifyDate = "-";
		String strReciptDate = "-";
		String strRefundDay = "-";
		
		if(purchase.getNotifyDate() != null) {
			strNotifyDate = sdf.format(purchase.getNotifyDate());
		}
		if(purchase.getReciptDate() != null) {
			strReciptDate = sdf.format(purchase.getReciptDate());
		}
		if(purchase.getRefundDay() != null) {
			strRefundDay = sdf.format(purchase.getRefundDay());
		}
		
		purchase.setStrNotifyDate(strNotifyDate);
		purchase.setStrReciptDate(strReciptDate);
		purchase.setStrRefundDay(strRefundDay);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		if(purchase != null) {
			new Gson().toJson(purchase, response.getWriter());
		} else {
			new Gson().toJson("fail", response.getWriter());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
