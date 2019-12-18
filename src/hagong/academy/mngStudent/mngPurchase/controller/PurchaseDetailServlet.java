package hagong.academy.mngStudent.mngPurchase.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngStudent.mngPurchase.model.vo.Purchase;

@WebServlet("/adetail.pur")
public class PurchaseDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PurchaseDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int purchaseNo = Integer.parseInt(request.getParameter("purchaseNo"));
		String purchaseList = request.getParameter("purchaseList");
		System.out.println(purchaseList);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
