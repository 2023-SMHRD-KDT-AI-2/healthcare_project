package com.sayproject.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sayproject.controller.Main.LoginAction;
import com.sayproject.controller.Main.LogoutAction;
import com.sayproject.controller.Main.MainAction;
import com.sayproject.controller.Main.Member.MemberAddInfoAction;
import com.sayproject.controller.Main.Member.PersonalMemberAddInfoInputDBAction;
import com.sayproject.controller.Main.Member.GeneralLogin.GeneralIDCheckAction;
import com.sayproject.controller.Main.Member.GeneralLogin.GeneralLoginDbCheckAction;
import com.sayproject.controller.Main.Member.KakaoLogin.KakaoLoginDbCheckAction;
import com.sayproject.controller.Main.Member.KakaoLogin.KakaoLoginRedirectAction;

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
		// Main page 로 이동
		if (cmd.equals("main")) {
			return new MainAction();
		}
		// Login 페이지로 이동
		if (cmd.equals("login")) {
			return new LoginAction();
		}
		// Logout 처리 session 삭제
		if (cmd.equals("logout")) {
			return new LogoutAction();
		}
		// 카카오나 일반회원 첫 로그인 시에 추가 정보 입력 페이지
		if (cmd.equals("memberAddInfo")) {
			return new MemberAddInfoAction();
		}
		// 카카오 로그인 code, token 처리
		if (cmd.equals("kakao")) {
			return new KakaoLoginRedirectAction();
		}
		// 카카오 정보가 디비에 있는지 확인
		if (cmd.equals("kakaoCheck")) {
			return new KakaoLoginDbCheckAction();
		}
		// 회원가입시 아이디 중복값 체크
		if (cmd.equals("generalIDCheck")) {
			return new GeneralIDCheckAction();
		}
		// 추가 정보 입력 페이지에서 받은 정보를 디비에 입력하는 곳
		if (cmd.equals("personalMemberAddInfo")) {
			return new PersonalMemberAddInfoInputDBAction();
		}
		return new LoginAction();
	}
}
