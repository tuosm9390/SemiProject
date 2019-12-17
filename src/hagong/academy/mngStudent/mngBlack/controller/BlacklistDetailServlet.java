package hagong.academy.mngStudent.mngBlack.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngStudent.mngBlack.model.service.BlacklistService;
import hagong.academy.mngStudent.mngBlack.model.vo.BlacklistInfo;
import hagong.academy.mngStudent.mngCouns.model.vo.MemberCouns;

/**
 * Servlet implementation class BlacklistDetailServlet
 */
@WebServlet("/detail.black")
public class BlacklistDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlacklistDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("num"));
		
		HashMap<String, Object> hmap = new BlacklistService().detailBlacklist(userNo);

		
		
		String page = "";

		if(hmap != null) {
			ArrayList<MemberCouns> detailBlacklist = (ArrayList<MemberCouns>) hmap.get("detailBlacklist");
			BlacklistInfo userInfo = (BlacklistInfo) hmap.get("userInfo");

			page = "viewAcademy/mngStudent/mngBlack/blacklistDetail.jsp";
			request.setAttribute("detailBlacklist", detailBlacklist);
			request.setAttribute("userInfo", userInfo);
		}else {
			page = "viewAcademy/common/commonError.jsp";
			request.setAttribute("msg", "블랙리스트 상세보기 실패");
		}

		request.getRequestDispatcher(page).forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
