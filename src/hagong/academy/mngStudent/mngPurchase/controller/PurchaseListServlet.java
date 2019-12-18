package hagong.academy.mngStudent.mngPurchase.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngStudent.mngPurchase.model.service.PurchaseService;
import hagong.academy.mngStudent.mngPurchase.model.vo.Purchase;
import hagong.academy.mngStudent.mngPurchase.model.vo.SelectClass;
import hagong.academy.mngStudent.mngPurchase.model.vo.SelectDate;

@WebServlet("/alist.pur")
public class PurchaseListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PurchaseListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy-MM");
		String today = dayFormat.format(System.currentTimeMillis());
		String[] todayArr = today.split("-");
		String startDay = new PurchaseService().selectStartDay();
		String[] startDayArr = startDay.split("-");
		
		int endYear = Integer.parseInt(todayArr[0]);
		int endMonth = Integer.parseInt(todayArr[1]);
		int startYear = Integer.parseInt(startDayArr[0]);
		int startMonth = Integer.parseInt(startDayArr[1]);
		int curYear = Integer.parseInt(request.getParameter("year"));
		int curMonth = Integer.parseInt(request.getParameter("month"));
		
		SelectDate selectDate = new SelectDate();
		selectDate.setEndYear(endYear); selectDate.setEndMonth(endMonth);
		selectDate.setStartYear(startYear); selectDate.setStartMonth(startMonth);
		selectDate.setSelectYear(curYear); selectDate.setSelectMonth(curMonth);
		
		ArrayList<SelectClass> selectClass = new PurchaseService().selectClass(selectDate);
		ArrayList<Purchase> purList = new PurchaseService().selectPurchaseList(selectDate);
		
		String page = "";
		if(purList != null) {
			request.setAttribute("selectDate", selectDate);
			request.setAttribute("selectClass", selectClass);
			request.setAttribute("purList", purList);
			page = "viewAcademy/mngStudent/mngPurchase/purchaseList.jsp";
		} else {
			request.setAttribute("errorCode", "purchaseListViewFail");
			page = "viewAcademy/common/commonError.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
