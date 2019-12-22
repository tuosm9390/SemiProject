package hagong.academy.mngAdmin.mngLevel.controller;

import java.io.IOException;
import java.lang.ref.ReferenceQueue;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.ws.api.server.Module;

import hagong.academy.mngAdmin.mngLevel.model.service.MngLevelService;
import hagong.academy.mngAdmin.mngLevel.model.vo.MngLevel;

/**
 * Servlet implementation class ChangeMenuLevelServlet
 */
@WebServlet("/aupdate.level")
public class UpdateMenuLevelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMenuLevelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("hhh");
		int modifyInfo1 = Integer.parseInt(request.getParameter("modifyInfo1"));
		int modifyInfo3 = Integer.parseInt(request.getParameter("modifyInfo3"));
		int info1 = Integer.parseInt(request.getParameter("info1"));
		int info2 = Integer.parseInt(request.getParameter("info2"));
		int info3 = Integer.parseInt(request.getParameter("info3"));
		int purchase1 = Integer.parseInt(request.getParameter("purchase1"));
		int purchase2 = Integer.parseInt(request.getParameter("purchase2")); 
		int purchase3 = Integer.parseInt(request.getParameter("purchase3"));
		int counseling1 = Integer.parseInt(request.getParameter("counsel1"));
		int counseling2 = Integer.parseInt(request.getParameter("counsel2"));
		int counseling3 = Integer.parseInt(request.getParameter("counsel3"));
		int black1 = Integer.parseInt(request.getParameter("black1"));
		int black2=Integer.parseInt( request.getParameter("black2"));
		int black3 = Integer.parseInt(request.getParameter("black3"));
		int staff1 = Integer.parseInt(request.getParameter("staff1"));
		int staff2 = Integer.parseInt(request.getParameter("staff2"));
		int staff3 = Integer.parseInt(request.getParameter("staff3"));
		int enroll1 = Integer.parseInt(request.getParameter("enroll1"));
		int enroll2 = Integer.parseInt(request.getParameter("enroll2"));
		int enroll3 = Integer.parseInt(request.getParameter("enroll3"));
		int attend1 = Integer.parseInt(request.getParameter("attend1"));
		int attend2 = Integer.parseInt(request.getParameter("attend2"));
		int attend3 = Integer.parseInt(request.getParameter("attend3"));
		int class1 = Integer.parseInt(request.getParameter("class1"));
		int class2 = Integer.parseInt(request.getParameter("class2"));
		int class3 = Integer.parseInt(request.getParameter("class3"));
		int satisfy1 = Integer.parseInt(request.getParameter("satisfy1"));
		int satisfy2 = Integer.parseInt(request.getParameter("satisfy2"));
		int satisfy3 = Integer.parseInt(request.getParameter("satisfy3"));
		int condition1 = Integer.parseInt(request.getParameter("condition1"));

		int condition3 = Integer.parseInt(request.getParameter("condition3"));
		int menu1 =Integer.parseInt( request.getParameter("menu1"));

		int menu3 = Integer.parseInt(request.getParameter("menu3"));
		int plan1 =Integer.parseInt( request.getParameter("plan1"));
		int plan2 = Integer.parseInt(request.getParameter("plan2"));
		int plan3 = Integer.parseInt(request.getParameter("plan3"));
		String ppAtt = request.getParameter("pAtt");
		String ssAtt = request.getParameter("sAtt");
		String ppScore = request.getParameter("pScore");
		String ssScore = request.getParameter("sScore");
		String ppSatisfy =request.getParameter("pSatisfy");
		String ssSatisfy = request.getParameter("sSatisfy");
		String ppReceipt = request.getParameter("pReceipt");
		String ssReceipt = request.getParameter("sReceipt");
		int pAtt;
		int sAtt;
		int pScore;
		int sScore;
		int pSatisfy;
		int sSatisfy;
		int pReceipt;
		int sReceipt;
	
		
		
		if(ppAtt != null) {
			pAtt = 4;
		}else {
			pAtt = 6;
		}
		if(ssAtt!= null){
			sAtt = 5;
		}else {
			sAtt = 6;
		}
		//
		if(ppScore!= null) {
			pScore = 4;
		}else {
			pScore = 6;
		}
		if(ssScore!= null){
			sScore = 5;
		}else {
			sScore = 6;
		}
		//
		if(ppSatisfy!= null) {
			pSatisfy = 4;
		}else {
			pSatisfy = 6;
		}
		if(ssSatisfy!= null){
			sSatisfy = 5;
		}else {
			sSatisfy = 6;
		}
		
		//
		if(ppReceipt!= null) {
			pReceipt = 4;
		}else {
			pReceipt = 6;
		}
		if(ssReceipt!= null){
			sReceipt = 5;
		}else {
			sReceipt = 6;
		}
		
		
		MngLevel m = new MngLevel();
		m.setAttend1(attend1);
		m.setAttend2(attend2);
		m.setAttend3(attend3);
		m.setBlack1(black1);
		m.setBlack2(black2);
		m.setBlack3(black3);
		m.setClass1(class1);
		m.setClass2(class2);
		m.setClass3(class3);
		m.setCondition1(condition1);
		m.setCondition3(condition3);
		m.setInfo1(info1);
		m.setInfo2(info2);
		m.setInfo3(info3);
		m.setModifyInfo1(modifyInfo1);
		m.setModifyInfo3(modifyInfo3);
		m.setPurchase1(purchase1);
		m.setPurchase2(purchase2);
		m.setPurchase3(purchase3);
		m.setCounseling1(counseling1);
		m.setCounseling2(counseling2);
		m.setCounseling3(counseling3);
		m.setStaff1(staff1);
		m.setStaff2(staff2);
		m.setStaff3(staff3);
		m.setEnroll1(enroll1);
		m.setEnroll2(enroll2);
		m.setEnroll3(enroll3);
		m.setAttend1(attend1);
		m.setAttend2(attend2);
		m.setAttend3(attend3);
		m.setSatisfy1(satisfy1);
		m.setSatisfy2(satisfy2);
		m.setSatisfy3(satisfy3);
		m.setMenu1(menu1);
		
		m.setMenu3(menu3);
		m.setPlan1(plan1);
		m.setPlan2(plan2);
		m.setPlan3(plan3);
		m.setpAtt(pAtt);
		m.setsAtt(sAtt);
		m.setpSatisfy(pSatisfy);
		m.setsSatisfy(sSatisfy);
		m.setpScore(pScore);
		m.setsScore(sScore);
		m.setpReceipt(pReceipt);
		m.setsReceipt(sReceipt);
		
		int result = new MngLevelService().updateMngLevel(m);
		String page = "";
		
		if(result > 0 ) {
			System.out.println("되고있음.");
			page = "aselect.level";
			response.sendRedirect(page);
	 
			
		}else {
			System.out.println("에에러");
			page = "/hagong/viewAcademy/common/commonError.jsp";
			request.getRequestDispatcher(page).forward(request, response);
		}
		
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}