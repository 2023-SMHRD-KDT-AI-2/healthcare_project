package com.sayproject.controller.Main.Member.GeneralLogin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sayproject.controller.Action;
import com.sayproject.controller.Script;
import com.sayproject.model.Main.GeneralLgoin.GeneralJoin;
import com.sayproject.model.Main.GeneralLgoin.GeneralJoinDAO;
import com.sayproject.model.Main.GeneralLgoin.GeneralLoginDAO;

public class GeneralLoginAction implements Action {
	private static final String CHARSET = "utf-8";

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding(CHARSET);
		/******** 일반, 카카오 회원이 처음 가입하였을 경우 추가 정보 입력 페이지로 이동하게 한다. *******/

		HttpSession session = request.getSession();
		
		
		// loginMain페이지의 id값 가져오기
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		// ID중복체크
		GeneralJoinDAO dao = new GeneralJoinDAO();
		int cnt= dao.generalIDCheck(id);
		
		System.out.println("로그인 한것 :" + id);
		System.out.println("DB :" +cnt);
		
		
		if(cnt>0) {
			//로그인 성공
			String loginType = request.getParameter("loginType");
			session.setAttribute("loginType", loginType);
			session.setAttribute("idOrEmail", id);
			
			GeneralLoginDAO generalLoginDAO = new GeneralLoginDAO();
			
			//로그인 이후 members테이블에 있는 모든 data 세션화!
			GeneralJoin data = generalLoginDAO.generalSession(id);
			session.setAttribute("address", data.getAddress());
			session.setAttribute("age", data.getAge());
			session.setAttribute("birthday", data.getBirthday());
			session.setAttribute("gredit_card", data.getCredit_card());
			session.setAttribute("expiration", data.getExpiration_date());
			session.setAttribute("gender", data.getGender());
			session.setAttribute("height", data.getHeight());
			session.setAttribute("job", data.getJob());
			session.setAttribute("kaka_id", data.getKaka_id());
			session.setAttribute("nickname", data.getName());
			session.setAttribute("no", data.getNo());
			session.setAttribute("phone", data.getPhone_number());
			session.setAttribute("regist", data.getRegist_day());
			session.setAttribute("trainer", data.getTrainer());
			session.setAttribute("weight", data.getWeight());
			
			
			
			
			
			
			
			Script.href("로그인 성공", "/Members.say?c=input", response);
			
		}else {
			// 로그인 실패
			Script.back("회원계정을 확인하세요", response);
		}
		
		System.out.println(id);
		
		
//		session.setAttribute("grade", "personal");
//
//		if (loginType.equals("member")) {
//			session.setAttribute("loginType", "member");
//			RequestDispatcher dis = request.getRequestDispatcher("WEB-INF/views/Main/Login/MemberAddInfo.jsp");
//			dis.forward(request, response);
//		} else if (loginType.equals("kakao")) {
//			session.setAttribute("loginType", "kakao");
//			RequestDispatcher dis = request.getRequestDispatcher("WEB-INF/views/Main/Login/MemberAddInfo.jsp");
//			dis.forward(request, response);
//		} else {
//			response.sendRedirect("/Main.say?c=login");
//		}

	}
} 


