package com.sayproject.controller.Main.Member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sayproject.controller.Action;

public class MemberAddInfoAction implements Action {
	private static final String CHARSET = "utf-8";

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding(CHARSET);
		/******** 일반, 카카오 회원이 처음 가입하였을 경우 추가 정보 입력 페이지로 이동하게 한다. *******/

		String loginType = request.getParameter("loginType");
		HttpSession session = request.getSession();
		session.setAttribute("grade", "personal");

		if (loginType.equals("member")) {
			session.setAttribute("loginType", "member");
			RequestDispatcher dis = request.getRequestDispatcher("WEB-INF/views/Main/Login/MemberAddInfo.jsp");
			dis.forward(request, response);
		} else if (loginType.equals("kakao")) {
			session.setAttribute("loginType", "kakao");
			RequestDispatcher dis = request.getRequestDispatcher("WEB-INF/views/Main/Login/MemberAddInfo.jsp");
			dis.forward(request, response);
		} else {
			response.sendRedirect("/Main.say?c=login");
		}

	}
}