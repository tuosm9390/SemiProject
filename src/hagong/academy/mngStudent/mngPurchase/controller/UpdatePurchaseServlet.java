package hagong.academy.mngStudent.mngPurchase.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import hagong.academy.mngStudent.mngPurchase.model.service.PurchaseService;

@WebServlet("/aupdateAll.pur")
public class UpdatePurchaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdatePurchaseServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		String[] purchaseNos = request.getParameter("selectNos").split(",");
		int[] requestNos = new int[purchaseNos.length];
		for(int i = 0; i < purchaseNos.length; i++) {
			requestNos[i] = Integer.parseInt(purchaseNos[i]);
		}
		
		int result = 0;
		if(type.equals("donePay")) {
			result = new PurchaseService().updateStatus(requestNos);
		} else if(type.equals("sendBill")) {
			result = new PurchaseService().updateBill(requestNos);
		} else if(type.equals("sendRecipt")) {
			result = new PurchaseService().updateRecipt(requestNos);
		}
		
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
