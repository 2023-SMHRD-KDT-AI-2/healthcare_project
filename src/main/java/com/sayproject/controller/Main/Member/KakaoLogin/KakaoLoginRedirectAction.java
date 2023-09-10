package com.sayproject.controller.Main.Member.KakaoLogin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sayproject.controller.Action;

public class KakaoLoginRedirectAction implements Action {
	private static final String CHARSET = "utf-8";

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding(CHARSET);
		/****
		 * 해당 파일은 parameter 값은 code 값을 attribute 에 set 한다.
		 */
		/*
		 * Enumeration<String> names = request.getParameterNames(); Map<String,
		 * String[]> parameterMap = request.getParameterMap(); while
		 * (names.hasMoreElements()) { String parameterName = names.nextElement();
		 * String[] str = parameterMap.get(parameterName); for (String s : str) {
		 * System.out.printf("%s : %s\n", parameterName, s); } }
		 */
		request.setAttribute("code", request.getParameter("code"));

		RequestDispatcher dis = request.getRequestDispatcher("/WEB-INF/views/Main/Login/KakaoLogin/MemberKakaoRedirectUri.jsp");
		dis.forward(request, response);
	}
}