package hagong.academy.mngAdmin.mngLevel.controller;

import java.io.IOException;
import java.lang.ref.ReferenceQueue;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.ws.api.server.Module;

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
		String modifyInfo1 = request.getParameter("modifyInfo1");
		String modifyInfo2 = request.getParameter("modifyInfo2");
		String modifyInfo3 = request.getParameter("modifyInfo3");
		String info1 = request.getParameter("info1");
		String info2 = request.getParameter("info2");
		String info3 = request.getParameter("info3");
		String purchase1 = request.getParameter("purchase1");
		String purchase2 = request.getParameter("purchase2");
		String purchase3 = request.getParameter("purchase3");
		String counseling1 = request.getParameter("counsel1");
		String counseling2 = request.getParameter("counsel2");
		String counseling3 = request.getParameter("counsel3");
		String black1 = request.getParameter("black1");
		String black2= request.getParameter("black2");
		String black3 = request.getParameter("black3");
		String staff1 = request.getParameter("staff1");
		String staff2 = request.getParameter("staff2");
		String staff3 = request.getParameter("staff3");
		String enroll1 = request.getParameter("enroll1");
		String enroll2 = request.getParameter("enroll2");
		String enroll3 = request.getParameter("enroll3");
		String attend1 = request.getParameter("attend1");
		String attend2 = request.getParameter("attend2");
		String attend3 = request.getParameter("attend3");
		String class1 = request.getParameter("class1");
		String class2 = request.getParameter("class2");
		String class3 = request.getParameter("class3");
		String satisfy1 = request.getParameter("satisfy1");
		String satisfy2 = request.getParameter("satisfy2");
		String satisfy3 = request.getParameter("satisfy3");
		String condition1 = request.getParameter("condition1");
		String condition2 = request.getParameter("condition2");
		String condition3 = request.getParameter("condition3");
		String menu1 = request.getParameter("menu1");
		String menu2 = request.getParameter("menu2");
		String menu3 = request.getParameter("menu3");
		String plan1 = request.getParameter("plan1");
		String plan2 = request.getParameter("plan2");
		String plan3 = request.getParameter("plan3");
		String pAtt = request.getParameter("pAtt");
		String sAtt = request.getParameter("sAtt");
		String pScore = request.getParameter("pScore");
		String sScore = request.getParameter("sScore");
		String pSatisfy = request.getParameter("pSatisfy");
		String sSatisfy = request.getParameter("sSatisfy");
		String pReceipt = request.getParameter("pReceipt");
		String sReceipt = request.getParameter("sReceipt");
		
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
		m.setCondition2(condition2);
		m.setCondition3(condition3);
		m.setInfo1(info1);
		m.setInfo2(info2);
		m.setInfo3(info3);
		m.setModifyInfo1(modifyInfo1);
		m.setModifyInfo2(modifyInfo2);
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
		m.setMenu2(menu2);
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
		
		
		
		
		
		
		
		
		
		System.out.println("-------------");
		System.out.println(modifyInfo1);
		System.out.println(modifyInfo2);
		System.out.println(modifyInfo3);
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}