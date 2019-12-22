package hagong.academy.mngClass.mngSatisfy.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import hagong.academy.mngClass.mngSatisfy.model.service.SatisfyService;
import hagong.academy.mngClass.mngSatisfy.model.vo.SatisfyInfo;

/**
 * Servlet implementation class InsertBenefitServlet
 */
@WebServlet("/ainsert.ben")
public class InsertBenefitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBenefitServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String benType = request.getParameter("benefitType");
		Double benRate = Double.parseDouble(request.getParameter("benefitRate")) / 100;
		String benCondition = request.getParameter("applyPoint");
		
		SatisfyInfo si = new SatisfyInfo();
		si.setBenType(benType);
		si.setBenRate(benRate);
		si.setBenCondition(benCondition);
		
		int result = new SatisfyService().insertBen(si);
		
		ArrayList<SatisfyInfo> list = null;
		
		if(result > 0) {
			list = new SatisfyService().selectBenList();
		}
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(list, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
