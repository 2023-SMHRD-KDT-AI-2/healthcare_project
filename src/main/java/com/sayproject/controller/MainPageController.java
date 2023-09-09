package com.sayproject.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sayproject.controller.Main.LoginAction;
import com.sayproject.controller.Main.MainAction;
import com.sayproject.controller.Main.KakaoLogin.KakaoLoginDbCheckAction;
import com.sayproject.controller.Main.KakaoLogin.KakaoLoginRedirectAction;

public class MainPageController {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cmd = "default";
		if (request.getParameter("c") != null) {
			cmd = request.getParameter("c");
			Action action = router(cmd, response);
			action.execute(request, response);
		} else {
			Action action = router(cmd, response);
			action.execute(request, response);
		}
	}

	public Action router(String cmd, HttpServletResponse response) {
		if (cmd.equals("login") || cmd.equals("Login")) {
			return new LoginAction();
		}
		if (cmd.equals("kakao")) {
			return new KakaoLoginRedirectAction();
		}
		if (cmd.equals("kakaoCheck")) {
			return new KakaoLoginDbCheckAction();
		}
		return new MainAction();
	}
}
