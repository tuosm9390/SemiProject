package hagong.academy.mngClass.mngAttend.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.common.member.model.vo.Member;
import hagong.academy.mngClass.mngAttend.model.service.AttendService;
import hagong.academy.mngClass.mngAttend.model.vo.Attendance;

@WebServlet("/alistAttend.attend")
public class SelectAttendListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectAttendListServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String classNum = (String) request.getAttribute("classNum");
		ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("studentList");
		
		//멤버 타입만 빼내기
		ArrayList<Member> m = new ArrayList<>();
		
		for(int i=0; i<list.size(); i++) {
			m.add((Member) (list.get(i).get("member")));
		}
		
		//출석부를 저장할 ArrayList 먼저 생성
		//ArrayList<ArrayList<Attendance>> attendList = new ArrayList<>();
		ArrayList<HashMap<String, ArrayList<Attendance>>> attendList = new ArrayList<>();  
		    
		//멤버의 이름만 전송하여 출석부 불러오기
		for(int j=0; j<m.size(); j++) {
			HashMap<String, ArrayList<Attendance>> hmap = new HashMap<>();
			ArrayList<Attendance> attendDetail = new AttendService().selectAttendList(m.get(j).getName());
			
			hmap.put(m.get(j).getName(), attendDetail);
			attendList.add(hmap);
		}

		String page = "";
		if(attendList != null) {
			page = "viewAcademy/mngClass/mngAttend/attendDetail.jsp";
			request.setAttribute("attendList", attendList);
			request.setAttribute("studentList", list);
			request.setAttribute("classNum", classNum);
			request.getRequestDispatcher(page).forward(request, response);
		}else {
			System.out.println("출석부 불러오기 실패!");
		}
		
		
	
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
