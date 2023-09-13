package com.sayproject.controller.Main;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sayproject.controller.Action;

public class LoginAction implements Action {
	private static final String CHARSET = "utf-8";

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding(CHARSET);

		HttpSession session = request.getSession();

		// login page 로 이동시 자동으로 session 을 삭제한다.
		if (session != null) {
			session.invalidate();
		}
		RequestDispatcher dis = request.getRequestDispatcher("/WEB-INF/views/Main/Login/LoginMain.jsp");
		dis.forward(request, response);
	}
}