package com.sayproject.controller.Main.Member.KakaoLogin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sayproject.controller.Action;
import com.sayproject.controller.Script;
import com.sayproject.model.Main.KakaoLogin.KakaoInfo;
import com.sayproject.model.Main.KakaoLogin.KakaoLoginDAO;

public class KakaoLoginAction implements Action {
	private static final String CHARSET = "utf-8";

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding(CHARSET);

		HttpSession session = request.getSession();
		
		// 카카오login페이지 
		String id = request.getParameter("id");
		String nick = request.getParameter("nick");
		String email = request.getParameter("email");
		String age_range = request.getParameter("age_range");
		String birthday = request.getParameter("birthday");
		String profile_image = request.getParameter("profile_image");
		String name = request.getParameter("name");

	
		 
		KakaoInfo info = new KakaoInfo();
		// 카카오 로그인시 가져온 id, email
		info.setEmail(email);
		info.setId(id);
		
		// kakaologin dao(카카오 id, email 데이터 가져오기
		KakaoLoginDAO dao = new KakaoLoginDAO();
		
		//kakaologininfo에 중복값 확인
		int cnt = dao.kakaoLoginInfo(info);
		
		// 데이터가 0이면 데이터 중복값 없음!!
		if (cnt == 0) {
			// 카카오login 세션저장
			session.setAttribute("id", id);
			session.setAttribute("email", email);
			session.setAttribute("nick", nick);
			session.setAttribute("age_range", age_range);
			session.setAttribute("birthday", birthday);
			session.setAttribute("profile_image", profile_image);
			session.setAttribute("name", name);

		} else {
			// 데이터가 1이면 데이터 중복값 있음!!
			Script.href("중복 회원가입 입니다!", "WEB-INF/views/Main/Login/LoginMain.jsp", response);
		}
		// 추가정보입력페이지로 이동
		RequestDispatcher dis = request.getRequestDispatcher("/WEB-INF/views/Main/Login/MemberAddInfo.jsp");
		dis.forward(request, response);
	}
}